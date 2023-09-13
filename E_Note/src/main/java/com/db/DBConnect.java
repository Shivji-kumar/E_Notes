package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn() {
		if(conn==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ENotes","root","1234");
				System.out.println("Connected");
				
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
		}
		return conn;
		
	}

}
