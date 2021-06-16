package com.project.bmp.post.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;

@Repository("pDAO")
public class PostDAO {

	public int getListCount(SqlSessionTemplate sqlSession, ListInfo listInfo) {
		return sqlSession.selectOne("postMapper.listCount");
	}

	public ArrayList<Post> getPost(SqlSessionTemplate sqlSession, ListInfo listInfo) {
		int offset = (listInfo.getPaging().getCurrentPage() - 1) * listInfo.getPaging().getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, listInfo.getPaging().getBoardLimit());
		return (ArrayList) sqlSession.selectList("postMapper.getPost", listInfo, rowBounds);
	}

}
