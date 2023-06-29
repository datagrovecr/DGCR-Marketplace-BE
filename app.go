package main

import (
	"context"
	"database/sql"
	"log"
	"reflect"

	"datagrovecr/TQA/tutorial"

	_ "github.com/lib/pq"
)

func run() error {
	ctx := context.Background()

	db, err := sql.Open("postgres", "")
	if err != nil {
		return err
	}

	queries := tutorial.New(db)

	// list all authors
	authors, err := queries.ListClientes(ctx)
	if err != nil {
		return err
	}
	log.Println(authors)

	// create an author
	insertedClient, err := queries.CreateCliente(ctx, tutorial.CreateClienteParams{
		Name: "Brian Kernighan",
		Lastname:  "sdfgs",
		Email: "sdgsd",
		Phone: 12335})
	if err != nil {
		return err
	}
	log.Println(insertedClient)

	// get the author we just inserted
	// fetchedAuthor, err := queries.GetAuthor(ctx, insertedAuthor.ID)
	// if err != nil {
	// 	return err
	// }

	// // prints true
	// log.Println(reflect.DeepEqual(insertedAuthor, fetchedAuthor))
	// return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}