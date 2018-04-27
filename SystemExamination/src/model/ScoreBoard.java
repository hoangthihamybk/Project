package model;

public class ScoreBoard {
	String scoreBoardID;
	String userID;
	String examID;
	String timeEnd;
	String numberOfCorrectSentences;
	String score;
	String evaluationID;
	String accumulatedPoints;
	String enable;
	
	public ScoreBoard() {
		super();
	}
	public ScoreBoard(String scoreBoardID, String userID, String examID, String timeEnd,
			String numberOfCorrectSentences, String score, String evaluationID, String accumulatedPoints,
			String enable) {
		super();
		this.scoreBoardID = scoreBoardID;
		this.userID = userID;
		this.examID = examID;
		this.timeEnd = timeEnd;
		this.numberOfCorrectSentences = numberOfCorrectSentences;
		this.score = score;
		this.evaluationID = evaluationID;
		this.accumulatedPoints = accumulatedPoints;
		this.enable = enable;
	}
	public String getScoreBoardID() {
		return scoreBoardID;
	}
	public void setScoreBoardID(String scoreBoardID) {
		this.scoreBoardID = scoreBoardID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getExamID() {
		return examID;
	}
	public void setExamID(String examID) {
		this.examID = examID;
	}
	public String getTimeEnd() {
		return timeEnd;
	}
	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}
	public String getNumberOfCorrectSentences() {
		return numberOfCorrectSentences;
	}
	public void setNumberOfCorrectSentences(String numberOfCorrectSentences) {
		this.numberOfCorrectSentences = numberOfCorrectSentences;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(String evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getAccumulatedPoints() {
		return accumulatedPoints;
	}
	public void setAccumulatedPoints(String accumulatedPoints) {
		this.accumulatedPoints = accumulatedPoints;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "ScoreBoard [scoreBoardID=" + scoreBoardID + ", userID=" + userID + ", examID=" + examID + ", timeEnd="
				+ timeEnd + ", numberOfCorrectSentences=" + numberOfCorrectSentences + ", score=" + score
				+ ", evaluationID=" + evaluationID + ", accumulatedPoints=" + accumulatedPoints + ", enable=" + enable
				+ "]";
	}
	
}
