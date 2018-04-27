package model;

import java.util.List;

public class Classed {
	String classID;
	String className;
	String describe;
	String listOfSubject;
	String enable;
	public Classed(String classID, String className, String describe, String listOfSubject, String enable) {
		super();
		this.classID = classID;
		this.className = className;
		this.describe = describe;
		this.listOfSubject = listOfSubject;
		this.enable = enable;
	}
	public Classed() {
		super();
	}
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getListOfSubject() {
		return listOfSubject;
	}
	public void setListOfSubject(String listOfSubject) {
		this.listOfSubject = listOfSubject;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "Classed [classID=" + classID + ", className=" + className + ", describe=" + describe
				+ ", listOfSubject=" + listOfSubject + ", enable=" + enable + "]";
	}
	
}
