package com.project.bmp.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.common.Paging;
import com.project.bmp.report.model.dao.ReportDAO;
import com.project.bmp.report.model.vo.Report;

@Service("rService")
public class ReportServiceImpl implements ReportService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ReportDAO rDAO;

	@Override
	public int listCount() {
		return rDAO.listCount(sqlSession);
	}

	@Override
	public ArrayList<Report> getList(Paging paging) {
		return rDAO.getList(sqlSession, paging);
	}

	@Override
	public int addReport(Report report) {
		return rDAO.addReport(sqlSession, report);
	}

	@Override
	public int addComment(Report report) {
		return rDAO.addComment(sqlSession, report);
	}

	@Override
	public Report getReport(int no) {
		return rDAO.getReport(sqlSession, no);
	}

	@Override
	public int delReports(ArrayList<String> reports) {
		return rDAO.delReports(sqlSession, reports);
	}

}
