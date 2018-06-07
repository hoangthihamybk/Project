package model;

public class UserAccount {
	String UserID;
	String Email;
	String Password;
	String GoogleID;
	String FacebookID;
	String RoleID ;
	
	public UserAccount() {
		super();
	}

	public UserAccount(String userID, String email, String password, String googleID, String facebookID,
			String roleID) {
		super();
		UserID = userID;
		Email = email;
		Password = password;
		GoogleID = googleID;
		FacebookID = facebookID;
		RoleID = roleID;
	}

	public String getUserID() {
		return UserID;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getGoogleID() {
		return GoogleID;
	}

	public void setGoogleID(String googleID) {
		GoogleID = googleID;
	}

	public String getFacebookID() {
		return FacebookID;
	}

	public void setFacebookID(String facebookID) {
		FacebookID = facebookID;
	}

	public String getRoleID() {
		return RoleID;
	}

	public void setRoleID(String roleID) {
		RoleID = roleID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	@Override
	public String toString() {
		return "UserAccount [UserID=" + UserID + ", Email=" + Email + ", Password=" + Password + ", GoogleID="
				+ GoogleID + ", FacebookID=" + FacebookID + ", RoleID=" + RoleID + "]";
	}

	
	
	
}
