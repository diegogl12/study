package main

import "fmt"

const pi = 3.14159

func main(){
	var radius float64

	fmt.Scanf("%f", &radius)

	result := (4.0/3.0)*pi*(radius*radius*radius)

	fmt.Printf("VOLUME = %.3f\n", result)
}
