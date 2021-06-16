package com.project.bmp.post.model.vo;

public class Post {
	private int no;
	private String title;
	private String content;
	private int count;
	private String regDate;
	private String editDate;
	private String delDate;
	private String hide_date;
	private int userNo;
	private String tag;
	private String file;
	private String path;
	private int countLike;
	private int like;
	private int repost;
	private String nickname;
	private String profileFile;
	private String profilePath;

	public Post() {
	}

	public Post(int no, String title, String content, int count, String regDate, String editDate, int userNo,
			String tag, String file, String path, int countLike, int like, int repost, String nickname,
			String profileFile, String profilePath) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.count = count;
		this.regDate = regDate;
		this.editDate = editDate;
		this.userNo = userNo;
		this.tag = tag;
		this.file = file;
		this.path = path;
		this.countLike = countLike;
		this.like = like;
		this.repost = repost;
		this.nickname = nickname;
		this.profileFile = profileFile;
		this.profilePath = profilePath;
	}

	public Post(int no, String title, String content, int count, String regDate, String editDate, String delDate,
			String hide_date, int userNo, String tag, String file, String path, int countLike, int like, int repost,
			String nickname, String profileFile, String profilePath) {
		super();
		this.title = title;
		this.no = no;
		this.content = content;
		this.count = count;
		this.regDate = regDate;
		this.editDate = editDate;
		this.delDate = delDate;
		this.hide_date = hide_date;
		this.userNo = userNo;
		this.tag = tag;
		this.file = file;
		this.path = path;
		this.countLike = countLike;
		this.like = like;
		this.repost = repost;
		this.nickname = nickname;
		this.profileFile = profileFile;
		this.profilePath = profilePath;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getEditDate() {
		return editDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public String getHide_date() {
		return hide_date;
	}

	public void setHide_date(String hide_date) {
		this.hide_date = hide_date;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getRepost() {
		return repost;
	}

	public void setRepost(int repost) {
		this.repost = repost;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileFile() {
		return profileFile;
	}

	public void setProfileFile(String profileFile) {
		this.profileFile = profileFile;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "Post [no=" + no + ", title=" + title + ", content=" + content + ", count=" + count + ", regDate="
				+ regDate + ", editDate=" + editDate + ", delDate=" + delDate + ", hide_date=" + hide_date + ", userNo="
				+ userNo + ", tag=" + tag + ", file=" + file + ", path=" + path + ", countLike=" + countLike + ", like="
				+ like + ", repost=" + repost + ", nickname=" + nickname + ", profileFile=" + profileFile
				+ ", profilePath=" + profilePath + "]";
	}

}
