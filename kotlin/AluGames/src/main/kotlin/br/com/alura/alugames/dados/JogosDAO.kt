package br.com.alura.alugames.dados

import br.com.alura.alugames.dados.Banco
import br.com.alura.alugames.modelo.Jogo

class JogosDAO {
    fun getJogos(): List<Jogo> {
        val listaJogos = mutableListOf<Jogo>()
        val conexao = Banco.obterConexao()

        if(conexao != null){
            try {
                val statement = conexao.createStatement()
                val resultado = statement.executeQuery("SELECT * FROM jogos;")

                while (resultado.next()) {
                    val id = resultado.getInt("id")
                    val titulo = resultado.getString("titulo")
                    val descricao = resultado.getString("descricao")
                    val capa = resultado.getString("capa")
                    val preco = resultado.getDouble("preco")

                    val jogo = Jogo(id, titulo, capa, preco, descricao)
                    listaJogos.add(jogo)
                }

                statement.close()
            } finally {
                conexao.close()
            }
        }

        return listaJogos
    }

    fun adicionarJogo(jogo: Jogo) {
        val conexao = Banco.obterConexao()
        val insert = "INSERT INTO jogos (titulo, capa, preco, descricao) VALUES (?, ?, ?, ?);"

        if(conexao != null){
            try{
                val statement = conexao.prepareStatement(insert)
                statement.setString(1, jogo.titulo)
                statement.setString(2, jogo.capa)
                statement.setDouble(3, jogo.preco)
                statement.setString(4, jogo.descricao)

                statement.executeUpdate()
                statement.close()
            } finally {
                conexao.close()
            }
        }
    }
}