package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnectDB {
	public static Connection getConnect(){
		Connection connection = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			String sql ="jdbc:sqlserver://systemtest.database.windows.net:1433;database=systemtest;user=adminlephong@systemtest;password=ABCabc123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
			String sql ="jdbc:sqlserver://localhost:1433;databaseName=systemdb;user=sa;password=123;";
			connection=DriverManager.getConnection(sql);
		
		
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Error when you connect to database!Error is: "+e.getMessage());
		}
		return connection;
	}
	public static void main(String[] args) {
		System.out.println(getConnect());
		System.out.println("Ket not thanh cong");
	}
	public  void excuteSql(String sql) throws Exception{
		Connection connect =getConnect();
		PreparedStatement stmt =  (PreparedStatement) connect.createStatement();
		stmt.executeUpdate(sql);
	}
	public ResultSet selectData(String sql) throws Exception{
		Connection connect =getConnect();
		Statement stmt = connect.createStatement();
		ResultSet rs=	stmt.executeQuery(sql);
		return rs;
	}
}
