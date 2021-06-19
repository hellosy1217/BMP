package com.project.bmp.user.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
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
					msg = "admin";
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

	@RequestMapping("signOut")
	public String signOut(SessionStatus status) {
		status.setComplete();
		return "redirect:explorer";
	}

	@ResponseBody
	@RequestMapping(value = "googleSign")
	public String googleSign(String idtoken) throws GeneralSecurityException, IOException {
		System.out.println(idtoken);
		HttpTransport transport = Utils.getDefaultTransport();
		JsonFactory jsonFactory = Utils.getDefaultJsonFactory();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections.singletonList("777761637670-4aqnu191aitl31nh79q0gv5hpg6cvs0r.apps.googleusercontent.com")).build();

		GoogleIdToken idToken = verifier.verify(idtoken);
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			// Print user identifier
			String userId = payload.getSubject();
			System.out.println("User ID: " + userId);

			// Get profile information from payload
			String email = payload.getEmail();
			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
			String locale = (String) payload.get("locale");
			String familyName = (String) payload.get("family_name");
			String givenName = (String) payload.get("given_name");

			System.out.println("email "+email +" name "+name+" emailV "+emailVerified);
			System.out.println(pictureUrl);
			// Use or store profile information
			// ...

		} else {
			System.out.println("Invalid ID token.");
		}
		return null;
	}

	@RequestMapping("message")
	public ModelAndView message(HttpSession session, ModelAndView mav) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(accessor.getNo());

		mav.addObject("profile", profile);
		mav.setViewName("user/user/message");

		return mav;
	}

	public String follow() {
		return "";
	}
}
