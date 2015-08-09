package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	public Connection getConnectionObj() {
		// JDBC driver name and database URL
		final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		final String DB_URL = "jdbc:mysql://localhost:3306/gallery";

		// Database credentials
		final String USER = "root";
		final String PASS = "user";
		Connection connect = null;

		try {
			Class.forName(JDBC_DRIVER).newInstance();
			System.out.println("Connecting to database...");
			connect = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connect;
	}
	
	
}
