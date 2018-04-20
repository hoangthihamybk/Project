package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

public class MyConnectDB {

	public MyConnectDB() {
		super();
	}

	public static Connection connect() throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","12345678Bk");
			System.out.println("ket noi thanh cong");
			return connect;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}


	public void thucThiSQL(String sql) throws Exception {
		Connection connect = connect();
		Statement stmt = connect.createStatement();
		stmt.executeUpdate(sql);
	}

//	public ResultSet chonDuLieu(String sql) throws Exception {
//		Connection connect = connect();
//		Statement stmt = connect.createStatement();
//		ResultSet rs = stmt.executeQuery(sql);
//		return rs;
//	}

	public PreparedStatement dungStament(String sql) throws SQLException, Exception {
		return connect().prepareStatement(sql);
	}

	public static void main(String[] args) throws Exception {
		System.out.println(new MyConnectDB().connect());
		
	}
}
