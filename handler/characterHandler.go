package handler

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"

	"ngc3/entity"

	"github.com/julienschmidt/httprouter"
)

// Handler untuk mengambil data dari tabel Heroes
func GetHeroes(w http.ResponseWriter, r *http.Request, p httprouter.Params, db *sql.DB) {
	// Query untuk mengambil data dari database
	rows, err := db.Query("SELECT * FROM Heroes")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var heroes []entity.Character // Menggunakan struct dari package entity
	for rows.Next() {
		var id int
		var name, universe, skill, imageURL string
		// Mendekode hasil query ke variabel
		err := rows.Scan(&id, &name, &universe, &skill, &imageURL)
		if err != nil {
			log.Fatal(err)
		}
		heroes = append(heroes, entity.Character{Name: name, Universe: universe, Skill: skill, ImageURL: imageURL})
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(heroes)
}

// Handler untuk mengambil data dari tabel Villains
func GetVillains(w http.ResponseWriter, r *http.Request, p httprouter.Params, db *sql.DB) {
	// Query untuk mengambil data dari database
	rows, err := db.Query("SELECT * FROM Villains")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var villains []entity.Character // Menggunakan struct dari package entity
	for rows.Next() {
		var id int
		var name, universe, skill, imageURL string
		// Mendekode hasil query ke variabel
		err := rows.Scan(&id, &name, &universe, &skill, &imageURL)
		if err != nil {
			log.Fatal(err)
		}
		villains = append(villains, entity.Character{Name: name, Universe: universe, Skill: skill, ImageURL: imageURL})
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(villains)
}

func GetCharacters(w http.ResponseWriter, r *http.Request, p httprouter.Params, db *sql.DB) {
	// Query untuk mengambil data dari kedua tabel
	rows, err := db.Query("SELECT ID, Name, Universe, Skill, ImageURL FROM Heroes UNION ALL SELECT ID, Name, Universe, Skill, ImageURL FROM Villains")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var characters []entity.Character
	for rows.Next() {
		var id int
		var name, universe, skill, imageURL string
		// Mendekode hasil query ke variabel
		err := rows.Scan(&id, &name, &universe, &skill, &imageURL)
		if err != nil {
			log.Fatal(err)
		}
		characters = append(characters, entity.Character{Name: name, Universe: universe, Skill: skill, ImageURL: imageURL})
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(characters)
}
