package main

import "fmt"
import "math"

func main(){
	var x1, y1, x2, y2 float64

	fmt.Scanf("%f %f\n%f %f", &x1, &y1, &x2, &y2)

	distance := math.Sqrt(math.Pow(x1-x2, 2)+math.Pow(y1-y2, 2))

	fmt.Printf("%.4f\n",distance)
}
