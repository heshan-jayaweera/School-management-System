package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String username = "root";
		String password = "admin123";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sims?characterEncoding=utf8",username,password);
		
		return con;
	}
}
