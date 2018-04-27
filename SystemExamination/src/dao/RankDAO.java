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
					"insert into Rank (RankID,UserID,Rank,enable) values(?,?,?,?)");
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
				String rankID = rs.getString(1);
				String userID = rs.getString(2);
				String rank = rs.getString(3);
				String enable = rs.getString(4);

				Rank ua = new Rank(rankID, userID, rank, enable);
				mapTemp.put(rankID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	@Override
	public boolean edit(String id, Object obj) {
		Rank r = (Rank) obj;
		if (!mapRank.containsKey(id)) return false;
		mapRank.replace(id, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Rank set RankID='" + r.getRankID() + "',UserID='" + r.getUserID() + "',Rank='"
					+ r.getRank() + "',Enable='" + r.getEnable()  + "' where RankID='" + id + "'";

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
		if (!mapRank.containsKey(id))
			return false;
		mapRank.remove(id);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Rank where RankID=?";
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
