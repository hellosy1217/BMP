package com.project.bmp.dm.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.common.Paging;
import com.project.bmp.dm.model.vo.DM;
import com.project.bmp.dm.model.vo.Room;

@Repository("dDAO")
public class DMDAO {

	public int listCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("dmMapper.listCount", no);
	}

	public ArrayList<Room> getList(SqlSessionTemplate sqlSession, int no, Paging paging) {
		int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
		return (ArrayList) sqlSession.selectList("dmMapper.getList", no, rowBounds);
	}

	public Room getMessage(SqlSessionTemplate sqlSession, DM dm) {
		return (Room) sqlSession.selectOne("dmMapper.getMessage", dm);
	}

}
