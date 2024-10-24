package br.com.alura.alugames.principal
import br.com.alura.alugames.dados.Banco
import br.com.alura.alugames.modelo.Jogo
import br.com.alura.alugames.dados.JogosDAO

fun main() {
    val jogo = Jogo("Crash", "http://capa.com", 9.99, "Bandicoot")
    val jogoDAO = JogosDAO()
    jogoDAO.adicionarJogo(jogo)

    jogoDAO.adicionarJogo(jogo)

    val listaJogos: List<Jogo> = jogoDAO.getJogos()
    println(listaJogos)
}