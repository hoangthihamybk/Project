package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.UserDetail;

public class UserDetailDAO implements ObjectDAO {
	
	public static Map<String, UserDetail> mapUserDetail = loadData();

	private static Map<String, UserDetail> loadData() {
		Map<String, UserDetail> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from UserDetail");
			while (rs.next()) {
				String UserID = rs.getString(1);
				String Fullname = rs.getString(2);
				String Gender = rs.getString(3);
				String BirthDay = rs.getString(4);
				String PhoneNumber = rs.getString(5);
				String Address = rs.getString(6);
				String Avatar = rs.getString(7);

				UserDetail ud = new UserDetail(UserID, Fullname, Gender, BirthDay, PhoneNumber, Address, Avatar);
				mapTemp.put(UserID, ud);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	@Override
	public boolean add(Object obj) {
		UserDetail ud = (UserDetail) obj;
		if (mapUserDetail.containsKey(ud.getUserID()))
			return false;
		mapUserDetail.put(ud.getUserID(), ud);
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into UserDetail (UserID,Fullname,Gender,Birthday,PhoneNumber,Address,Avatar) values(?,?,?,?,?,?,?)");
			statement.setString(1, ud.getUserID());
			statement.setString(2, ud.getFullname());
			statement.setString(3, ud.getGender());
			statement.setString(4, ud.getBirthDay());
			statement.setString(5, ud.getPhoneNumber());
			statement.setString(6, ud.getAddress());
			statement.setString(7, ud.getAvatar());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(String UserID,Object obj) {
		UserDetail ua = (UserDetail) obj;
		if (!mapUserDetail.containsKey(UserID))
			return false;
		
		
		mapUserDetail.replace(UserID, ua);
		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update UserAccount set UserID='" + ua.getUserID() + "'where UserID='" + UserID + "'";
			
			String sqlb = "update UserDetail set UserID='" + ua.getUserID() + "',Fullname=N'" + ua.getFullname() + "',Gender='"
					+ ua.getGender() + "',Birthday='" + ua.getBirthDay() + "',PhoneNumber='" + ua.getPhoneNumber()
					+ "',Address=N'" + ua.getAddress() + "',Avatar='" + ua.getAvatar() + "' where UserID='" + UserID + "'";
			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			PreparedStatement preparedStatementb = connection.prepareStatement(sqlb);
			preparedStatementa.executeUpdate();
			preparedStatementb.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean del(String UserID) {
		if (!mapUserDetail.containsKey(UserID))
			return false;
		mapUserDetail.remove(UserID);
		UserDAO.mapUser.remove(UserID);
		try {
			
			Connection con = ConnectDB.getConnect();
			String sql = "delete from UserAccount where UserID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, UserID);
			st.executeUpdate();
			
			String sql2 = "delete from UserDetail where UserID=?";
			PreparedStatement st2 = con.prepareStatement(sql2);
			st2.setString(1, UserID);
			st2.executeUpdate();
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete user :" + e.getMessage());
			return false;
		}
	}
}
