package model;

public class UserDetail {
	String UserID;
	String Fullname;
	String Gender;
	String BirthDay;
	String PhoneNumber;
	String Address;
	String Avatar;
	
	public UserDetail(String UserID) {
		this.UserID = UserID;
	}

	public UserDetail(String userID, String fullname, String gender, String birthDay, String phoneNumber,
			String address, String avatar) {
		super();
		UserID = userID;
		Fullname = fullname;
		Gender = gender;
		BirthDay = birthDay;
		PhoneNumber = phoneNumber;
		Address = address;
		Avatar = avatar;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getFullname() {
		return Fullname;
	}

	public void setFullname(String fullname) {
		Fullname = fullname;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getBirthDay() {
		return BirthDay;
	}

	public void setBirthDay(String birthDay) {
		BirthDay = birthDay;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getAvatar() {
		return Avatar;
	}

	public void setAvatar(String avatar) {
		Avatar = avatar;
	}

	@Override
	public String toString() {
		return "UserDetail [UserID=" + UserID + ", Fullname=" + Fullname + ", Gender=" + Gender + ", BirthDay="
				+ BirthDay + ", PhoneNumber=" + PhoneNumber + ", Address=" + Address + ", Avatar=" + Avatar + "]";
	}

	
}
