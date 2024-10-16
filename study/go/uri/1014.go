package main

import "fmt"

func main(){
	var km int
	var l float64

	fmt.Scanf("%d\n%f", &km, &l)

	fmt.Printf("%.3f km/l\n",(float64(km)/l))
}
