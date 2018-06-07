package model;

public class Evaluation {
	String EvaluationID;
	String Title;
	String Content;
	String PercentageOfPoint;
	String Enable;
	
	public Evaluation() {
		super();
	}
	
	public Evaluation(String evaluationID, String title, String content, String percentageOfPoint, String enable) {
		super();
		EvaluationID = evaluationID;
		Title = title;
		Content = content;
		PercentageOfPoint = percentageOfPoint;
		Enable = enable;
	}

	public String getEvaluationID() {
		return EvaluationID;
	}

	public void setEvaluationID(String evaluationID) {
		EvaluationID = evaluationID;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getPercentageOfPoint() {
		return PercentageOfPoint;
	}

	public void setPercentageOfPoint(String percentageOfPoint) {
		PercentageOfPoint = percentageOfPoint;
	}

	public String getEnable() {
		return Enable;
	}

	public void setEnable(String enable) {
		Enable = enable;
	}

	@Override
	public String toString() {
		return "Evaluation [EvaluationID=" + EvaluationID + ", Title=" + Title + ", Content=" + Content
				+ ", PercentageOfPoint=" + PercentageOfPoint + ", Enable=" + Enable + "]";
	}

	
}
