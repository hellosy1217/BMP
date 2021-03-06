package com.project.bmp.user.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.dm.model.vo.DM;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.user.model.vo.Block;
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

	public ArrayList<User> getFollowList(SqlSessionTemplate sqlSession, User user) {
		return (ArrayList) sqlSession.selectList("userMapper.getFollow", user);
	}

	public User getFollow(SqlSessionTemplate sqlSession, Follow follow) {
		return sqlSession.selectOne("userMapper.getFollow", follow);
	}

	public int addBlock(SqlSessionTemplate sqlSession, Block block) {
		return sqlSession.insert("userMapper.addBlock", block);
	}

	public int delBlock(SqlSessionTemplate sqlSession, Block block) {
		return sqlSession.delete("userMapper.delBlock", block);
	}

	public int getListCount(SqlSessionTemplate sqlSession, ListInfo listInfo) {
		return sqlSession.selectOne("userMapper.listCount", listInfo);
	}

	public ArrayList<User> getUserList(SqlSessionTemplate sqlSession, ListInfo listInfo) {
		int offset = (listInfo.getPaging().getCurrentPage() - 1) * listInfo.getPaging().getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, listInfo.getPaging().getBoardLimit());
		return (ArrayList) sqlSession.selectList("userMapper.getUserList", listInfo, rowBounds);
	}

	public int delUsers(SqlSessionTemplate sqlSession, ArrayList<String> users) {
		return sqlSession.update("userMapper.delUsers", users);
	}

}
