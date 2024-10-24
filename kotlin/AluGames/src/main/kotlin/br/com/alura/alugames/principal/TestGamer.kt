package br.com.alura.alugames.principal

import br.com.alura.alugames.modelo.Gamer

fun main(){
    val gamer1 = Gamer("Diego", "diego@email.com")

    val gamer2 = Gamer(null, "Gomes", "gomes@email.com", "15/01/1996", "diegogl12")

    gamer1.let{
        it.dataNascimento = "18/09/2000"
        it.usuario = "diego_skywalker"
    }.also {
        println(gamer1.idInterno)
    }

    println(gamer1)
    println(gamer2)
}