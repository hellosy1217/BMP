package com.project.bmp.post.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.common.Paging;
import com.project.bmp.post.model.dao.PostDAO;
import com.project.bmp.post.model.vo.AttachedFile;
import com.project.bmp.post.model.vo.Comment;
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
	public ArrayList<Post> getPostList(ListInfo listInfo) {
		return pDAO.getPostList(sqlSession, listInfo);
	}

	@Override
	public int addLike(Like like) {
		return pDAO.addLike(sqlSession, like);
	}

	@Override
	public int delLike(Like like) {
		return pDAO.delLike(sqlSession, like);
	}

	@Override
	public int addPost(Post post) {
		return pDAO.addPost(sqlSession, post);
	}

	@Override
	public int addFile(Post post) {
		return pDAO.addFile(sqlSession, post);
	}

	@Override
	public Post getPost(Post post) {
		return pDAO.getPost(sqlSession, post);
	}

	@Override
	public int delPost(int no) {
		return pDAO.delPost(sqlSession, no);
	}

	@Override
	public int addCount(int no) {
		return pDAO.addCount(sqlSession, no);
	}

	@Override
	public ArrayList<Comment> getComment(int no, Paging paging) {
		return pDAO.getComment(sqlSession, no, paging);
	}

	@Override
	public ArrayList<String> getFileNames(int no) {
		return pDAO.getFileNames(sqlSession, no);
	}

	@Override
	public int editHideDate(Post post) {
		return pDAO.editHideDate(sqlSession, post);
	}

	@Override
	public int delFile(int no) {
		return pDAO.delFile(sqlSession, no);
	}

	@Override
	public int editPost(Post post) {
		return pDAO.editPost(sqlSession, post);
	}

	@Override
	public int addComment(Comment comment) {
		return pDAO.addComment(sqlSession, comment);
	}

	@Override
	public int delComment(int no) {
		return pDAO.delComment(sqlSession, no);
	}

	@Override
	public int delPosts(ArrayList<String> posts) {
		return pDAO.delPosts(sqlSession, posts);
	}
}
