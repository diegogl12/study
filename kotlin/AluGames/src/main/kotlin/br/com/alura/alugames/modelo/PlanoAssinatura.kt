package br.com.alura.alugames.modelo

class PlanoAssinatura(
        id: String?,
        tipo: String,
        val mensalidade: Double,
        val jogosIncluidos: Int,
<<<<<<< HEAD
        val percentualDescontoReputacao: Double): Plano(id, tipo) {
=======
        val percentualDescontoReputacao: Double): Plano(tipo) {
>>>>>>> main

        override fun obterValor(aluguel: Aluguel): Double {
                val totalJogosNoMes = aluguel.gamer.jogosDoMes(aluguel.periodo.dataInicial.monthValue).size+1

                return if (totalJogosNoMes <= jogosIncluidos) {
                        0.0
                } else {
                        var valorOriginal = super.obterValor(aluguel)
                        if (aluguel.gamer.media > 8) {
                                valorOriginal -= valorOriginal * percentualDescontoReputacao
                        }

                        valorOriginal
                }
        }

        override fun toString(): String {
                return "Plano Assinatura:\n"+
                        "ID: $id\n"+
                        "Tipo: $tipo\n"+
                        "Mensalidade: $mensalidade\n"+
                        "Jogos: $jogosIncluidos\n"+
                        "Desconto: $percentualDescontoReputacao\n"
        }
}