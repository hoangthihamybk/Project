package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.ConnectDB;
import model.ContentExam;
import model.DeThi;
import model.Question;

public class DeThiDAO {

	public boolean delContentExam(String maDeThi){
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from ContentExam where maDeThi=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, maDeThi);
			st.executeUpdate();
			
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete  :" + e.getMessage());
			return false;
		}
	}
	
	public boolean addContentExam(DeThi dt) {
		List<Question> listOfQuestion = dt.getListOfQuestion();
		for (int i = 0; i < listOfQuestion.size(); i++) {
			String qID = listOfQuestion.get(i).getQuestionID();
			try {
				Connection con = ConnectDB.getConnect();
				PreparedStatement statement = con.prepareStatement(
						"insert into ContentExam (maDeThi,QuestionID,Answer,Evaluation) values(?,?,?,?)");
				statement.setString(1, dt.getMaDeThiID());
				statement.setString(2, qID);
				statement.setString(3,  listOfQuestion.get(i).getAnswerRight());
				statement.setString(4,  qID.substring(qID.indexOf("-")+1,qID.length()));
				statement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

	public static Map<String, ContentExam> getMapContentExamByExamID(String maDeThi) {
		Map<String, ContentExam> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from ContentExam where maDeThi='" + maDeThi+"'");
			while (rs.next()) {
				String id = rs.getString(1);
				String questionID = rs.getString(2);
				String answer = rs.getString(3);
				String evaluation = rs.getString(4);
				ContentExam ce = new ContentExam(id, questionID, answer, evaluation);
				mapTemp.put(questionID, ce);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
}
