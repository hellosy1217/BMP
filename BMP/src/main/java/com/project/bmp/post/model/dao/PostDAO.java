package com.project.bmp.post.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.common.Paging;
import com.project.bmp.post.model.vo.AttachedFile;
import com.project.bmp.post.model.vo.Comment;
import com.project.bmp.post.model.vo.Like;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;

@Repository("pDAO")
public class PostDAO {

	public int getListCount(SqlSessionTemplate sqlSession, ListInfo listInfo) {
		return sqlSession.selectOne("postMapper.listCount");
	}

	public ArrayList<Post> getPostList(SqlSessionTemplate sqlSession, ListInfo listInfo) {
		int offset = (listInfo.getPaging().getCurrentPage() - 1) * listInfo.getPaging().getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, listInfo.getPaging().getBoardLimit());
		return (ArrayList) sqlSession.selectList("postMapper.getPostList", listInfo, rowBounds);
	}

	public int addLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.insert("postMapper.addLike", like);
	}

	public int delLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.delete("postMapper.delLike", like);
	}

	public int addPost(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.insert("postMapper.addPost", post);
	}

	public int addFile(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.insert("postMapper.addFile", post);
	}

	public Post getPost(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.selectOne("postMapper.getPost", post);
	}

	public int delPost(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("postMapper.delPost", no);
	}

	public int addCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("postMapper.addCount", no);
	}

	public ArrayList<Comment> getComment(SqlSessionTemplate sqlSession, int no, Paging paging) {
		int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
		return (ArrayList) sqlSession.selectList("postMapper.getComment", no, rowBounds);
	}

	public ArrayList<String> getFileNames(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList) sqlSession.selectList("postMapper.getFile", no);
	}

	public int editHideDate(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.update("postMapper.editHideDate", post);
	}

	public int delFile(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.delete("postMapper.delFile", no);
	}

	public int editPost(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.update("postMapper.editPost", post);
	}

	public int addComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.insert("postMapper.addComment", comment);
	}

	public int delComment(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.delete("postMapper.delComment", no);
	}

}
