package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	private static Connection conn;

	public static Connection getConn() {
		if(conn==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook", "root", "1234");
				System.out.println("Connection opened!");
			} catch (Exception ex) {
				System.out.println("Error in opening connection"+ex.getMessage());
				ex.printStackTrace();
			}
		}
		return conn;
	}
		
}
