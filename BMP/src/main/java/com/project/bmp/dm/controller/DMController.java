package com.project.bmp.dm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.bmp.common.Pagination;
import com.project.bmp.common.Paging;
import com.project.bmp.dm.model.service.DMService;
import com.project.bmp.dm.model.vo.DM;
import com.project.bmp.dm.model.vo.Room;
import com.project.bmp.user.model.service.UserService;
import com.project.bmp.user.model.vo.Follow;
import com.project.bmp.user.model.vo.User;

@Controller
public class DMController {

	@Autowired
	private UserService uService;

	@Autowired
	private DMService dService;

	@RequestMapping("messages")
	public ModelAndView dmList(HttpSession session, ModelAndView mav,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(new Follow(accessor.getNo(), accessor.getNo()));

		int listCount = dService.listCount(accessor.getNo());
		Paging paging = new Pagination().getPaging(page, 10, listCount);
		ArrayList<Room> dList = dService.getList(accessor.getNo(), paging);

		mav.addObject("paging", paging);
		mav.addObject("profile", profile);
		mav.addObject("dList", dList);
		mav.setViewName("user/message/messages");

		return mav;
	}

	@RequestMapping("message")
	public ModelAndView dm(HttpSession session, ModelAndView mav, int no) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(new Follow(accessor.getNo(), accessor.getNo()));

		DM dm = new DM(no, accessor.getNo());
		Room room = dService.getMessage(dm);
		mav.addObject("profile", profile);
		mav.addObject("room", room);
		mav.setViewName("user/message/message");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("sendMessage.do")
	public String sendDM(DM dm) {
		int result = dService.addMessage(dm);
		
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping("updateMessage.do")
	public String updateDM(DM dm) {
		ArrayList<DM> dmList = dService.updateMessage(dm);
		
		return new Gson().toJson(dmList);
	}
}
