package br.com.alura.alugames.modelo

<<<<<<< HEAD
sealed class Plano(val id:String?, val tipo: String) {
=======
sealed class Plano(val tipo: String) {
>>>>>>> main
    open fun obterValor(aluguel: Aluguel): Double {
        return aluguel.jogo.preco * aluguel.periodo.emDias
    }
}