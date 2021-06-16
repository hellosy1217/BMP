package com.project.bmp.user.model.service;

import com.project.bmp.user.model.vo.User;

public interface UserService {
	public User selectUser(String email);
}
