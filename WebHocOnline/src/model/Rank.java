package model;

public class Rank {
	String RankID;
	String UserID;
	String Rank;
	String Enable;
	
	public Rank() {
		super();
	}
	
	public Rank(String rankID, String userID, String rank, String enable) {
		super();
		RankID = rankID;
		UserID = userID;
		Rank = rank;
		Enable = enable;
	}

	public String getRankID() {
		return RankID;
	}

	public void setRankID(String rankID) {
		RankID = rankID;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getRank() {
		return Rank;
	}

	public void setRank(String rank) {
		Rank = rank;
	}

	public String getEnable() {
		return Enable;
	}

	public void setEnable(String enable) {
		Enable = enable;
	}

	@Override
	public String toString() {
		return "Rank [RankID=" + RankID + ", UserID=" + UserID + ", Rank=" + Rank + ", Enable=" + Enable + "]";
	}

	
	
}
