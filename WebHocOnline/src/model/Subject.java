package model;


public class Subject {
	String SubjectID;
	String SubjectName;
	String LinkImage;
	String Describe;
	String ListOfExaminationID;
	String Enable;
	
	public Subject(String subjectID, String subjectName, String linkImage, String describe, String listOfExaminationID,
			String enable) {
		super();
		SubjectID = subjectID;
		SubjectName = subjectName;
		LinkImage = linkImage;
		Describe = describe;
		ListOfExaminationID = listOfExaminationID;
		Enable = enable;
	}
	
	public String getSubjectID() {
		return SubjectID;
	}

	public void setSubjectID(String subjectID) {
		SubjectID = subjectID;
	}

	public String getSubjectName() {
		return SubjectName;
	}

	public void setSubjectName(String subjectName) {
		SubjectName = subjectName;
	}

	public String getLinkImage() {
		return LinkImage;
	}

	public void setLinkImage(String linkImage) {
		LinkImage = linkImage;
	}

	public String getDescribe() {
		return Describe;
	}

	public void setDescribe(String describe) {
		Describe = describe;
	}

	public String getListOfExaminationID() {
		return ListOfExaminationID;
	}

	public void setListOfExaminationID(String listOfExaminationID) {
		ListOfExaminationID = listOfExaminationID;
	}

	public String getEnable() {
		return Enable;
	}

	public void setEnable(String enable) {
		Enable = enable;
	}

	@Override
	public String toString() {
		return "Subject [SubjectID=" + SubjectID + ", SubjectName=" + SubjectName + ", LinkImage=" + LinkImage
				+ ", Describe=" + Describe + ", ListOfExaminationID=" + ListOfExaminationID + ", Enable=" + Enable
				+ "]";
	}

	public Subject() {
		super();
	}
	
	
}
