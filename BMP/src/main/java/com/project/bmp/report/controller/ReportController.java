package com.project.bmp.report.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.bmp.common.Pagination;
import com.project.bmp.common.Paging;
import com.project.bmp.report.model.service.ReportService;
import com.project.bmp.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	private ReportService rService;

	@RequestMapping("admin/report")
	public ModelAndView reportList(ModelAndView mav, @RequestParam(value = "page", defaultValue = "1") int page) {

		int listCount = rService.listCount();

		Paging paging = new Pagination().getPaging(page, 15, listCount);
		ArrayList<Report> rList = rService.getList(paging);

		mav.addObject("rList", rList);
		mav.setViewName("admin/report/list");
		return mav;
	}
}
