package com.project.bmp.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.user.model.vo.User;

@Repository("uDAO")
public class UserDAO {

	public User selectUser(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("userMapper.selectUser", email);
	}

	public User selectUser(SqlSessionTemplate sqlSession, User accessor) {
		return sqlSession.selectOne("userMapper.selectGoogleUser", accessor);
	}

	public User getProfile(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("userMapper.getProfile", no);
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

}
