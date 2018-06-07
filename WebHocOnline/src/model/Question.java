package model;

import java.util.List;

public class Question {
	String questionID;
	String content;
	List<String>listOfAnswer;
	String answerRight;
	public Question(String questionID, String content, List<String> listOfAnswer, String answerRight) {
		super();
		this.questionID = questionID;
		this.content = content;
		this.listOfAnswer = listOfAnswer;
		this.answerRight = answerRight;
	}
	public Question() {
		super();
	}
	public String getQuestionID() {
		return questionID;
	}
	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<String> getListOfAnswer() {
		return listOfAnswer;
	}
	public void setListOfAnswer(List<String> listOfAnswer) {
		this.listOfAnswer = listOfAnswer;
	}
	public String getAnswerRight() {
		return answerRight;
	}
	public void setAnswerRight(String answerRight) {
		this.answerRight = answerRight;
	}
	@Override
	public String toString() {
		return "Question [questionID=" + questionID + ", content=" + content + ", listOfAnswer=" + listOfAnswer
				+ ", answerRight=" + answerRight + "]\n";
	}
	
}
