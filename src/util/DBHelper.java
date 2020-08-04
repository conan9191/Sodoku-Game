package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
	private static final String driver="com.mysql.jdbc.Driver";
	private static final String userName="root";
	private static final String psw="123456";
	private static final String url="jdbc:mysql://localhost:3306/sodoku?serverTimezone=UTC";
	private static Connection conn = null;
	static {
		try {
			Class.forName(driver);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception{
		if(conn == null) {
			conn = DriverManager.getConnection(url,userName,psw);
			return conn;
		}
		return conn;
	}
	
	public static void main(String[] args) {
		try {
			Connection conn	= DBHelper.getConnection();
			if(conn!=null) {
				System.out.println("Database connection  is successful!");
			}
			else {
				System.out.println("Database connection fails!");
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
}
