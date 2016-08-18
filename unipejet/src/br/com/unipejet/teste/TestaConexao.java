package br.com.unipejet.teste;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;

import com.mysql.jdbc.PreparedStatement;


public class TestaConexao {

	public void adiciona_role(String login, String role) throws SQLException {
		// conectando
		Connection con = new ConnectionFactory().getConnection();
		// cria um preparedStatement
		String sql = "insert into user_role" +
		" (User_login, roles_name)" +
		" values (?,?)";
		
		PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
		// preenche os valores
		stmt.setString(1, login);
		stmt.setString(2, role);
		// executa
		stmt.execute();
		stmt.close();
		System.out.println("Gravado!");
		con.close();
		}
		}

