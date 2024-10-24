package br.com.alura.alugames.modelo
import com.google.gson.annotations.Expose

data class Jogo(@Expose val titulo:String, @Expose val capa:String): Recomendavel {
    var id:Int? = null
    var descricao:String? = null
    var preco = 0.0
    var listaNotas = mutableListOf<Int>()
    override val media: Double
        get() = listaNotas.average()

    override fun recomendar(nota: Int) {
        if (nota <=10 || nota >= 1) {
            listaNotas.add(nota)
        } else {
            println("Nota inserida não válida!")
        }
    }

    constructor(titulo: String, capa: String, preco: Double, descricao: String):
            this(titulo, capa) {
        this.preco = preco
        this.descricao = descricao
    }

    constructor(id: Int?, titulo: String, capa: String, preco: Double, descricao: String):
    this(titulo, capa) {
        this.preco = preco
        this.descricao = descricao
        this.id = id
    }

    override fun toString(): String {
        return "\nMeu Jogo:\n" +
                "ID: $id\n" +
        "Titulo: $titulo\n" +
        "Capa: $capa\n" +
        "Preço: R$$preco\n" +
        "Descricao: $descricao\n" +
        "Reputacao: $media\n"
    }
}