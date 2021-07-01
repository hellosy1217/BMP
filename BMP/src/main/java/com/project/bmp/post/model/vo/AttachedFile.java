package com.project.bmp.post.model.vo;

public class AttachedFile {
	private int no;
	private String name;
	private String fileClass;
	private int userNo;
	private int postNo;
	private int reportNo;

	public AttachedFile() {
	}

	public AttachedFile(int postNo) {
		super();
		this.postNo = postNo;
	}

	public AttachedFile(String name, int userNo, int postNo, int reportNo) {
		super();
		this.name = name;
		this.userNo = userNo;
		this.postNo = postNo;
		this.reportNo = reportNo;
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

}
