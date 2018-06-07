package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import model.ConnectDB;
import model.Rank;
import model.ScoreBoard;
import model.UserAccount;
import model.UserDetail;

public class UserDAO implements ObjectDAO {
	public static Map<String, UserAccount> mapUser = loadData();
	public static Map<String, UserAccount> mapUndo = new HashMap<>();

	public static UserAccount checkLogin(String email, String pass) {
		for (UserAccount u : mapUser.values()) { ////////////////////
			if (u.getEmail().equals(email) && u.getPassword().equals(pass)) {
				return u;
			}
		}

		return null;
	}

	public boolean add(Object obj) {
		UserAccount ua = (UserAccount) obj;
		if (mapUser.containsKey(ua.getUserID()))
			return false;
		mapUser.put(ua.getUserID(), ua);
		// them userDetail de khong loi rang buoc khoa ngoai
		new UserDetailDAO().add(new UserDetail(ua.getUserID()));
		try {
			Connection con = ConnectDB.getConnect();
			PreparedStatement statement = con.prepareStatement(
					"insert into UserAccount (UserID,email,password,googleID,facebookID,roleID) values(?,?,?,?,?,?)");
			statement.setString(1, ua.getUserID());
			statement.setString(2, ua.getEmail());
			statement.setString(3, ua.getPassword());
			statement.setString(4, ua.getGoogleID());
			statement.setString(5, ua.getFacebookID());
			statement.setString(6, ua.getRoleID());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	public boolean edit(String userID, Object obj) {
		UserAccount ua = (UserAccount) obj;
		UserDetail ud = UserDetailDAO.mapUserDetail.get(userID);
		if (!mapUser.containsKey(userID))
			return false;
		// sua luon o khoa ngoai ..........yes
		if (ud == null)
			return false;

		ud.setUserID(ua.getUserID());
		mapUser.replace(userID, ua);

		try {
			Connection connection = ConnectDB.getConnect();
			String sqla = "update UserAccount set UserID='" + ua.getUserID() + "',email='" + ua.getEmail() + "',password='"
					+ ua.getPassword() + "',googleID='" + ua.getGoogleID() + "',facebookID='" + ua.getFacebookID()
					+ "',RoleID='" + ua.getRoleID() + "' where UserID='" + userID + "'";

			String sqlb = "update UserDetail set UserID='" + ud.getUserID() + "',FullName=N'" + ud.getFullName()
					+ "',Gender='" + ud.getGender() + "',Birthday='" + ud.getBirthDay() + "',PhoneNumber='"
					+ ud.getPhoneNumber() + "',Address=N'" + ud.getAddress() + "',Avatar='" + ud.getLinkImage()
					+ "' where UserID='" + userID + "'";
			PreparedStatement preparedStatementa = connection.prepareStatement(sqla);
			preparedStatementa.executeUpdate();
			PreparedStatement preparedStatementb = connection.prepareStatement(sqlb);
			preparedStatementb.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	public boolean del(String userID) {
		if (!mapUser.containsKey(userID))
			return false;
		mapUser.remove(userID);
		// xoa luon user detail theo khoa ngoai
		UserDetailDAO.mapUserDetail.remove(userID);
		//Xoa luôn scoreboard và rank
		for(ScoreBoard sb : ScoreBoardDAO.mapScoreBoard.values()){
			if(sb.getUserID().equals(userID)) ScoreBoardDAO.mapScoreBoard.remove(sb);
		}
		for(Rank r : RankDAO.mapRank.values()){
			if(r.getUserID().equals(userID)) RankDAO.mapRank.remove(r);
		}
		try {
			Connection con = ConnectDB.getConnect();
			String sql = "delete from UserAccount where UserID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userID);
			st.executeUpdate();
			
			String sql2 = "delete from UserDetail where UserID=?";
			PreparedStatement st2 = con.prepareStatement(sql2);
			st2.setString(1, userID);
			st2.executeUpdate();
			
			String sql3 = "delete from ScoreBoard where UserID=?";
			PreparedStatement st3 = con.prepareStatement(sql3);
			st3.setString(1, userID);
			st3.executeUpdate();
			
			String sql4 = "delete from Rank where UserID=?";
			PreparedStatement st4 = con.prepareStatement(sql4);
			st4.setString(1, userID);
			st4.executeUpdate();
			
			return true;
		} catch (Exception e) {
			System.out.println("error delete user :" + e.getMessage());
			return false;
		}
	}

	private static Map<String, UserAccount> loadData() {
		Map<String, UserAccount> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from UserAccount");
			while (rs.next()) {
				String userID = rs.getString(1);
				String email = rs.getString(2);
				String password = rs.getString(3);
				String googleID = rs.getString(4);
				String facebookID = rs.getString(5);
				String roleID = rs.getString(6);

				UserAccount ua = new UserAccount(userID, email, password, googleID, facebookID, roleID);
				mapTemp.put(userID, ua);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	public static String randomUserID(String email) { 
		String resuilt = email.substring(0, email.indexOf("@"));
		Random r = new Random();
		resuilt += r.nextInt(100000);
		return resuilt;
	}
//sai dau cach
	public static void main(String[] args) {
//		System.out.println(randomUserID("admin@gmail.com"));
		System.out.println(checkLogin("admin@gmail.com", "1"));
		for(UserAccount u : mapUser.values()){
			System.out.println(u.getUserID());
		}
//		System.out.println(new UserDAO().del("SV10001"));

	}
	public boolean delAll() {
		mapUndo.putAll(mapUser);
		mapUser.clear();
		return true;
	}
	public boolean undo() {
		mapUser.putAll(mapUndo);
		mapUndo.clear();
		return true;
	}
}
