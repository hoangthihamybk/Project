package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDB;
import model.UserAccount;
import model.UserDetail;

public class UserDetailDAO implements ObjectDAO {
	public static Map<String, UserDetail> mapUserDetail = loadData();

	private static Map<String, UserDetail> loadData() {
		Map<String, UserDetail> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from UserDetail");
			while (rs.next()) {
				String userID = rs.getString(1);
				String fullName = rs.getString(2);
				String gender = rs.getString(3);
				String birthDay = rs.getString(4);
				String phoneNumber = rs.getString(5);
				String address = rs.getString(6);
				String linkImage = rs.getString(7);

				UserDetail ud = new UserDetail(userID, fullName, gender, birthDay, phoneNumber, address, linkImage);
				mapTemp.put(userID, ud);
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
					"insert into UserDetail (ID,FullName,Gender,Birthday,PhoneNumber,Address,Avatar) values(?,?,?,?,?,?,?)");
			statement.setString(1, ud.getUserID());
			statement.setString(2, ud.getFullName());
			statement.setString(3, ud.getGender());
			statement.setString(4, ud.getBirthDay());
			statement.setString(5, ud.getPhoneNumber());
			statement.setString(6, ud.getAddress());
			statement.setString(7, ud.getLinkImage());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(String userID,Object obj) {
		UserDetail ua = (UserDetail) obj;
		if (!mapUserDetail.containsKey(userID))
			return false;
		
		
		mapUserDetail.replace(userID, ua);
		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update UserAccount set ID='" + ua.getUserID() + "'where ID='" + userID + "'";
			
			String sqlb = "update UserDetail set ID='" + ua.getUserID() + "',FullName=N'" + ua.getFullName() + "',Gender='"
					+ ua.getGender() + "',Birthday='" + ua.getBirthDay() + "',PhoneNumber='" + ua.getPhoneNumber()
					+ "',Address=N'" + ua.getAddress() + "',Avatar='" + ua.getLinkImage() + "' where ID='" + userID + "'";
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
	public boolean del(String userID) {
		if (!mapUserDetail.containsKey(userID))
			return false;
		mapUserDetail.remove(userID);
		UserDAO.mapUser.remove(userID);
		try {
			
			Connection con = ConnectDB.getConnect();
			String sql = "delete from UserAccount where ID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userID);
			st.executeUpdate();
			
			String sql2 = "delete from UserDetail where ID=?";
			PreparedStatement st2 = con.prepareStatement(sql2);
			st2.setString(1, userID);
			st2.executeUpdate();
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete user :" + e.getMessage());
			return false;
		}
	}
}
