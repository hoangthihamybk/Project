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
				String SBID = rs.getString(1);
				String UserID = rs.getString(2);
				String ExamID = rs.getString(3);
				String TimeEnd = rs.getString(4);
				String NumberOfCorrectSentences = rs.getString(5);
				String Score = rs.getString(6);
				String EvaluationID = rs.getString(7);
				String AccumulatedPoints = rs.getString(8);
				String Enable = rs.getString(9);
				ScoreBoard ua = new ScoreBoard(SBID, UserID, ExamID, TimeEnd, NumberOfCorrectSentences,Score,EvaluationID,AccumulatedPoints,Enable);
				mapTemp.put(SBID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}
	@Override
	public boolean add(Object obj) {
		ScoreBoard r = (ScoreBoard) obj;
		if (mapScoreBoard.containsKey(r.getSBID()))
			return false;
		mapScoreBoard.put(r.getSBID(), r);
		try {
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into ScoreBoard (SBID, UserID, ExamID, TimeEnd, NumberOfCorrectSentences,ScoreBoard,EvaluationID,AccumulatedPoints,Enable) values(?,?,?,?,?,?,?,?,?)");
			statement.setString(1, r.getSBID());
			statement.setString(2, r.getUserID());
			statement.setString(3, r.getExamID());
			statement.setString(4, r.getTimeEnd());
			statement.setString(5, r.getNumberOfCorrectSentences());
			statement.setString(6, r.getScoreBoard());
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
	public boolean edit(String SBID, Object obj) {
		ScoreBoard r = (ScoreBoard) obj;
		if (!mapScoreBoard.containsKey(SBID)) return false;
		mapScoreBoard.replace(SBID, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update ScoreBoard set SBID='" + r.getSBID() + "',UserID='" + r.getUserID() + "',ExamID='"
					+ r.getExamID() + "',TimeEnd='" + r.getTimeEnd() + "',numberOfCorrectSentences='" + r.getNumberOfCorrectSentences()
					+ "',ScoreBoard='"+ r.getScoreBoard() + "',EvaluationID='"+ r.getEvaluationID() + "',AccumulatedPoints='"+ r.getAccumulatedPoints()
					+ "',Enable='"+r.getEnable()+ "' where SBID='" + SBID + "'";

			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	@Override
	public boolean del(String SBID) {
		if (!mapScoreBoard.containsKey(SBID))
			return false;
		mapScoreBoard.remove(SBID);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from ScoreBoard where SBID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, SBID);
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
