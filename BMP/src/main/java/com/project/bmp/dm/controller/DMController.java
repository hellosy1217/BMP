package com.project.bmp.dm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.bmp.common.Pagination;
import com.project.bmp.common.Paging;
import com.project.bmp.dm.model.service.DMService;
import com.project.bmp.dm.model.vo.Room;
import com.project.bmp.user.model.service.UserService;
import com.project.bmp.user.model.vo.User;

@Controller
public class DMController {

	@Autowired
	private UserService uService;

	@Autowired
	private DMService dService;

	@RequestMapping("message")
	public ModelAndView message(HttpSession session, ModelAndView mav,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(accessor.getNo());

		int listCount = dService.listCount(accessor.getNo());
		Paging paging = new Pagination().getPaging(page, 10, listCount);
		ArrayList<Room> list = dService.getList(accessor.getNo(), paging);

		mav.addObject("paging", paging);
		mav.addObject("profile", profile);
		mav.addObject("list", list);
		mav.setViewName("user/user/dmList");

		return mav;
	}
}
