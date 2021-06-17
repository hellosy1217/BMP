package com.project.bmp.post.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.post.model.dao.PostDAO;
import com.project.bmp.post.model.vo.Like;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;

@Service("pService")
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDAO pDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(ListInfo listInfo) {
		return pDAO.getListCount(sqlSession, listInfo);
	}

	@Override
	public ArrayList<Post> getPost(ListInfo listInfo) {
		return pDAO.getPost(sqlSession, listInfo);
	}

	@Override
	public int addLike(Like like) {
		return pDAO.addLike(sqlSession,like);
	}

	@Override
	public int delLike(Like like) {
		return pDAO.delLike(sqlSession,like);
	}
}
