package br.com.alura.alugames.dados
import br.com.alura.alugames.modelo.Jogo

import java.sql.SQLException
import java.sql.DriverManager
import java.sql.Connection

object Banco {
    fun obterConexao(): Connection? {
        return try {
            DriverManager.getConnection("jdbc:mysql://localhost:3306/alugames", "root", "mysql")
        } catch (e: SQLException) {
            e.printStackTrace()
            null
        }
    }
}