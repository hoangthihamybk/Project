package model;

public class Classed {
	String ClassID;
	String ClassName;
	String Describe;
	String ListOfSubject;
	String Enable;
	
	public Classed(String classID, String className, String describe, String listOfSubject, String enable) {
		super();
		ClassID = classID;
		ClassName = className;
		Describe = describe;
		ListOfSubject = listOfSubject;
		Enable = enable;
	}
	public Classed() {
		super();
	}
	public String getClassID() {
		return ClassID;
	}
	public void setClassID(String classID) {
		ClassID = classID;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String className) {
		ClassName = className;
	}
	public String getDescribe() {
		return Describe;
	}
	public void setDescribe(String describe) {
		Describe = describe;
	}
	public String getListOfSubject() {
		return ListOfSubject;
	}
	public void setListOfSubject(String listOfSubject) {
		ListOfSubject = listOfSubject;
	}
	public String getEnable() {
		return Enable;
	}
	public void setEnable(String enable) {
		Enable = enable;
	}
	@Override
	public String toString() {
		return "Classed [ClassID=" + ClassID + ", ClassName=" + ClassName + ", Describe=" + Describe
				+ ", ListOfSubject=" + ListOfSubject + ", Enable=" + Enable + "]";
	}
	
}
