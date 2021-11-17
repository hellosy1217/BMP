package com.project.bmp.dm.model.vo;

import java.sql.Date;

public class DM {
	private int no;
	private String content;
	private Date regDate;
	private int roomNo;
	private int userNo;
	private String nickname;
	private String fileName;
	private Date readDate;

	public DM() {
	}

	public DM(int roomNo, int userNo) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
	}

	public DM(int no, String content, Date regDate, Date readDate, int roomNo, int userNo, String nickname,
			String fileName) {
		super();
		this.no = no;
		this.content = content;
		this.regDate = regDate;
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.nickname = nickname;
		this.fileName = fileName;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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

	public Date getReadDate() {
		return readDate;
	}

	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}

	@Override
	public String toString() {
		return "DM [no=" + no + ", content=" + content + ", regDate=" + regDate + ", roomNo=" + roomNo + ", userNo="
				+ userNo + ", nickname=" + nickname + ", fileName=" + fileName + "]";
	}

}
