package main

import ("fmt"
		"math")
func compare(n1 int, n2 int) int{
	sum := float64(n1+n2)
	sub := float64(n1-n2)
	return int((sum + math.Abs(sub))/2.0)
}

func main() {
	var x, y, z int

	fmt.Scanf("%d %d %d", &x, &y, &z)
	greatest := compare(compare(x, y), z)
	fmt.Printf("%d eh o maior\n", greatest)
}

// estender para qualquer quantidade de valores
