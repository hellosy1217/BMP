package com.project.bmp.user.model.vo;

public class Follow {
	private int no;
	private char permission;
	private int toUser;
	private int fromUser;

	public Follow() {
	}

	public Follow(int toUser, int fromUser) {
		super();
		this.toUser = toUser;
		this.fromUser = fromUser;
	}

	public Follow(int no, char permission, int toUser, int fromUser) {
		super();
		this.no = no;
		this.permission = permission;
		this.toUser = toUser;
		this.fromUser = fromUser;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public char getPermission() {
		return permission;
	}

	public void setPermission(char permission) {
		this.permission = permission;
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
		return "Follow [no=" + no + ", permission=" + permission + ", toUser=" + toUser + ", fromUser=" + fromUser
				+ "]";
	}

}
