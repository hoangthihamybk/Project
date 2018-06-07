package model;

import java.util.ArrayList;
import java.util.List;

public class DeThi {
	String maDeThiID;
	String subjectID;
	String classID;
	String numberOfQuestion;
	String numberAnswerForOneQuestion;
	List<Question> listOfQuestion;
	
	public DeThi(String maDeThiID, String subjectID, String classID, String numberOfQuestion,
			String numberAnswerForOneQuestion) {
		super();
		this.maDeThiID = maDeThiID;
		this.subjectID = subjectID;
		this.classID = classID;
		this.numberOfQuestion = numberOfQuestion;
		this.numberAnswerForOneQuestion = numberAnswerForOneQuestion;
		listOfQuestion = new ArrayList<>();
	}
	public boolean addQuestion(Question q){
		listOfQuestion.add(q);
		return true;
	}
	public DeThi() {
		listOfQuestion = new ArrayList<>();
	}
	public String getMaDeThiID() {
		return maDeThiID;
	}
	public void setMaDeThiID(String maDeThiID) {
		this.maDeThiID = maDeThiID;
	}
	public String getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	public String getNumberOfQuestion() {
		return numberOfQuestion;
	}
	public void setNumberOfQuestion(String numberOfQuestion) {
		this.numberOfQuestion = numberOfQuestion;
	}
	public String getNumberAnswerForOneQuestion() {
		return numberAnswerForOneQuestion;
	}
	public void setNumberAnswerForOneQuestion(String numberAnswerForOneQuestion) {
		this.numberAnswerForOneQuestion = numberAnswerForOneQuestion;
	}
	
	public List<Question> getListOfQuestion() {
		return listOfQuestion;
	}
	public void setListOfQuestion(List<Question> listOfQuestion) {
		this.listOfQuestion = listOfQuestion;
	}
	@Override
	public String toString() {
		return "DeThi [maDeThiID=" + maDeThiID + ", subjectID=" + subjectID + ", classID=" + classID
				+ ", numberOfQuestion=" + numberOfQuestion + ", numberAnswerForOneQuestion="
				+ numberAnswerForOneQuestion + "]";
	}
	
}
