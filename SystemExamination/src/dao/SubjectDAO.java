package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.Subject;

public class SubjectDAO implements ObjectDAO{
	public static Map<String, Subject> mapSubject = loadData();
	public static Map<String, Subject> mapUndo = new HashMap<>();

	@Override
	public boolean add(Object obj) {
		Subject r = (Subject) obj;
		if (mapSubject.containsKey(r.getSubjectID()))
			return false;
		mapSubject.put(r.getSubjectID(), r);
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into Subject (subjectID,subjectName,linkImage,describe,listOfExamination,enable) values(?,?,?,?,?,?)");
			statement.setString(1, r.getSubjectID());
			statement.setString(2, r.getSubjectName());
			statement.setString(3, r.getLinkImage());
			statement.setString(4, r.getDescribe());
			statement.setString(5, r.getListOfExaminationID());
			statement.setString(6, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	private static Map<String, Subject> loadData() {
		Map<String, Subject> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Subject");
			while (rs.next()) {
				String subjectID = rs.getString(1);
				String subjectName = rs.getString(2);
				String linkImage = rs.getString(3);
				String describe = rs.getString(4);
				String listOfExaminationID = rs.getString(5);
				String enable = rs.getString(6);
				Subject ua = new Subject(subjectID, subjectName, linkImage, describe, listOfExaminationID, enable);
				mapTemp.put(subjectID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
	@Override
	public boolean edit(String id, Object obj) {
		Subject r = (Subject) obj;
		if (!mapSubject.containsKey(id)) return false;
		mapSubject.replace(id, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Subject set SubjectID='" + r.getSubjectID() + "',subjectName=N'" + r.getSubjectID() + "',linkImage='"
					+ r.getLinkImage() + "',describe=N'" + r.getDescribe() + "',listOfExamination='" + r.getListOfExaminationID() + "',enable='" + r.getEnable()  + "' where SubjectID='" + id + "'";

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
		if (!mapSubject.containsKey(id))
			return false;
		mapSubject.remove(id);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Subject where SubjectID=?";
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
		mapUndo.putAll(mapSubject);
		mapSubject.clear();
		return true;
	}
	public boolean undo() {
		mapSubject.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
}
