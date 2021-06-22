package com.project.bmp.post.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Post {
	private int no;
	private String title;
	private String content;
	private int count;
	private Date regDate;
	private Date editDate;
	private Date delDate;
	private Date hideDate;
	private int userNo;
	private String fileName;
	private int countComment;
	private ArrayList<Tag> tagList;
	private int countLike;
	private int like;
	private int repost;
	private String nickname;
	private String profileFile;
	private ArrayList<Comment> commentList;

	public Post() {
	}

	public Post(int no, String title, String content, int count, Date regDate, Date editDate, Date delDate,
			Date hideDate, int userNo, String fileName, int countComment, ArrayList<Tag> tagList, int countLike,
			int like, int repost, String nickname, String profileFile, ArrayList<Comment> commentList) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.count = count;
		this.regDate = regDate;
		this.editDate = editDate;
		this.delDate = delDate;
		this.hideDate = hideDate;
		this.userNo = userNo;
		this.fileName = fileName;
		this.countComment = countComment;
		this.tagList = tagList;
		this.countLike = countLike;
		this.like = like;
		this.repost = repost;
		this.nickname = nickname;
		this.profileFile = profileFile;
		this.commentList = commentList;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public Date getHideDate() {
		return hideDate;
	}

	public void setHideDate(Date hideDate) {
		this.hideDate = hideDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getCountComment() {
		return countComment;
	}

	public void setCountComment(int countComment) {
		this.countComment = countComment;
	}

	public ArrayList<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<Tag> tagList) {
		this.tagList = tagList;
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

	public ArrayList<Comment> getComment() {
		return commentList;
	}

	public void setComment(ArrayList<Comment> commentList) {
		this.commentList = commentList;
	}

}
