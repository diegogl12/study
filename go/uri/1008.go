package main

import "fmt"

func main(){
    var number, hours int
    var value float64

    fmt.Scanf("%d\n%d", &number, &hours)
    fmt.Scanf("%f", &value)

    fmt.Printf("NUMBER = %d\nSALARY = U$ %.2f\n", number, (float64(hours)*value))

}
