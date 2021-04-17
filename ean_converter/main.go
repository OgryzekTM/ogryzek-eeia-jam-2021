package main

import (
	"encoding/json"
	"errors"
	"github.com/gorilla/mux"
	"github.com/rs/cors"
	"log"
	"net/http"
	"strings"
)

var (
	IncorrectCodeError = errors.New("incorrect EAN code")
)

type Category struct {
	Text string `json:"text"`
	Code string `json:"code"`
}

type GS1ApiResponse struct {
	Name       string     `json:"name"`
	Categories []Category `json:"categoryDetails"`
}

func EANDecoder(ean string) (*GS1ApiResponse, error) {
	request, err := http.NewRequest("GET", "https://www.eprodukty.gs1.pl/api/v1/products/get_products/"+ean+"/", nil)
	if err != nil {
		return nil, err
	}
	res, err := http.DefaultClient.Do(request)
	if err != nil {
		return nil, err
	}
	defer res.Body.Close()

	var response GS1ApiResponse
	err = json.NewDecoder(res.Body).Decode(&response)
	if err != nil {
		return nil, err
	}
	// TODO: provide more info, handle errors better
	if response.Name == "" {
		// what the heck
		if !strings.HasPrefix(ean, "0") {
			return EANDecoder("0" + ean)
		}
		return nil, IncorrectCodeError
	}
	return &response, nil
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/{EAN}", requestHandler).Methods("GET")
	http.Handle("/", r)

	// FULL YOLO MODE
	corsHandler := cors.New(cors.Options{
		AllowedOrigins:   []string{"*"},
		AllowCredentials: true,
	})
	err := http.ListenAndServe(":8888", corsHandler.Handler(r))
	if err != nil {
		log.Println(err)
	}
}
