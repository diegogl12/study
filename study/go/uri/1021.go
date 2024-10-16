package main

import "fmt"

func main(){
	var value float64

	var bills = []float64 {100.0, 50.0, 20.0, 10.0, 5.0, 2.0}
	var coins = []float64 {1.0, 0.5, 0.25, 0.1, 0.05, 0.01}

	fmt.Scanf("%f", &value)

	value += 0.001

	fmt.Println("NOTAS:")
	result(bills, &value, "nota")

	fmt.Println("MOEDAS:")
	result(coins, &value, "moeda")
}

func result(list []float64, value *float64, currency string){
	for _, val := range list{
		quant := int(*value/val)

		fmt.Printf("%d %s(s) de R$ %.2f\n", quant, currency, val)

		if *value > 0 { *value -= float64(quant)*val}
	}
}
