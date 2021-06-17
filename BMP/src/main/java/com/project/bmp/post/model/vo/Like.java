package com.project.bmp.post.model.vo;

public class Like {
	private int no;
	private String date;
	private int userNo;
	private int commentNo;
	private int postNo;

	public Like() {
	}

	public Like(int no, String date, int userNo, int commentNo, int postNo) {
		super();
		this.no = no;
		this.date = date;
		this.userNo = userNo;
		this.commentNo = commentNo;
		this.postNo = postNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "Like [no=" + no + ", date=" + date + ", userNo=" + userNo + ", commentNo=" + commentNo + ", postNo="
				+ postNo + "]";
	}

}
