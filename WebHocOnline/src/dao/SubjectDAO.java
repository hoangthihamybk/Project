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
					"insert into Subject (SubjectID,SubjectName,LinkImage,Describe,ListOfExamination,Enable) values(?,?,?,?,?,?)");
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
				String SubjectID = rs.getString(1);
				String SubjectName = rs.getString(2);
				String LinkImage = rs.getString(3);
				String Describe = rs.getString(4);
				String ListOfExaminationID = rs.getString(5);
				String Enable = rs.getString(6);
				Subject ua = new Subject(SubjectID, SubjectName, LinkImage, Describe, ListOfExaminationID, Enable);
				mapTemp.put(SubjectID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
	@Override
	public boolean edit(String SubjectID, Object obj) {
		Subject r = (Subject) obj;
		if (!mapSubject.containsKey(SubjectID)) return false;
		mapSubject.replace(SubjectID, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Subject set SubjectID='" + r.getSubjectID() + "',SubjectName=N'" + r.getSubjectName() + "',LinkImage='"
					+ r.getLinkImage() + "',Describe=N'" + r.getDescribe() + "',ListOfExamination='" + r.getListOfExaminationID() + "',Enable='" + r.getEnable()  + "' where SubjectID='" + SubjectID + "'";

			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String SubjectID) {
		if (!mapSubject.containsKey(SubjectID))
			return false;
		mapSubject.remove(SubjectID);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Subject where SubjectID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, SubjectID);
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
