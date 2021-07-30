package com.project.bmp.report.model.service;

import java.util.ArrayList;

import com.project.bmp.common.Paging;
import com.project.bmp.report.model.vo.Report;

public interface ReportService {

	int listCount();

	ArrayList<Report> getList(Paging paging);

	int addReport(Report report);

	int addComment(Report report);

}
