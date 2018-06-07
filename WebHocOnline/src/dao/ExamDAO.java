package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import model.ConnectDB;
import model.Exam;

public class ExamDAO implements ObjectDAO {
	public static Map<String, Exam> mapExam = loadData();
	public static Map<String, Exam> mapUndo = new HashMap<>();

	public Map<String, Exam> getMapExamBySubjectID(String SubjectID, String level) {
		Map<String, Exam> mapTemp = new HashMap<>();
		for (Exam e : mapExam.values()) {
			if (level != null) {
				StringTokenizer ExamID = new StringTokenizer(e.getExamID(), "-");
				ExamID.nextToken();
				String levelID = ExamID.nextToken();
				if (e.getSubjectID().equals(SubjectID) && levelID.equals(level)) {
					mapTemp.put(e.getExamID(), e);
				}
			} else {
				if (e.getSubjectID().equals(SubjectID)) {
					mapTemp.put(e.getExamID(), e);
				}
			}
		}
		return mapTemp;
	}
	
	private static Map<String, Exam> loadData() {
		Map<String, Exam> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Exam");
			while (rs.next()) {
				String ExamID = rs.getString(1);
				String ClassID = rs.getString(2);
				String SubjectID = rs.getString(3);
				String ExamName = rs.getString(4);
				String Describe = rs.getString(5);
				String NumberOfQuestions = rs.getString(6);
				String Time = rs.getString(7);
				String NumberOfPeople = rs.getString(8);
				String LinkContent = rs.getString(9);
				String DateCreate = rs.getString(10);
				String Enable = rs.getString(11);
			
				Exam ua = new Exam(ExamID, ClassID, SubjectID, ExamName, Describe, NumberOfQuestions, Time,
						NumberOfPeople, LinkContent, DateCreate, Enable);
				mapTemp.put(ExamID, ua);
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
					"insert into Exam (ExamID, ClassID, SubjectID, ExamName, Describe,NumberOfQuestions,Time,NumberOfPeople,LinkContent,DateCreate,Enable) values(?,?,?,?,?,?,?,?,?,?,?)");
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
	public boolean edit(String ExamID, Object obj) {
		Exam r = (Exam) obj;
		if (!mapExam.containsKey(ExamID))
			return false;
		mapExam.replace(ExamID, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Exam set ExamID='" + r.getExamID() + "',ClassID='" + r.getClassID()
					+ "',SubjectID='" + r.getSubjectID() + "',ExamName='" + r.getExamName() + "',Describe='"
					+ r.getDescribe() + "',NumberOfQuestions='" + r.getNumberOfQuestions() + "',Time='" + r.getTime()
					+ "',NumberOfPeople='" + r.getNumberOfPeople() + "',LinkContent='" + r.getLinkContent()
					+ "',DateCreate='" + r.getDateCreate() + "',Enable='" + r.getEnable()  +"' where ExamID='" + ExamID
					+ "'";

			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String ExamID) {
		if (!mapExam.containsKey(ExamID))
			return false;
		mapExam.remove(ExamID);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Exam where ExamID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, ExamID);
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

	public static void main(String[] args) {
//		String id = "EXl-CB-D012";
//		StringTokenizer  t = new StringTokenizer(id, "-");
//		System.out.println(t.nextToken());
//		System.out.println(t.nextToken());
		
	}
}
