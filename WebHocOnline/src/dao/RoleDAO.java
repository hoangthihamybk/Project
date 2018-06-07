package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.Role;

public class RoleDAO implements ObjectDAO{
	public static Map<String, Role> mapRole = loadData();
	public static Map<String, Role> mapUndo = new HashMap<>();

	
	@Override
	public boolean add(Object obj) {
		Role r = (Role) obj;
		if (mapRole.containsKey(r.getRoleID()))
			return false;
		mapRole.put(r.getRoleID(), r);
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into Role (RoleID,RoleName,Describe,Enable) values(?,?,?,?)");
			statement.setString(1, r.getRoleID());
			statement.setString(2, r.getRoleName());
			statement.setString(3, r.getDescribe());
			statement.setString(4, r.getEnable());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	private static Map<String, Role> loadData() {
		Map<String, Role> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from Role");
			while (rs.next()) {
				String RoleID = rs.getString(1);
				String RoleName = rs.getString(2);
				String Describe = rs.getString(3);
				String Enable = rs.getString(4);

				Role ua = new Role(RoleID, RoleName, Describe, Enable);
				mapTemp.put(RoleID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	@Override
	public boolean edit(String RoleID, Object obj) {
		Role r = (Role) obj;
		if (!mapRole.containsKey(RoleID)) return false;
		mapRole.replace(RoleID, r);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update Role set RoleID='" + r.getRoleID() + "',RoleName=N'" + r.getRoleName() + "',Describe=N'"
					+ r.getDescribe() + "',Enable='" + r.getEnable()  + "' where RoleID='" + RoleID + "'";

			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String RoleID) {
		if (!mapRole.containsKey(RoleID))
			return false;
		mapRole.remove(RoleID);
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from Role where RoleID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, RoleID);
			st.executeUpdate();
			
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete  :" + e.getMessage());
			return false;
		}
	}
	public boolean delAll() {
		mapUndo.putAll(mapRole);
		mapRole.clear();
		return true;
	}
	public boolean undo() {
		mapRole.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
}
