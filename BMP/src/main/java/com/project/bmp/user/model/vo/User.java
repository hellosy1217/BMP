package com.project.bmp.user.model.vo;

public class User {
	private int no;
	private String email;
	private String password;
	private String nickname;
	private String birth;
	private String phone;
	private String reg_date;
	private String del_date;
	private char confirm;
	private char alarm;
	private char dm;
	private char sub;
	private char UserPrivate;
	private char admin;
	private String comment;
	private String filePath;
	private String fileName;
	private int follow;
	private int follower;
	private int post;

	public User() {
	}

	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	
	public User(String email, String password, String nickname, char admin) {
		super();
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.admin = admin;
	}

	public User(int no, String nickname, String filePath, String fileName) {
		super();
		this.no = no;
		this.nickname = nickname;
		this.filePath = filePath;
		this.fileName = fileName;
	}

	public User(int no, String email, String nickname, String reg_date, String del_date, char confirm, char sub,
			int follow, int follower, int post) {
		super();
		this.no = no;
		this.email = email;
		this.nickname = nickname;
		this.reg_date = reg_date;
		this.del_date = del_date;
		this.confirm = confirm;
		this.sub = sub;
		this.follow = follow;
		this.follower = follower;
		this.post = post;
	}

	public User(int no, String email, String nickname, String birth, String reg_date, char dm, char UserPrivate,
			String comment, String filePath, String fileName, int follow, int follower) {
		super();
		this.no = no;
		this.email = email;
		this.nickname = nickname;
		this.birth = birth;
		this.reg_date = reg_date;
		this.dm = dm;
		this.UserPrivate = UserPrivate;
		this.comment = comment;
		this.filePath = filePath;
		this.fileName = fileName;
		this.follow = follow;
		this.follower = follower;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getDel_date() {
		return del_date;
	}

	public void setDel_date(String del_date) {
		this.del_date = del_date;
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

	public void setUserPrivate(char UserPrivate) {
		this.UserPrivate = UserPrivate;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

	@Override
	public String toString() {
		return "User [no=" + no + ", email=" + email + ", password=" + password + ", nickname=" + nickname + ", birth="
				+ birth + ", phone=" + phone + ", reg_date=" + reg_date + ", del_date=" + del_date + ", confirm="
				+ confirm + ", alarm=" + alarm + ", dm=" + dm + ", sub=" + sub + ", UserPrivate=" + UserPrivate
				+ ", admin=" + admin + ", comment=" + comment + ", filePath=" + filePath + ", fileName=" + fileName
				+ ", follow=" + follow + ", follower=" + follower + ", post=" + post + "]";
	}

}
