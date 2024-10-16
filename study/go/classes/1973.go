package main

import "fmt"

func roubar_carneiros(estrelas []int, indice int, acumulador int) int {
	tamanho_estrelas := len(estrelas)

	if indice < 0 || indice >= tamanho_estrelas || estrelas[indice] == 0 {
		return acumulador
	}

	if estrelas[indice] % 2 == 0 {
		return roubar_carneiros(estrelas, indice-1, acumulador+1)
	}

	return roubar_carneiros(estrelas, indice+1, acumulador+1)
}

func main() {
	var total_estrelas int
	carneiros := 0

	fmt.Scanf("%d", &total_estrelas)

	total_carneiros := make([]int, total_estrelas)
	for i := 0; i < total_estrelas; i++ {
		fmt.Scanf("%d", &total_carneiros[i])
		carneiros += total_carneiros[i]
	}

	estrelas_percorridas := roubar_carneiros(total_carneiros, 0, 0)
	carneiros_restantes := carneiros - estrelas_percorridas

	fmt.Printf("%d %d\n", estrelas_percorridas, carneiros_restantes)
}