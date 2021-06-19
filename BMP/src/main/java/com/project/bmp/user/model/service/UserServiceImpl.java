package com.project.bmp.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.user.model.dao.UserDAO;
import com.project.bmp.user.model.vo.User;

@Service("uService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO uDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public User selectUser(String email) {
		return uDAO.selectUser(sqlSession, email);
	}

	@Override
	public User selectUser(User accessor) {
		return uDAO.selectUser(sqlSession, accessor);
	}
	
	@Override
	public User getProfile(int no) {
		return uDAO.getProfile(sqlSession, no);
	}

	@Override
	public int addUser(User accessor) {
		return uDAO.addUser(sqlSession,accessor);
	}

}
