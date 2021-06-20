package com.project.bmp.user.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("signIn")
	public String signInForm(Model model) {
		return "user/user/sign";
	}

	@ResponseBody
	@RequestMapping(value = "signIn.do", produces = "application/json;charset=utf-8")
	public String signIn(String email, String password, Model model) {
		Gson gson = new Gson();
		User user = uService.selectUser(email);
		String msg = "error";
		if (user != null) {
			if (bcryptPasswordEncoder.matches(password, user.getPassword())) {
				if (user.getConfirm() == 'Y') {
					model.addAttribute("accessor", user);
					if (user.getAdmin() == 'Y')
						msg = "admin";
					else
						msg = "explorer";
				} else
					msg = sendAuthMail(user.getEmail());
			}
		}
		return gson.toJson(msg);
	}

	@RequestMapping("signUp")
	public ModelAndView signUpForm(ModelAndView mav) {
		mav.addObject("view", 1);
		mav.setViewName("user/user/sign");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "signUp.do", produces = "application/json;charset=utf-8")
	public String signUp(User user) {
		Gson gson = new Gson();
		String encPassword = bcryptPasswordEncoder.encode(user.getPassword());
		user.setPassword(encPassword);
		int result = uService.addUser(user);
		String authKey = null;
		if (result > 0) {
			authKey = sendAuthMail(user.getEmail());
		}

		return gson.toJson(authKey);
	}

	@RequestMapping("signOut")
	public String signOut(SessionStatus status) {
		status.setComplete();
		return "redirect:explorer";
	}

	@ResponseBody
	@RequestMapping(value = "googleSign.do")
	public String googleSignUp(String idtoken, HttpSession session) throws GeneralSecurityException, IOException {
		HttpTransport transport = Utils.getDefaultTransport();
		JsonFactory jsonFactory = Utils.getDefaultJsonFactory();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections
						.singletonList("777761637670-4aqnu191aitl31nh79q0gv5hpg6cvs0r.apps.googleusercontent.com"))
				.build();

		GoogleIdToken idToken = verifier.verify(idtoken);
		String msg = "error";
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			String email = (String) payload.getEmail();
			String userId = payload.getSubject();
			String name = (String) payload.get("name");

			User accessor = uService.selectUser(new User("google:" + email, userId));
			if (accessor == null) {
				accessor = new User(email, userId, name);
				int result = uService.addUser(accessor);
				if (result > 0) {
					accessor = uService.selectUser(accessor.getEmail());
					msg = "success";
				}
			} else
				msg = "success";

			if (accessor != null)
				session.setAttribute("accessor", accessor);
		}
		return new Gson().toJson(msg);
	}

	@RequestMapping("updateConfirm")
	public String updateConfirm(String email, HttpSession session) {
		int result = uService.updateConfirm(email);
		if (result > 0) {
			User accessor = uService.selectUser(email);
			session.setAttribute("accessor", accessor);
		}
		return "redirect:explorer";
	}

	@RequestMapping("message")
	public ModelAndView message(HttpSession session, ModelAndView mav) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(accessor.getNo());

		mav.addObject("profile", profile);
		mav.setViewName("user/user/message");

		return mav;
	}

	public String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		// 6자리 난수 생성
		while (buffer.length() < 6) {
			num = random.nextInt(10);
			buffer.append(num);
		}

		return buffer.toString();
	}

	public String sendAuthMail(String email) {
		// 6자리 난수 인증번호 생성
		String authKey = getAuthCode();

		// 인증메일 보내기
		MimeMessage mail = mailSender.createMimeMessage();
		String mailContent = "<h1>[이메일 인증]</h1><br><p>아래의 인증번호를 입력하시면 이메일 인증이 완료됩니다.</p>" + "<p>" + authKey + "</p>";
		try {
			mail.setSubject("회원가입 이메일 인증 ", "utf-8");
			mail.setText(mailContent, "utf-8", "html");
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
			return authKey;
		} catch (MessagingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
