package com.project.bmp.stats.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.bmp.stats.model.service.StatsService;
import com.project.bmp.stats.model.vo.Stats;

@Controller
public class StatsController {

	@Autowired
	private StatsService sService;

	@RequestMapping("admin")
	public ModelAndView admin(ModelAndView mav) {
		ArrayList<Stats> sList = sService.getList();
		
		mav.addObject("sList", sList);
		mav.setViewName("admin/common/dashboard");
		return mav;
	}

}
