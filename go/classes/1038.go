package main

import "fmt"

func main() {
	snacks := []float32{4.0, 4.5, 5.0, 2.0, 1.5}

	var id int
	var quantity float32

	fmt.Scanf("%d %f", &id, &quantity)
	fmt.Printf("Total: R$ %.2f\n", snacks[id-1] * quantity)
}
