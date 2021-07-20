package com.project.bmp.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.common.Paging;
import com.project.bmp.report.model.vo.Report;

@Repository("rDAO")
public class ReportDAO {

	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.listCount");
	}
	
	public ArrayList<Report> getList(SqlSessionTemplate sqlSession, Paging paging) {
		int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
		return (ArrayList) sqlSession.selectList("reportMapper.getList");
	}

}
