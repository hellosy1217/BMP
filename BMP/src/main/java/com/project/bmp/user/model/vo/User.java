package com.project.bmp.user.model.vo;

import java.sql.Date;

public class User {
	private int no;
	private String email;
	private String password;
	private String nickname;
	private String birth;
	private String phone;
	private Date regDate;
	private Date delDate;
	private char confirm;
	private char alarm;
	private char dm;
	private char sub;
	private char UserPrivate;
	private char admin;
	private String comment;
	private String fileName;
	private int follow;
	private int follower;
	private int post;
	private int blocked;
	private Follow followInfo;
	private Block blockInfo;

	public User() {
	}

	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public User(int no, int follow, int follower) {
		super();
		this.no = no;
		this.follow = follow;
		this.follower = follower;
	}

	public User(String email, String password, String nickname) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
	}

	public User(String email, String password, String nickname, char admin) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.admin = admin;
	}

	public User(int no, String email, String password, String nickname, String birth, String phone, Date regDate,
			Date delDate, char confirm, char alarm, char dm, char sub, char userPrivate, char admin, String comment,
			String fileName, int follow, int follower, int post, int blocked, Follow followInfo, Block blockInfo) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.regDate = regDate;
		this.delDate = delDate;
		this.confirm = confirm;
		this.alarm = alarm;
		this.dm = dm;
		this.sub = sub;
		UserPrivate = userPrivate;
		this.admin = admin;
		this.comment = comment;
		this.fileName = fileName;
		this.follow = follow;
		this.follower = follower;
		this.post = post;
		this.blocked = blocked;
		this.followInfo = followInfo;
		this.blockInfo = blockInfo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public char getConfirm() {
		return confirm;
	}

	public void setConfirm(char confirm) {
		this.confirm = confirm;
	}

	public char getAlarm() {
		return alarm;
	}

	public void setAlarm(char alarm) {
		this.alarm = alarm;
	}

	public char getDm() {
		return dm;
	}

	public void setDm(char dm) {
		this.dm = dm;
	}

	public char getSub() {
		return sub;
	}

	public void setSub(char sub) {
		this.sub = sub;
	}

	public char getUserPrivate() {
		return UserPrivate;
	}

	public void setUserPrivate(char userPrivate) {
		UserPrivate = userPrivate;
	}

	public char getAdmin() {
		return admin;
	}

	public void setAdmin(char admin) {
		this.admin = admin;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFollow() {
		return follow;
	}

	public void setFollow(int follow) {
		this.follow = follow;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	public int getBlocked() {
		return blocked;
	}

	public void setBlocked(int blocked) {
		this.blocked = blocked;
	}

	public Follow getFollowInfo() {
		return followInfo;
	}

	public void setFollowInfo(Follow followInfo) {
		this.followInfo = followInfo;
	}

	public Block getBlockInfo() {
		return blockInfo;
	}

	public void setBlockInfo(Block blockInfo) {
		this.blockInfo = blockInfo;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", email=" + email + ", password=" + password + ", nickname=" + nickname + ", birth="
				+ birth + ", phone=" + phone + ", regDate=" + regDate + ", delDate=" + delDate + ", confirm=" + confirm
				+ ", alarm=" + alarm + ", dm=" + dm + ", sub=" + sub + ", UserPrivate=" + UserPrivate + ", admin="
				+ admin + ", comment=" + comment + ", fileName=" + fileName + ", follow=" + follow + ", follower="
				+ follower + ", post=" + post + ", blocked=" + blocked + ", followInfo=" + followInfo + ", blockInfo="
				+ blockInfo + "]";
	}

}
