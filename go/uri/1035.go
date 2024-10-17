package main

import "fmt"

func main(){

    var a, b, c, d int

    fmt.Scanf("%d %d %d %d", &a, &b, &c, &d)

    if test1(a,b,c,d) && test2(c+d, a+b) && test3(c,d) && test4(a) {
        fmt.Println("Valores aceitos")
    } else {
        fmt.Println("Valores nao aceitos")
    }

}

func test1(a int, b int, c int, d int) bool{
    return (b > c && d > a)
}

func test2(cd int, ab int) bool{
    return (cd > ab)
}

func test3(c int, d int) bool{
    return (c>=0 && d>=0)
}

func test4(a int) bool{
    return (a%2 == 0)
}
