package com.project.bmp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.project.bmp.user.model.service.UserService;
import com.project.bmp.user.model.vo.User;

@SessionAttributes("accessor")
@Controller
public class UserController {

	@Autowired
	private UserService uService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("signIn")
	public String signInForm() {
		return "user/user/signIn";
	}

	@ResponseBody
	@RequestMapping(value = "signIn.do", produces = "application/json;charset=utf-8")
	public String signIn(String email, String password, Model model) {
		Gson gson = new Gson();
		User user = uService.selectUser(email);
		String msg = "error";
		if (user != null) {
			if (bcryptPasswordEncoder.matches(password, user.getPassword())) {
				model.addAttribute("accessor", user);
				if (user.getAdmin() == 'Y')
					msg = "signUp";
				else
					msg = "explorer";
			}
		}
		return gson.toJson(msg);
	}

	@RequestMapping("signUp")
	public String signUpForm() {
		return "user/user/signUp";
	}

	@RequestMapping(value = "signUp.do", produces = "application/json;charset=utf-8")
	public String signUp(User u) {
		return null;
	}
	
	@RequestMapping(value = "signOut")
	public String signOut(SessionStatus status) {
		status.setComplete();
		return "redirect:explorer";
	}
	
	@RequestMapping(value = "message")
	public String message(SessionStatus status) {
		return "user/user/message";
	}
}
