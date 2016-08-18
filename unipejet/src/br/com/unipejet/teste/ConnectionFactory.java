package br.com.unipejet.teste;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public Connection getConnection(){
		
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return DriverManager.getConnection(
			 "jdbc:mysql://localhost:3306/lojinha", "root", "");
			 } catch (SQLException e) {
			 throw new RuntimeException(e);
		
	}
	}	
}
