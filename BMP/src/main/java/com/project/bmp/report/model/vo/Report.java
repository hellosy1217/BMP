package com.project.bmp.report.model.vo;

import java.sql.Date;

public class Report {
	private int no;
	private String title;
	private String content;
	private Date regDate;
	private String comment;
	private Date commDate;
	private Date delDate;
	private int postNo;
	private int userNo;
	private String nickname;
	private String email;

	public Report() {
	}

	public Report(String title, String content, int postNo, int userNo) {
		super();
		this.title = title;
		this.content = content;
		this.postNo = postNo;
		this.userNo = userNo;
	}

	public Report(int no, String title, String content, Date regDate, String comment, Date commDate, Date delDate,
			int postNo, int userNo, String nickname, String email) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.comment = comment;
		this.commDate = commDate;
		this.delDate = delDate;
		this.postNo = postNo;
		this.userNo = userNo;
		this.nickname = nickname;
		this.email = email;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Report [no=" + no + ", title=" + title + ", content=" + content + ", regDate=" + regDate + ", comment="
				+ comment + ", commDate=" + commDate + ", delDate=" + delDate + ", postNo=" + postNo + ", userNo="
				+ userNo + ", nickname=" + nickname + ", email=" + email + "]";
	}

}
