package br.com.alura.alugames.principal

import br.com.alura.alugames.modelo.Gamer
import br.com.alura.alugames.modelo.Jogo
import br.com.alura.alugames.servicos.ConsumoApi
import br.com.alura.alugames.utilitario.transformarEmIdade
import java.util.*

fun main() {
    val leitura = Scanner(System.`in`)
    val gamer = Gamer.criarGamer(leitura)
    println("Cadastro concluído com sucesso. Dados do Gamer:")
    println(gamer)
    println("Idade do gamer: " + gamer.dataNascimento?.transformarEmIdade())

    do {
        println("Digite um código de jogo para buscar:")
        val busca = leitura.nextLine()

        val buscaApi = ConsumoApi()
        val informacaoJogo = buscaApi.buscaJogo(busca)

        var meuJogo: Jogo? = null

        val resultado = runCatching {
            meuJogo = Jogo(informacaoJogo.info.title, informacaoJogo.info.thumb)
        }

        resultado.onFailure {
            println("Jogo inexistente. Tente outro id!")
        }

        resultado.onSuccess {
            println("Deseja inserir uma descrição personalizada? S/N")
            val opcao = leitura.nextLine()

            if (opcao.equals("S", true)) {
                println("Insira a descrição personalizada para o jogo:")
                val descricaoPersonalizada = leitura.nextLine()
                meuJogo?.descricao = descricaoPersonalizada
            } else {
                meuJogo?.descricao = meuJogo?.titulo
            }

            gamer.jogosBuscados.add(meuJogo)
        }
        println("Deseja buscar um novo jogo? S/N")
        val resposta = leitura.nextLine()
    } while(resposta.equals("s", true))


    println("Jogos buscados:")
    println(gamer.jogosBuscados)

    println("\nJogos ordenados por título:")
    gamer.jogosBuscados.sortBy{
        it?.titulo
    }

    gamer.jogosBuscados.forEach{
        println("Título: $it.titulo")
    }

    val jogosFiltrados = gamer.jogosBuscados.filter {
        it?.titulo?.contains("batman", true) ?: false
    }
    println("\nJogos Filtrados:")

    println(jogosFiltrados)

    println("\n Deseja Excluir algum jogo da lista original? S/N")
    val opcao = leitura.nextLine()
    if (opcao.equals("s", true)) {
        println(gamer.jogosBuscados)
        println("Informe a posição do jogo que deseja excluir:")
        val posicao = leitura.nextInt()

        gamer.jogosBuscados.removeAt(posicao)
        println("\n Lista Atualizada:")
        println(gamer.jogosBuscados)
    }




    println("Busca finalizada com sucesso!")

}