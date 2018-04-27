package model;

public class Evaluation {
	String evaluationID;
	String title;
	String content;
	String percentageOfPoint;
	String enable;
	
	public Evaluation() {
		super();
	}
	public Evaluation(String evaluationID, String title, String content, String percentageOfPoint, String enable) {
		super();
		this.evaluationID = evaluationID;
		this.title = title;
		this.content = content;
		this.percentageOfPoint = percentageOfPoint;
		this.enable = enable;
	}
	public String getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(String evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPercentageOfPoint() {
		return percentageOfPoint;
	}
	public void setPercentageOfPoint(String percentageOfPoint) {
		this.percentageOfPoint = percentageOfPoint;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "Evaluation [evaluationID=" + evaluationID + ", title=" + title + ", content=" + content
				+ ", percentageOfPoint=" + percentageOfPoint + ", enable=" + enable + "]";
	}
	
}
