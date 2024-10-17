package main

import (
	"bufio"
	"fmt"
	"math/rand/v2"
	"os"
	"strconv"
	"strings"
)

func main() {
	stdio := bufio.NewReader(os.Stdin)

	fmt.Print("Please enter the min number: ")
	min_number_str, _ := stdio.ReadString('\n')
	min_number_str = strings.TrimSuffix(min_number_str, "\n")
	min_number, _ := strconv.Atoi(min_number_str)

	fmt.Print("Please enter the max number: ")
	max_number_str, _ := stdio.ReadString('\n')
	max_number_str = strings.TrimSuffix(max_number_str, "\n")
	max_number, _ := strconv.Atoi(max_number_str)

	if max_number < min_number {
		fmt.Print("Invalid input - shutting down...")
	} else {
		rnd_number := rand.IntN(max_number-min_number) + min_number
		fmt.Println(rnd_number)
	}

}
