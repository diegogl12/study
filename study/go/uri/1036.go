package main

import (
    "fmt"
    "math"
)

func main() {
    var a, b, c float64

    fmt.Scanf("%f %f %f", &a, &b, &c)

    bask := (b*b-4*a*c)

    if a > 0 && bask > 0 {
        r1 := (-(b)+math.Sqrt(bask))/(2*a)
        r2 := (-(b)-math.Sqrt(bask))/(2*a)

        fmt.Printf("R1 = %.5f\nR2 = %.5f\n", r1, r2)
    } else {
        fmt.Println("Impossivel calcular")
    }
}

