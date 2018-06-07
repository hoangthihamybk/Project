package model;

public class Exam {
	String ExamID;
	String ClassID;
	String SubjectID;
	String ExamName;
	String Describe;
	String NumberOfQuestions;
	String Time;
	String NumberOfPeople;
	String LinkContent;
	String DateCreate;
	String Enable;
	
	public Exam() {
		super();
	}

	public Exam(String examID, String classID, String subjectID, String examName, String describe,
			String numberOfQuestions, String time, String numberOfPeople, String linkContent, String dateCreate,
			String enable) {
		super();
		ExamID = examID;
		ClassID = classID;
		SubjectID = subjectID;
		ExamName = examName;
		Describe = describe;
		NumberOfQuestions = numberOfQuestions;
		Time = time;
		NumberOfPeople = numberOfPeople;
		LinkContent = linkContent;
		DateCreate = dateCreate;
		Enable = enable;
		
	}

	public String getExamID() {
		return ExamID;
	}

	public void setExamID(String examID) {
		ExamID = examID;
	}

	public String getClassID() {
		return ClassID;
	}

	public void setClassID(String classID) {
		ClassID = classID;
	}

	public String getSubjectID() {
		return SubjectID;
	}

	public void setSubjectID(String subjectID) {
		SubjectID = subjectID;
	}

	public String getExamName() {
		return ExamName;
	}

	public void setExamName(String examName) {
		ExamName = examName;
	}

	public String getDescribe() {
		return Describe;
	}

	public void setDescribe(String describe) {
		Describe = describe;
	}

	public String getNumberOfQuestions() {
		return NumberOfQuestions;
	}

	public void setNumberOfQuestions(String numberOfQuestions) {
		NumberOfQuestions = numberOfQuestions;
	}

	public String getTime() {
		return Time;
	}

	public void setTime(String time) {
		Time = time;
	}

	public String getNumberOfPeople() {
		return NumberOfPeople;
	}

	public void setNumberOfPeople(String numberOfPeople) {
		NumberOfPeople = numberOfPeople;
	}

	public String getLinkContent() {
		return LinkContent;
	}

	public void setLinkContent(String linkContent) {
		LinkContent = linkContent;
	}

	public String getDateCreate() {
		return DateCreate;
	}

	public void setDateCreate(String dateCreate) {
		DateCreate = dateCreate;
	}

	public String getEnable() {
		return Enable;
	}

	public void setEnable(String enable) {
		Enable = enable;
	}

	

	@Override
	public String toString() {
		return "Exam [ExamID=" + ExamID + ", ClassID=" + ClassID + ", SubjectID=" + SubjectID + ", ExamName=" + ExamName
				+ ", Describe=" + Describe + ", NumberOfQuestions=" + NumberOfQuestions + ", Time=" + Time
				+ ", NumberOfPeople=" + NumberOfPeople + ", LinkContent=" + LinkContent + ", DateCreate=" + DateCreate
				+ ", Enable=" + Enable + ",]";
	}

}