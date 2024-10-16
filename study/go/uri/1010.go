package main

import "fmt"

func main(){
    var cod1, quant1, cod2, quant2 int
    var val1, val2 float64

    fmt.Scanf("%d %d %f",&cod1, &quant1, &val1)
    fmt.Scanf("%d %d %f",&cod2, &quant2, &val2)

    fmt.Printf("VALOR A PAGAR: R$ %.2f\n", ((float64(quant1)*val1) + (float64(quant2)*val2)))

}
