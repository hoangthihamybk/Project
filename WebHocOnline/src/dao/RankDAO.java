package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.Rank;

public class RankDAO implements ObjectDAO{
	public static Map<String, Rank> mapRank = loadData();
	public static Map<String, Rank> mapUndo = new HashMap<>();


	@Override
	public boolean add(Object obj) {
		Rank r = (Rank) obj;
		if (mapRank.containsKey(r.getRankID()))
			return false;
		mapRank.put(r.getRankID(), r);
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into Rank (RankID,UserID,Rank,Enable) values(?,?,?,?)");
			statement.setString(1, r.getRankID());
			statement.setString(2, r.getUserID());
			statement.setString(3, r.getRank());
			statement.setString(4, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	private static Map<String, Rank> loadData() {
		Map<String, Rank> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Rank");
			while (rs.next()) {
				String RankID = rs.getString(1);
				String UserID = rs.getString(2);
				String Rank = rs.getString(3);
				String Enable = rs.getString(4);

				Rank ua = new Rank(RankID, UserID, Rank, Enable);
				mapTemp.put(RankID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	@Override
	public boolean edit(String RankID, Object obj) {
		Rank r = (Rank) obj;
		if (!mapRank.containsKey(RankID)) return false;
		mapRank.replace(RankID, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Rank set RankID='" + r.getRankID() + "',UserID='" + r.getUserID() + "',Rank='"
					+ r.getRank() + "',Enable='" + r.getEnable()  + "' where RankID='" + RankID + "'";

			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String RankID) {
		if (!mapRank.containsKey(RankID))
			return false;
		mapRank.remove(RankID);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Rank where RankID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, RankID);
			st.executeUpdate();
			
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete  :" + e.getMessage());
			return false;
		}
	}
	public boolean delAll() {
		mapUndo.putAll(mapRank);
		mapRank.clear();
		return true;
	}
	public boolean undo() {
		mapRank.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}

}
