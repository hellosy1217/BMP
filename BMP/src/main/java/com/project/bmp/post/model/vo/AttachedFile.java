package com.project.bmp.post.model.vo;

import java.util.ArrayList;

public class AttachedFile {
	private int no;
	private String name;
	private String fileClass;
	private int userNo;
	private int postNo;
	private int reportNo;
	private ArrayList<String> fileNames;

	public AttachedFile() {
	}

	public AttachedFile(int postNo, ArrayList<String> fileNames) {
		super();
		this.postNo = postNo;
		this.fileNames = fileNames;
	}

	public AttachedFile(String name, String fileClass, int userNo, int postNo, int reportNo) {
		super();
		this.name = name;
		this.fileClass = fileClass;
		this.userNo = userNo;
		this.postNo = postNo;
		this.reportNo = reportNo;
	}

	public AttachedFile(int no, String name, String fileClass, int userNo, int postNo, int reportNo) {
		super();
		this.no = no;
		this.name = name;
		this.fileClass = fileClass;
		this.userNo = userNo;
		this.postNo = postNo;
		this.reportNo = reportNo;
	}

	public AttachedFile(int no, String name, String fileClass, int userNo, int postNo, int reportNo,
			ArrayList<String> fileNames) {
		super();
		this.no = no;
		this.name = name;
		this.fileClass = fileClass;
		this.userNo = userNo;
		this.postNo = postNo;
		this.reportNo = reportNo;
		this.fileNames = fileNames;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileClass() {
		return fileClass;
	}

	public void setFileClass(String fileClass) {
		this.fileClass = fileClass;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public ArrayList<String> getFileNames() {
		return fileNames;
	}

	public void setFileNames(ArrayList<String> fileNames) {
		this.fileNames = fileNames;
	}

}
