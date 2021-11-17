package com.project.bmp.dm.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Room {
	private int no;
	private int userNo;
	private ArrayList<DM> dmList;
	private String fileName;
	private Date readDate;
	private int userNo2;

	public Room() {
	}

	public Room(int no, int userNo) {
		super();
		this.no = no;
		this.userNo = userNo;
	}

	public Room(int no, int userNo, ArrayList<DM> dmList, String fileName, Date readDate) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.dmList = dmList;
		this.fileName = fileName;
		this.readDate = readDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public ArrayList<DM> getDmList() {
		return dmList;
	}

	public void setDmList(ArrayList<DM> dmList) {
		this.dmList = dmList;
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

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}

	@Override
	public String toString() {
		return "Room [no=" + no + ", userNo=" + userNo + ", dmList=" + dmList + ", fileName=" + fileName + ", readDate="
				+ readDate + "]";
	}

}
