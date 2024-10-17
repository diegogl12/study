package main

import (
    "fmt"
)

func main() {
    var x,pi float64
    pi = 3.14159

    fmt.Scanf("%f",&x)
    fmt.Printf("A=%.4f\n",(x*x*pi))
}
