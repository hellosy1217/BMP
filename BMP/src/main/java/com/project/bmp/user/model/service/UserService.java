package com.project.bmp.user.model.service;

import com.project.bmp.user.model.vo.Follow;
import com.project.bmp.user.model.vo.User;

public interface UserService {
	public User selectUser(String email);

	public User selectUser(User accessor);
	
	public User getProfile(Follow follow);

	public int addUser(User accessor);

	public int updateConfirm(String email);

	public int updatePw(User accessor);

	public int addFollow(Follow follow);
	
	public int delFollow(Follow follow);

}
