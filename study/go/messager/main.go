package main

import "github.com/diegogl12/messager/internal/sqsconsumer"

func main() {
	service := sqsconsumer.SetupService()
	sqsconsumer.Start(service)
}
