package com.project.bmp.post.model.vo;

public class Tag {
	private int no;
	private String name;
	private int post_no;

	public Tag() {
	}

	public Tag(int no, String name, int post_no) {
		super();
		this.no = no;
		this.name = name;
		this.post_no = post_no;
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

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

}
