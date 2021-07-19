package com.project.bmp.stats.model.vo;

public class Stats {
	private String date;
	private int countUser;
	private int countVisit;
	private int countPost;

	public Stats() {
	}

	public Stats(String date, int countUser, int countVisit, int countPost) {
		super();
		this.date = date;
		this.countUser = countUser;
		this.countVisit = countVisit;
		this.countPost = countPost;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCountUser() {
		return countUser;
	}

	public void setCountUser(int countUser) {
		this.countUser = countUser;
	}

	public int getCountVisit() {
		return countVisit;
	}

	public void setCountVisit(int countVisit) {
		this.countVisit = countVisit;
	}

	public int getCountPost() {
		return countPost;
	}

	public void setCountPost(int countPost) {
		this.countPost = countPost;
	}

	@Override
	public String toString() {
		return "Stats [date=" + date + ", countUser=" + countUser + ", countVisit=" + countVisit + ", countPost="
				+ countPost + "]";
	}

}
