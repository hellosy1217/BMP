package com.project.bmp.post.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.post.model.vo.AttachedFile;
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

	public int addFile(SqlSessionTemplate sqlSession, AttachedFile file) {
		return sqlSession.insert("postMapper.addFile", file);
	}

	public Post getPost(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("postMapper.getPost",no);
	}

	public int delPost(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("postMapper.delPost", no);
	}

	public int addCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("postMapper.addCount", no);
	}

}
