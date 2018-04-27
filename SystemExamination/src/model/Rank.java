package model;

public class Rank {
	String rankID;
	String userID;
	String rank;
	String enable;
	
	public Rank() {
		super();
	}
	public Rank(String rankID, String userID, String rank, String enable) {
		super();
		this.rankID = rankID;
		this.userID = userID;
		this.rank = rank;
		this.enable = enable;
	}
	public String getRankID() {
		return rankID;
	}
	public void setRankID(String rankID) {
		this.rankID = rankID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "Rank [rankID=" + rankID + ", userID=" + userID + ", rank=" + rank + ", enable=" + enable + "]";
	}
	
}
