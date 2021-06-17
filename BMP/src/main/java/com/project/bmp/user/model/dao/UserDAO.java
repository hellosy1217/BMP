package com.project.bmp.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.user.model.vo.User;

@Repository("uDAO")
public class UserDAO {

	public User selectUser(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("userMapper.selectUser", email);
	}

	public User getProfile(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("userMapper.getProfile", no);
	}

}
