package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.Classed;
import model.ConnectDB;

public class ClassedDAO implements ObjectDAO{
	public static Map<String, Classed> mapClassed = loadData();
	public static Map<String, Classed> mapUndo = new HashMap<>();
	
	private static Map<String, Classed> loadData() {
		Map<String, Classed> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Classed");
			while (rs.next()) {
				String classID = rs.getString(1);
				String className = rs.getString(2);
				String describe = rs.getString(3);
				String listOfExaminationID = rs.getString(4);
				String enable = rs.getString(5);
				Classed ua = new Classed(classID, className, describe, listOfExaminationID, enable);
				mapTemp.put(classID, ua);   /////////////////////
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
	@Override
	public boolean add(Object obj) {
		Classed r = (Classed) obj;
		if (mapClassed.containsKey(r.getClassID()))
			return false;
		mapClassed.put(r.getClassID(), r);
		try {
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into Classed (classID,className,describe,listOfSubject,enable) values(?,?,?,?,?)");
			statement.setString(1, r.getClassID());
			statement.setString(2, r.getClassName());
			statement.setString(3, r.getDescribe());
			statement.setString(4, r.getListOfSubject());
			statement.setString(5, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	@Override
	public boolean edit(String id, Object obj) {
		Classed r = (Classed) obj;
		if (!mapClassed.containsKey(id)) return false;
		mapClassed.replace(id, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Classed set classID='" + r.getClassID() + "',className=N'" + r.getClassName() + "',describe=N'"
					+ r.getDescribe() + "',listOfSubject='" + r.getListOfSubject() + "',enable='" + r.getEnable()   + "' where classID='" + id + "'";

			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	@Override
	public boolean del(String id) {
		if (!mapClassed.containsKey(id))
			return false;
		mapClassed.remove(id);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Classed where classID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			st.executeUpdate();
			
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete  :" + e.getMessage());
			return false;
		}
	}
	public boolean delAll() {
		mapUndo.putAll(mapClassed);
		mapClassed.clear();
		return true;
	}
	public boolean undo() {
		mapClassed.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
}
