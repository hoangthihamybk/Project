package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.Exam;

public class ExamDAO implements ObjectDAO{
	public static Map<String, Exam> mapExam = loadData();
	public static Map<String, Exam> mapUndo = new HashMap<>();
	
	private static Map<String, Exam> loadData() {
		Map<String, Exam> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Examination");
			while (rs.next()) {
				String examID = rs.getString(1);
				String classID = rs.getString(2);
				String subjectID = rs.getString(3);
				String examName = rs.getString(4);
				String describe = rs.getString(5);
				String numberOfQuestions = rs.getString(6);
				String time = rs.getString(7);
				String numberOfPeople = rs.getString(8);
				String linkContent = rs.getString(9);
				String dateCreate = rs.getString(10);
				String enable = rs.getString(11);
				Exam ua = new Exam(examID, classID, subjectID, examName, describe,numberOfQuestions,time,numberOfPeople,linkContent,dateCreate,enable);
				mapTemp.put(examID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
	@Override
	public boolean add(Object obj) {
		Exam r = (Exam) obj;
		if (mapExam.containsKey(r.getExamID()))
			return false;
		mapExam.put(r.getExamID(), r);
		try {
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into Examination (examID, classID, subjectID, examName, describe,numberOfQuestions,time,numberOfPeople,linkContent,dateCreate,enable) values(?,?,?,?,?,?,?,?,?,?,?)");
			statement.setString(1, r.getExamID());
			statement.setString(2, r.getClassID());
			statement.setString(3, r.getSubjectID());
			statement.setString(4, r.getExamName());
			statement.setString(5, r.getDescribe());
			statement.setString(6, r.getNumberOfQuestions());
			statement.setString(7, r.getTime());
			statement.setString(8, r.getNumberOfPeople());
			statement.setString(9, r.getLinkContent());
			statement.setString(10, r.getDateCreate());
			statement.setString(11, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	

	@Override
	public boolean edit(String id, Object obj) {
		Exam r = (Exam) obj;
		if (!mapExam.containsKey(id)) return false;
		mapExam.replace(id, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Examination set examID='" + r.getExamID() + "',classID='" + r.getClassID() + "',subjectID='"
					+ r.getSubjectID() + "',examName='" + r.getExamName() + "',describe='" + r.getDescribe()
					+ "',numberOfQuestions='"+ r.getNumberOfQuestions() + "',time='"+ r.getTime() + "',numberOfPeople='"+ r.getNumberOfPeople()
					+ "',linkContent='"+r.getLinkContent()+  "',dateCreate='"+r.getDateCreate() + "',enable='"+r.getEnable()+ "' where examID='" + id + "'";

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
		if (!mapExam.containsKey(id))
			return false;
		mapExam.remove(id);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Examination where examID=?";
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
		mapUndo.putAll(mapExam);
		mapExam.clear();
		return true;
	}
	public boolean undo() {
		mapExam.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

}
