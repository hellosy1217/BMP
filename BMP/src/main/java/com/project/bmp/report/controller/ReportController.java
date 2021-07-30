package com.project.bmp.report.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.bmp.common.Pagination;
import com.project.bmp.common.Paging;
import com.project.bmp.common.SendMail;
import com.project.bmp.report.model.service.ReportService;
import com.project.bmp.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private ReportService rService;

	private SendMail sendMail = new SendMail();

	@RequestMapping("admin/report")
	public ModelAndView reportList(ModelAndView mav, @RequestParam(value = "page", defaultValue = "1") int page) {

		int listCount = rService.listCount();

		Paging paging = new Pagination().getPaging(page, 15, listCount);
		ArrayList<Report> rList = rService.getList(paging);

		mav.addObject("rList", rList);
		mav.setViewName("admin/report/list");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("admin/report.do")
	public String getReport(int no) {
		Report report = rService.getReport(no);
		return new Gson().toJson(report);
	}
	
	@ResponseBody
	@RequestMapping("report.do")
	public String addReport(Report report) {
		int result = rService.addReport(report);
		String msg = "error";
		if (result > 0)
			msg = "success";

		return new Gson().toJson(msg);
	}

	@ResponseBody
	@RequestMapping("comment.do")
	public String comment(Report report) {
		String msg = null;
		String result = sendMail.sendMail(mailSender, report.getEmail(), "RE: " + report.getTitle(), report);

		if (result != null) {
			int r = rService.addComment(report);
			if (r > 0)
				msg = "success";
		}
		return new Gson().toJson(msg);
	}

}
