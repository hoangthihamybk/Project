package model;

public class UserDetail {
	String userID;
	String fullName;
	String gender;
	String birthDay;
	String phoneNumber;
	String address;
	String linkImage;
	
	public UserDetail(String userID) {
		this.userID = userID;
	}
	
	public UserDetail(String userID, String fullname, String gender, String birthDay, String phoneNumber, String address,
			String linkImage) {
		super();
		this.userID = userID;
		this.fullName = fullname;
		this.gender = gender;
		this.birthDay = birthDay;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.linkImage = linkImage;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String name) {
		this.fullName = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLinkImage() {
		return linkImage;
	}
	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}
	@Override
	public String toString() {
		return "UserDetail [userID=" + userID + ", name=" + fullName + ", gender=" + gender + ", birthDay=" + birthDay
				+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", linkImage=" + linkImage + "]";
	}
	
}
