package model;

public class ContentExam {
	String MaDeThi;
	String QuestionID;
	String Answer;
	String Evaluation;
	
	public ContentExam(String maDeThi, String questionID, String answer, String evaluation) {
		super();
		MaDeThi = maDeThi;
		QuestionID = questionID;
		Answer = answer;
		Evaluation = evaluation;
	}
	public ContentExam() {
		super();
	}
	public String getMaDeThi() {
		return MaDeThi;
	}
	public void setMaDeThi(String maDeThi) {
		MaDeThi = maDeThi;
	}
	public String getQuestionID() {
		return QuestionID;
	}
	public void setQuestionID(String questionID) {
		QuestionID = questionID;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	public String getEvaluation() {
		return Evaluation;
	}
	public void setEvaluation(String evaluation) {
		Evaluation = evaluation;
	}
	@Override
	public String toString() {
		return "ContentExam [MaDeThi=" + MaDeThi + ", QuestionID=" + QuestionID + ", Answer=" + Answer + ", Evaluation="
				+ Evaluation + "]";
	}
	
}
