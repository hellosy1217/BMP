package com.project.bmp.user.model.service;

import com.project.bmp.user.model.vo.User;

public interface UserService {
	public User selectUser(String email);

	public User selectUser(User accessor);
	
	public User getProfile(int no);

	public int addUser(User accessor);

	public int updateConfirm(String email);

	public int updatePw(User accessor);

}
