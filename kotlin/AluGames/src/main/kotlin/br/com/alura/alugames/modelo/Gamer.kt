package br.com.alura.alugames.modelo

import java.time.LocalDate
import java.util.*
import kotlin.random.Random

data class Gamer(var nome:String, var email:String): Recomendavel {
    var id:String? = null
    var dataNascimento:String? = null
    var usuario:String? = null
        set(valor) {
            field = valor
            if (idInterno.isNullOrBlank()){
                criarIdInterno()
            }
        }
    var idInterno:String? = null
        private set

    var plano: Plano = PlanoAvulso(null, "BRONZE")
    val jogosBuscados = mutableListOf<Jogo?>()

    val jogosAlugados = mutableListOf<Aluguel>()
    private val listaNotas = mutableListOf<Int>()
    val jogosRecomendados = mutableListOf<Jogo>()

    override val media: Double
        get() = listaNotas.average()

    override fun recomendar(nota: Int) {
        if(nota <= 10 || nota >= 1 ) {
            listaNotas.add(nota)
        } else {
            println("Nota inserida não válida!")
        }
    }

    fun recomendarJogo(jogo: Jogo, nota: Int) {
        jogo.recomendar(nota)
        jogosRecomendados.add(jogo)
    }

    constructor(id: String?, nome: String, email: String, dataNascimento:String, usuario:String):
    //o this são os parametros do construtor default
    this(nome, email) {
        // este bloco informa quais parâmetros do construtor vão se relacionar com as
        // variáveis da classe
        this.dataNascimento = dataNascimento
        this.usuario = usuario
        criarIdInterno()
    }

    init {
        if (nome.isBlank()) {
            throw IllegalArgumentException("Nome está em branco")
        }

        this.email = validarEmail()
    }

    override fun toString(): String {
        return "Gamer:\n" +
                "ID=$id\n"+
                "nome='$nome',\n"+
                "email='$email',\n" +
                "dataNascimento=$dataNascimento,\n" +
                "usuario=$usuario,\n" +
                "idInterno=$idInterno,\n"+
                "reputação: $media\n"

    }

    private fun criarIdInterno() {
        val numero = Random.nextInt(10000)
        val tag  = String.format("%04d", numero)
        idInterno = "$usuario#$tag"
    }

    fun validarEmail(): String {
        val regex = Regex("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")
        if (regex.matches(email)) {
            return email
        } else {
            return throw IllegalArgumentException("Email inválido.")
        }
    }

    fun alugaJogo(jogo: Jogo, periodo: Periodo) : Aluguel {
        val aluguel = Aluguel(this, jogo, periodo)
        jogosAlugados.add(aluguel)

        return aluguel
    }

    fun jogosDoMes(mes: Int): List<Jogo> {
        return this.jogosAlugados
            .filter{ aluguel -> aluguel.periodo.dataInicial.monthValue == mes}
            .map{aluguel -> aluguel.jogo}
    }

    companion object {
        fun criarGamer(leitura: Scanner) : Gamer {
            println("Boas vindas ao AluGames! Vamos fazer seu cadastro. Digite seu nome:")
            val nome = leitura.nextLine()
            println("Digite seu e-mail:")
            val email = leitura.nextLine()
            println("Deseja completar seu cadastro com usuário e data de nascimento? (S/N)")
            val opcao = leitura.nextLine()

            if (opcao.equals("s", true)) {
                println("Digite sua data de nascimento(DD/MM/AAAA):")
                val nascimento = leitura.nextLine()
                println("Digite seu nome de usuário:")
                val usuario = leitura.nextLine()

                return Gamer(null, nome, email, nascimento, usuario)
            } else {
                return Gamer(nome, email)
            }
        }
    }
}
