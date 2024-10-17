package main

import "fmt"

const comission =  0.15

func main(){
    var name string
    var salary, bonus float64

    fmt.Scan(&name)
    fmt.Scanf("%f\n%f", &salary, &bonus)

    fmt.Printf("TOTAL = R$ %.2f\n", (salary + (bonus*comission)))
}
