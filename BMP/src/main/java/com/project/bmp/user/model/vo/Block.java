package com.project.bmp.user.model.vo;

public class Block {
	private int no;
	private int toUser;
	private int fromUser;

	public Block() {
	}

	public Block(int no, int toUser, int fromUser) {
		super();
		this.no = no;
		this.toUser = toUser;
		this.fromUser = fromUser;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getToUser() {
		return toUser;
	}

	public void setToUser(int toUser) {
		this.toUser = toUser;
	}

	public int getFromUser() {
		return fromUser;
	}

	public void setFromUser(int fromUser) {
		this.fromUser = fromUser;
	}

	@Override
	public String toString() {
		return "Block [no=" + no + ", toUser=" + toUser + ", fromUser=" + fromUser + "]";
	}

}
