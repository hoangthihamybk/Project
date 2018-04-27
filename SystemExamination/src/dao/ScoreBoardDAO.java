package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.ScoreBoard;

public class ScoreBoardDAO implements ObjectDAO{
	public static Map<String, ScoreBoard> mapScoreBoard = loadData();
	public static Map<String, ScoreBoard> mapUndo = new HashMap<>();
	
	private static Map<String, ScoreBoard> loadData() {
		Map<String, ScoreBoard> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from ScoreBoard");
			while (rs.next()) {
				String scoreBoardID = rs.getString(1);
				String userID = rs.getString(2);
				String examID = rs.getString(3);
				String timeEnd = rs.getString(4);
				String numberOfCorrectSentences = rs.getString(5);
				String score = rs.getString(6);
				String evaluationID = rs.getString(7);
				String accumulatedPoints = rs.getString(8);
				String enable = rs.getString(9);
				ScoreBoard ua = new ScoreBoard(scoreBoardID, userID, examID, timeEnd, numberOfCorrectSentences,score,evaluationID,accumulatedPoints,enable);
				mapTemp.put(scoreBoardID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
	@Override
	public boolean add(Object obj) {
		ScoreBoard r = (ScoreBoard) obj;
		if (mapScoreBoard.containsKey(r.getScoreBoardID()))
			return false;
		mapScoreBoard.put(r.getScoreBoardID(), r);
		try {
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into ScoreBoard (SBID, userID, examID, timeEnd, numberOfCorrectSentences,ScoreBoard,evaluationID,accumulatedPoints,enable) values(?,?,?,?,?,?,?,?,?)");
			statement.setString(1, r.getScoreBoardID());
			statement.setString(2, r.getUserID());
			statement.setString(3, r.getExamID());
			statement.setString(4, r.getTimeEnd());
			statement.setString(5, r.getNumberOfCorrectSentences());
			statement.setString(6, r.getScore());
			statement.setString(7, r.getEvaluationID());
			statement.setString(8, r.getAccumulatedPoints());
			statement.setString(9, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	@Override
	public boolean edit(String id, Object obj) {
		ScoreBoard r = (ScoreBoard) obj;
		if (!mapScoreBoard.containsKey(id)) return false;
		mapScoreBoard.replace(id, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update ScoreBoard set SBID='" + r.getScoreBoardID() + "',userID='" + r.getUserID() + "',examID='"
					+ r.getExamID() + "',TimeEnd='" + r.getTimeEnd() + "',numberOfCorrectSentences='" + r.getNumberOfCorrectSentences()
					+ "',ScoreBoard='"+ r.getScore() + "',evaluationID='"+ r.getEvaluationID() + "',accumulatedPoints='"+ r.getAccumulatedPoints()
					+ "',enable='"+r.getEnable()+ "' where SBID='" + id + "'";

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
		if (!mapScoreBoard.containsKey(id))
			return false;
		mapScoreBoard.remove(id);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from ScoreBoard where SBID=?";
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
		mapUndo.putAll(mapScoreBoard);
		mapScoreBoard.clear();
		return true;
	}
	public boolean undo() {
		mapScoreBoard.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
	public static void main(String[] args) {
//		System.out.println(new ScoreBoardDAO().del("ADDsadsad"));
	}
}
