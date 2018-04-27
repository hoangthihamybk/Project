package model;


public class Subject {
	String subjectID;
	String subjectName;
	String linkImage;
	String describe;
	String listOfExaminationID;
	String enable;
	public Subject(String subjectID, String subjectName, String linkImage, String describe, String listOfExaminationID,
			String enable) {
		super();
		this.subjectID = subjectID;
		this.subjectName = subjectName;
		this.linkImage = linkImage;
		this.describe = describe;
		this.listOfExaminationID = listOfExaminationID;
		this.enable = enable;
	}
	public String getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getLinkImage() {
		return linkImage;
	}
	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getListOfExaminationID() {
		return listOfExaminationID;
	}
	public void setListOfExaminationID(String listOfExaminationID) {
		this.listOfExaminationID = listOfExaminationID;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "Subject [subjectID=" + subjectID + ", subjectName=" + subjectName + ", linkImage=" + linkImage
				+ ", describe=" + describe + ", listOfExaminationID=" + listOfExaminationID + ", enable=" + enable
				+ "]";
	}
	public Subject() {
		super();
	}
	
	
}
