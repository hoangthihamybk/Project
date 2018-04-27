package model;

public class Exam {
	String examID;
	String classID;
	String subjectID;
	String examName;
	String describe;
	String numberOfQuestions;
	String time;
	String numberOfPeople;
	String linkContent;
	String dateCreate;
	String enable;
	
	public Exam() {
		super();
	}
	public Exam(String examID, String classID, String subjectID, String examName, String describe,
			String numberOfQuestions, String time, String numberOfPeople, String linkContent, String dateCreate,
			String enable) {
		super();
		this.examID = examID;
		this.classID = classID;
		this.subjectID = subjectID;
		this.examName = examName;
		this.describe = describe;
		this.numberOfQuestions = numberOfQuestions;
		this.time = time;
		this.numberOfPeople = numberOfPeople;
		this.linkContent = linkContent;
		this.dateCreate = dateCreate;
		this.enable = enable;
	}
	public String getExamID() {
		return examID;
	}
	public void setExamID(String examID) {
		this.examID = examID;
	}
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	public String getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getNumberOfQuestions() {
		return numberOfQuestions;
	}
	public void setNumberOfQuestions(String numberOfQuestions) {
		this.numberOfQuestions = numberOfQuestions;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getNumberOfPeople() {
		return numberOfPeople;
	}
	public void setNumberOfPeople(String numberOfPeople) {
		this.numberOfPeople = numberOfPeople;
	}
	public String getLinkContent() {
		return linkContent;
	}
	public void setLinkContent(String linkContent) {
		this.linkContent = linkContent;
	}
	public String getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(String dateCreate) {
		this.dateCreate = dateCreate;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "Exam [examID=" + examID + ", classID=" + classID + ", subjectID=" + subjectID + ", examName=" + examName
				+ ", describe=" + describe + ", numberOfQuestions=" + numberOfQuestions + ", time=" + time
				+ ", numberOfPeople=" + numberOfPeople + ", linkContent=" + linkContent + ", dateCreate=" + dateCreate
				+ ", enable=" + enable + "]";
	}
	
}
