package com.project.bmp.user.model.service;

import java.util.ArrayList;

import com.project.bmp.user.model.vo.User;

public interface UserService {
	public User selectUser(String email);

	public User getProfile(int no);
}
