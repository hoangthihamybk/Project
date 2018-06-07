package model;

public class ScoreBoard {
	String SBID;
	String UserID;
	String ExamID;
	String TimeEnd;
	String NumberOfCorrectSentences;
	String ScoreBoard;
	String EvaluationID;
	String AccumulatedPoints;
	String Enable;
	
	public ScoreBoard() {
		super();
	}

	public ScoreBoard(String sBID, String userID, String examID, String timeEnd, String numberOfCorrectSentences,
			String scoreBoard, String evaluationID, String accumulatedPoints, String enable) {
		super();
		SBID = sBID;
		UserID = userID;
		ExamID = examID;
		TimeEnd = timeEnd;
		NumberOfCorrectSentences = numberOfCorrectSentences;
		ScoreBoard = scoreBoard;
		EvaluationID = evaluationID;
		AccumulatedPoints = accumulatedPoints;
		Enable = enable;
	}

	public String getSBID() {
		return SBID;
	}

	public void setSBID(String sBID) {
		SBID = sBID;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getExamID() {
		return ExamID;
	}

	public void setExamID(String examID) {
		ExamID = examID;
	}

	public String getTimeEnd() {
		return TimeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		TimeEnd = timeEnd;
	}

	public String getNumberOfCorrectSentences() {
		return NumberOfCorrectSentences;
	}

	public void setNumberOfCorrectSentences(String numberOfCorrectSentences) {
		NumberOfCorrectSentences = numberOfCorrectSentences;
	}

	public String getScoreBoard() {
		return ScoreBoard;
	}

	public void setScoreBoard(String scoreBoard) {
		ScoreBoard = scoreBoard;
	}

	public String getEvaluationID() {
		return EvaluationID;
	}

	public void setEvaluationID(String evaluationID) {
		EvaluationID = evaluationID;
	}

	public String getAccumulatedPoints() {
		return AccumulatedPoints;
	}

	public void setAccumulatedPoints(String accumulatedPoints) {
		AccumulatedPoints = accumulatedPoints;
	}

	public String getEnable() {
		return Enable;
	}

	public void setEnable(String enable) {
		Enable = enable;
	}

	@Override
	public String toString() {
		return "ScoreBoard [SBID=" + SBID + ", UserID=" + UserID + ", ExamID=" + ExamID + ", TimeEnd=" + TimeEnd
				+ ", NumberOfCorrectSentences=" + NumberOfCorrectSentences + ", ScoreBoard=" + ScoreBoard
				+ ", EvaluationID=" + EvaluationID + ", AccumulatedPoints=" + AccumulatedPoints + ", Enable=" + Enable
				+ "]";
	}
	
}