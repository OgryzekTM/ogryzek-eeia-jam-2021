package main

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

type RequestResponse struct {
	Name       string     `json:"name"`
	Categories []Category `json:"categoryDetails"`
}

type ErrorResponse struct {
	Message string `json:"message"`
}

func requestHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	ean, exist := vars["EAN"]
	if !exist {
		w.WriteHeader(http.StatusNotAcceptable)
		response := ErrorResponse{Message: "No EAN code"}
		marshal, err := json.Marshal(response)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			return
		}
		_, err = w.Write(marshal)
		if err != nil {
			log.Println("Error writing response", err)
			return
		}
		return
	}
	eanDecoded, err := EANDecoder(ean)
	if err == IncorrectCodeError {
		w.WriteHeader(http.StatusBadRequest)
		response := ErrorResponse{Message: "No such code in database"}
		marshal, err := json.Marshal(response)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			return
		}
		_, err = w.Write(marshal)
		if err != nil {
			log.Println("Error writing response", err)
			return
		}
		return
	}
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	response := RequestResponse{Name: eanDecoded.Name, Categories: eanDecoded.Categories}
	marshal, err := json.Marshal(response)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	w.WriteHeader(http.StatusOK)
	_, err = w.Write(marshal)
	if err != nil {
		log.Println("Error writing response", err)
		return
	}
}
