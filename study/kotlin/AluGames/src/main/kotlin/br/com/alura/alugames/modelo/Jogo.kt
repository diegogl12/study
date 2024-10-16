package br.com.alura.alugames.modelo

data class Jogo(val titulo:String, val capa:String) {
    var descricao:String? = null
    var preco = 0.0

    constructor(titulo: String, capa: String, preco: Double, descricao: String):
    this(titulo, capa) {
        this.preco = preco
        this.descricao = descricao
    }

    override fun toString(): String {
        return "\nMeu Jogo:\n" +
        "Titulo: $titulo\n" +
        "Capa: $capa\n" +
        "Preço: R$$preco\n" +
        "Descricao: $descricao\n"
    }
}