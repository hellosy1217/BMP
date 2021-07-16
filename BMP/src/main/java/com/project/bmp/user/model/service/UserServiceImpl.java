package com.project.bmp.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.user.model.dao.UserDAO;
import com.project.bmp.user.model.vo.Block;
import com.project.bmp.user.model.vo.Follow;
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
	public User getProfile(Follow follow) {
		return uDAO.getProfile(sqlSession, follow);
	}

	@Override
	public int addUser(User accessor) {
		return uDAO.addUser(sqlSession, accessor);
	}

	@Override
	public int updateConfirm(String email) {
		return uDAO.updateConfirm(sqlSession, email);
	}

	@Override
	public int updatePw(User accessor) {
		return uDAO.updatePw(sqlSession, accessor);
	}

	@Override
	public int addFollow(Follow follow) {
		return uDAO.addFollow(sqlSession, follow);
	}

	@Override
	public int delFollow(Follow follow) {
		return uDAO.delFollow(sqlSession, follow);
	}

	@Override
	public int editUser(User user) {
		return uDAO.editUser(sqlSession, user);
	}

	@Override
	public int addFile(User user) {
		return uDAO.addFile(sqlSession, user);
	}

	@Override
	public int editFile(User user) {
		return uDAO.editFile(sqlSession, user);
	}

	@Override
	public int delFile(User user) {
		return uDAO.delFile(sqlSession, user);
	}

	@Override
	public ArrayList<User> getFollowList(User user) {
		return uDAO.getFollowList(sqlSession, user);
	}

	@Override
	public User getFollow(Follow follow) {
		return uDAO.getFollow(sqlSession, follow);
	}

	@Override
	public int addBlock(Block block) {
		return uDAO.addBlock(sqlSession, block);
	}

	@Override
	public int delBlock(Block block) {
		return uDAO.delBlock(sqlSession, block);
	}

}
