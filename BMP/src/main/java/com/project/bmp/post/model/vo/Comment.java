package com.project.bmp.post.model.vo;

public class Comment {
	private int no;
	private String content;
	private int postNo;
	private int userNo;
	private String nickname;
	private String fileName;
	private int countLike;

	public Comment() {
	}

	public Comment(int no, String content, int postNo, int userNo, String nickname, String fileName, int countLike) {
		super();
		this.no = no;
		this.content = content;
		this.postNo = postNo;
		this.userNo = userNo;
		this.nickname = nickname;
		this.fileName = fileName;
		this.countLike = countLike;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	@Override
	public String toString() {
		return "Comment [no=" + no + ", content=" + content + ", postNo=" + postNo + ", userNo=" + userNo
				+ ", nickname=" + nickname + ", fileName=" + fileName + ", countLike=" + countLike + "]";
	}

}
