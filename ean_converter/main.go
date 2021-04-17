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

type GS1ApiResponse struct {
	Name string `json:"name"`
}

func EANToName(ean string) (string, error) {
	request, err := http.NewRequest("GET", "https://www.eprodukty.gs1.pl/api/v1/products/get_products/"+ean+"/", nil)
	if err != nil {
		return "", err
	}
	res, err := http.DefaultClient.Do(request)
	if err != nil {
		return "", err
	}
	defer res.Body.Close()

	var response GS1ApiResponse
	err = json.NewDecoder(res.Body).Decode(&response)
	if err != nil {
		return "", err
	}
	// TODO: provide more info, handle errors better
	if response.Name == "" {
		// what the heck
		if !strings.HasPrefix(ean, "0") {
			return EANToName("0" + ean)
		}
		return "", IncorrectCodeError
	}
	return response.Name, nil
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
