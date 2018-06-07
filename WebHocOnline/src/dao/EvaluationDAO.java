package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.Evaluation;

public class EvaluationDAO implements ObjectDAO{
	public static Map<String, Evaluation> mapEvaluation = loadData();
	public static Map<String, Evaluation> mapUndo = new HashMap<>();
	@Override
	public boolean add(Object obj) {
		Evaluation r = (Evaluation) obj;
		if (mapEvaluation.containsKey(r.getEvaluationID()))
			return false;
		mapEvaluation.put(r.getEvaluationID(), r);
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into Evaluation (EvaluationID,Title,Content,PertenceOfPoint,Enable) values(?,?,?,?,?)");
			statement.setString(1, r.getEvaluationID());
			statement.setString(2, r.getTitle());
			statement.setString(3, r.getContent());
			statement.setString(4, r.getPercentageOfPoint());
			statement.setString(5, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	private static Map<String, Evaluation> loadData() {
		Map<String, Evaluation> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Evaluation");
			while (rs.next()) {
				String EvaluationID = rs.getString(1);
				String Title = rs.getString(2);
				String Content = rs.getString(3);
				String PercentageOfPoint = rs.getString(4);
				String Enable = rs.getString(5);

				Evaluation e = new Evaluation(EvaluationID, Title, Content, PercentageOfPoint, Enable);
				mapTemp.put(EvaluationID, e);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	@Override
	public boolean edit(String id, Object obj) {
		Evaluation r = (Evaluation) obj;
		if (!mapEvaluation.containsKey(id)) return false;
		mapEvaluation.replace(id, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Evaluation set EvaluationID='" + r.getEvaluationID() + "',Title=N'" + r.getTitle() + "',Content=N'"
					+ r.getContent() +  "',PertenceOfPoint='" + r.getPercentageOfPoint() 
					+ "',Enable='" + r.getEnable()  + "' where EvaluationID='" + id + "'";

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
		if (!mapEvaluation.containsKey(id))
			return false;
		mapEvaluation.remove(id);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Evaluation where EvaluationID=?";
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
		mapUndo.putAll(mapEvaluation);
		mapEvaluation.clear();
		return true;
	}
	public boolean undo() {
		mapEvaluation.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

}
