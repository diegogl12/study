package br.com.alura.alugames.modelo

sealed class Plano(val id:String?, val tipo: String) {
    open fun obterValor(aluguel: Aluguel): Double {
        return aluguel.jogo.preco * aluguel.periodo.emDias
    }
}
