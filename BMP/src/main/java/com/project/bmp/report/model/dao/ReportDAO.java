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

	public int addReport(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.insert("reportMapper.addReport", report);
	}

	public int addComment(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.update("reportMapper.addComment", report);
	}

	public Report getReport(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("reportMapper.getReport", no);
	}

}
