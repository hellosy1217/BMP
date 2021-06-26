package com.project.bmp.dm.model.vo;

import java.util.ArrayList;

public class Room {
	private int no;
	private int userNo;
	private ArrayList<DM> dmList;
	private String fileName;

	public Room() {
	}

	public Room(int no, int userNo, ArrayList<DM> dmList, String fileName) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.dmList = dmList;
		this.fileName = fileName;
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

}
