package main

import "fmt"

func main() {
    var a, b float64

    fmt.Scanf("%f\n%f", &a, &b)
    result := ((a*3.5)+(b*7.5))/11

    fmt.Printf("MEDIA = %.5f\n", result)
}
