package br.com.alura.alugames.modelo

class PlanoAvulso(id: String?, tipo: String): Plano(id, tipo){

    override fun obterValor(aluguel: Aluguel): Double {
        var valorOriginal = super.obterValor(aluguel);

        return if (aluguel.gamer.media > 8) {
            valorOriginal - (valorOriginal * 0.1)

        } else {
            valorOriginal
        }
    }

    override fun toString(): String {
        return "Plano Avulso:\n"+
                "ID: $id\n"+
                "Tipo: $tipo\n"
    }
}
