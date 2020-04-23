package cn.jxau.metting.metting.domain;

public class Score {
	private int sid;
	private char uid;
	private int score;
	private int bid;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	@Override
	public String toString() {
		return "score [sid=" + sid + ", uid=" + uid + ", score=" + score
				+ ", bid=" + bid + "]";
	}
	public char getUid() {
		return uid;
	}
	public void setUid(char uid) {
		this.uid = uid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
}
