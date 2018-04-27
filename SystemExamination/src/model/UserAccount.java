package model;

public class UserAccount {
	String userID;
	String email;
	String password;
	String googleID;
	String facebookID;
	String roleID ;
	
	public UserAccount() {
		super();
	}
	public UserAccount(String userID, String email, String password, String googleID, String facebookID,
			String roleID) {
		super();
		this.userID = userID;
		this.email = email;
		this.password = password;
		this.googleID = googleID;
		this.facebookID = facebookID;
		this.roleID = roleID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGoogleID() {
		return googleID;
	}
	public void setGoogleID(String googleID) {
		this.googleID = googleID;
	}
	public String getFacebookID() {
		return facebookID;
	}
	public void setFacebookID(String facebookID) {
		this.facebookID = facebookID;
	}
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	@Override
	public String toString() {
		return "UserAccount [userID=" + userID + ", email=" + email + ", password=" + password + ", googleID="
				+ googleID + ", facebookID=" + facebookID + ", roleID=" + roleID + "]";
	}
	
}
