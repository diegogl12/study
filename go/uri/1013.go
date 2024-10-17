package main

import "fmt"
import "math"

func main(){
	var a, b, c, result int

	fmt.Scanf("%d %d %d", &a, &b, &c)

	result = bigger(a, b)
	result = bigger(result, c)

	fmt.Printf("%d eh o maior\n", result)
}

func bigger(a int, b int) int{
	result := ( a+b+int( math.Abs( float64(a-b) ) ) )/2
	return result
}