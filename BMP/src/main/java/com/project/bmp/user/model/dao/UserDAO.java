package com.project.bmp.user.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.user.model.vo.Follow;
import com.project.bmp.user.model.vo.User;

@Repository("uDAO")
public class UserDAO {

	public User selectUser(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("userMapper.selectUser", email);
	}

	public User selectUser(SqlSessionTemplate sqlSession, User accessor) {
		return sqlSession.selectOne("userMapper.selectGoogleUser", accessor);
	}

	public User getProfile(SqlSessionTemplate sqlSession, Follow follow) {
		return sqlSession.selectOne("userMapper.getProfile", follow);
	}

	public int addUser(SqlSessionTemplate sqlSession, User accessor) {
		return sqlSession.insert("userMapper.addUser", accessor);
	}

	public int updateConfirm(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("userMapper.updateConfirm", email);
	}

	public int updatePw(SqlSessionTemplate sqlSession, User accessor) {
		return sqlSession.update("userMapper.updatePw", accessor);
	}

	public int addFollow(SqlSessionTemplate sqlSession, Follow follow) {
		return sqlSession.delete("userMapper.addFollow", follow);
	}

	public int delFollow(SqlSessionTemplate sqlSession, Follow follow) {
		return sqlSession.delete("userMapper.delFollow", follow);
	}

	public int editUser(SqlSessionTemplate sqlSession, User user) {
		return sqlSession.update("userMapper.editUser", user);
	}

	public int addFile(SqlSessionTemplate sqlSession, User user) {
		return sqlSession.insert("userMapper.addFile", user);
	}

	public int editFile(SqlSessionTemplate sqlSession, User user) {
		return sqlSession.update("userMapper.editFile", user);
	}

	public int delFile(SqlSessionTemplate sqlSession, User user) {
		return sqlSession.delete("userMapper.delFile", user);
	}

	public ArrayList<User> getFollow(SqlSessionTemplate sqlSession, User user) {
		return (ArrayList) sqlSession.selectList("userMapper.getFollow", user);
	}

}
