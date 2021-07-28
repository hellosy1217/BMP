package com.project.bmp.user.controller;

import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.gson.Gson;
import com.project.bmp.common.AwsS3;
import com.project.bmp.common.Pagination;
import com.project.bmp.common.Paging;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.user.model.service.UserService;
import com.project.bmp.user.model.vo.Block;
import com.project.bmp.user.model.vo.Follow;
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

	private AwsS3 aws = AwsS3.getInstance();

	// send = 이메일 인증 종류 (0:회원가입, 1:비밀번호 찾기)
	@ResponseBody
	@RequestMapping(value = "checkUser.do", produces = "application/json;charset=utf-8")
	public String checkUser(String email, @RequestParam(value = "send", defaultValue = "0") int send) {
		Gson gson = new Gson();
		User user = uService.selectUser(email);
		String result = "0";
		if (user != null) {
			result = user.getNo() + "";
			if (send > 0)
				result = sendAuthMail(email, "비밀번호 찾기", null);
		}
		return gson.toJson(result);
	}

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
					msg = "explorer";
				} else
					msg = sendAuthMail(user.getEmail(), "회원", null);
			}
		}
		return gson.toJson(msg);
	}

	// view = 페이지 정보 (1:비밀번호찾기, 2:회원가입, null:로그인)
	@RequestMapping("signUp")
	public ModelAndView signUpForm(ModelAndView mav) {
		mav.addObject("view", 2);
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
			authKey = sendAuthMail(user.getEmail(), "회원가입", null);
		}

		return gson.toJson(authKey);
	}

	@RequestMapping("signOut")
	public String signOut(SessionStatus status) {
		status.setComplete();
		return "redirect:explorer";
	}

	// 구글 로그인
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
			email = "google: " + email;
			String userId = payload.getSubject();
			String name = (String) payload.get("name");

			User accessor = uService.selectUser(new User(email, userId));
			if (accessor == null) {
				accessor = new User(email, userId, name);
				accessor.setConfirm('Y');
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

	@RequestMapping("find")
	public ModelAndView findForm(User accessor, ModelAndView mav) {
		mav.addObject("view", 1);
		mav.setViewName("user/user/sign");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "updateConfirm.do", produces = "application/json;charset=utf-8")
	public String updateConfirm(String email, HttpSession session) {
		Gson gson = new Gson();
		int result = uService.updateConfirm(email);
		if (result > 0) {
			User accessor = uService.selectUser(email);
			session.setAttribute("accessor", accessor);
			return gson.toJson("success");
		}
		return gson.toJson("error");
	}

	@ResponseBody
	@RequestMapping("updatePw.do")
	public String updatePw(User accessor, HttpSession session) {
		String encPassword = bcryptPasswordEncoder.encode(accessor.getPassword());
		accessor.setPassword(encPassword);
		int result = uService.updatePw(accessor);
		String msg = null;
		if (result > 0) {
			accessor = uService.selectUser(accessor);
			session.setAttribute("accessor", accessor);
			msg = "explorer";
		}
		return new Gson().toJson(msg);
	}

	@RequestMapping("setting")
	public String editProfile() {
		return "user/user/editProfile";
	}

	@RequestMapping("setting/password")
	public String editPassword() {
		return "user/user/editPw";
	}

	@ResponseBody
	@RequestMapping(value = "editProfile.do")
	public String setting(User user, @RequestParam MultipartFile upload, String[] checkBox, HttpSession session)
			throws IllegalStateException, IOException {
		Gson gson = new Gson();
		User accessor = (User) session.getAttribute("accessor");
		user.setNo(accessor.getNo());
		int result = 0;
		String msg = "error";

		user.setSub('N');
		user.setAlarm('N');
		user.setUserPrivate('N');
		for (String s : checkBox) {
			if (s.equals("sub"))
				user.setSub('Y');
			else if (s.equals("alarm"))
				user.setAlarm('Y');
			else if (s.equals("userPrivate"))
				user.setUserPrivate('Y');
		}

		String orgFileName = upload.getOriginalFilename();

		if (!orgFileName.equals("") && !user.getFileName().equals("")) {
			String saveFileName = aws.getSaveFileName(orgFileName);
			File file = new File(orgFileName);
			upload.transferTo(file);
			aws.upload(file, saveFileName);

			user.setFileName(aws.getURL() + saveFileName);
		}

		if (accessor.getFileName() == null) {
			if (user.getFileName() != null && !user.getFileName().equals("")) {
				result = uService.addFile(user);
				accessor.setFileName(user.getFileName());
			}
		} else {
			if (!accessor.getFileName().equals(user.getFileName())) {
				String fileName = accessor.getFileName();
				fileName.replace(aws.getURL(), "");
				aws.delete(fileName);

				if (user.getFileName() != null && !user.getFileName().equals("")) {
					result = uService.editFile(user);
					accessor.setFileName(user.getFileName());
				} else {
					result = uService.delFile(user);
					accessor.setFileName(null);
				}
			}
		}
		result = uService.editUser(user);
		if (result > 0) {
			accessor.setNickname(user.getNickname());
			accessor.setComment(user.getComment());
			accessor.setSub(user.getSub());
			accessor.setAlarm(user.getAlarm());
			accessor.setUserPrivate(user.getUserPrivate());
			session.setAttribute("accessor", accessor);
			msg = "success";
		}
		return gson.toJson(msg);
	}

	@ResponseBody
	@RequestMapping("editPw.do")
	public String editPassword(HttpSession session, String pw, String newPw) {
		String msg = "error";
		User accessor = (User) session.getAttribute("accessor");
		String oldPw = accessor.getPassword();
		String encPassword = bcryptPasswordEncoder.encode(pw);
		if (bcryptPasswordEncoder.matches(pw, oldPw)) {
			encPassword = bcryptPasswordEncoder.encode(newPw);
			accessor.setPassword(encPassword);

			int result = uService.updatePw(accessor);
			if (result > 0)
				msg = "success";
			else
				accessor.setPassword(oldPw);

		} else {
			msg = "checkPw";
		}

		return new Gson().toJson(msg);
	}

	@RequestMapping("follower")
	public ModelAndView follower(HttpSession session, ModelAndView mav, int no) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(new Follow(no, accessor.getNo()));
		ArrayList<User> fList = uService.getFollowList(new User(accessor.getNo(), no, 0));
		mav.addObject("fList", fList);
		mav.addObject("profile", profile);
		mav.setViewName("user/post/blog");
		return mav;
	}

	@RequestMapping("follow")
	public ModelAndView follow(HttpSession session, ModelAndView mav, int no) {
		User accessor = (User) session.getAttribute("accessor");
		User profile = uService.getProfile(new Follow(no, accessor.getNo()));
		ArrayList<User> fList = uService.getFollowList(new User(accessor.getNo(), 0, no));
		mav.addObject("fList", fList);
		mav.addObject("profile", profile);
		mav.setViewName("user/post/blog");
		return mav;
	}

	@ResponseBody
	@RequestMapping("follow.do")
	public String follow(Follow follow) {
		int result = 0;

		if (follow.getPermission() == ' ') {
			User user = uService.getFollow(follow);
			if (user.getUserPrivate() == 'Y')
				follow.setPermission('N');
			else
				follow.setPermission('Y');
			follow.setNo(user.getNo());
		}

		if (follow.getNo() == 0) {
			result = uService.addFollow(follow);
			if (result > 0) {
				result = follow.getNo();
			}
		} else {
			result = uService.delFollow(follow);
			if (result > 0) {
				result = 0;
			}
		}
		return new Gson().toJson(result + "");
	}

	@ResponseBody
	@RequestMapping("block.do")
	public String block(Block block, int followNo) {
		int result = 0;

		if (followNo > 0) {
			result = uService.delFollow(new Follow(followNo));
		}

		if (block.getNo() > 0) {
			result = uService.delBlock(block);
			if (result > 0)
				result = 0;
		} else {
			result = uService.addBlock(block);
		}
		return new Gson().toJson(result + "");
	}

	@RequestMapping("admin/users")
	public ModelAndView userList(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, ModelAndView mav,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		ListInfo listInfo = getListInfo(session, sort, keyword, page, 15);
		ArrayList<User> list = uService.getUserList(listInfo);

		mav.addObject("list", list);
		mav.addObject("listInfo", listInfo);
		mav.addObject("paging", listInfo.getPaging());
		mav.setViewName("admin/user/users");
		return mav;
	}

	@ResponseBody
	@RequestMapping("admin/delUsers.do")
	public String delUsers(@RequestParam(value = "users[]") ArrayList<String> users) {
		int result = uService.delUsers(users);
		return new Gson().toJson(result);
	}

	@RequestMapping("admin/admins")
	public ModelAndView adminList(HttpSession session, ModelAndView mav) {
//
//		ListInfo listInfo = getListInfo(session, sort, keyword, page, 15);
//		ArrayList<User> uList = uService.getUserList(listInfo);
//
//		mav.addObject("uList", uList);
//		mav.addObject("listInfo", listInfo);
//		mav.addObject("paging", listInfo.getPaging());
		mav.setViewName("admin/user/admins");
		return mav;
	}

	// 인증코드 생성하기
	public String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < 6) {
			num = random.nextInt(10);
			buffer.append(num);
		}

		return buffer.toString();
	}

	// 메일 전송하기
	public String sendAuthMail(String email, String type, String report) {
		String authKey = null;
		String mailContent = null;
		if (report == null) {
			authKey = getAuthCode();
			mailContent = "<h1>[이메일 인증]</h1><br><p>아래의 인증번호를 입력하시면 이메일 인증이 완료됩니다.</p>" + "<p>" + authKey + "</p>";
			type += " 이메일 인증 ";
		} else {
		}

		MimeMessage mail = mailSender.createMimeMessage();
		try {
			mail.setSubject(type, "utf-8");
			mail.setText(mailContent, "utf-8", "html");
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			mailSender.send(mail);
			if (report == null)
				return authKey;
			else
				return "success";
		} catch (MessagingException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ListInfo getListInfo(HttpSession session, String sort, String keyword, int currentPage, int boardLimit) {

		ListInfo listInfo = new ListInfo(sort, keyword);

		int listCount = uService.getListCount(listInfo);

		Paging paging = new Pagination().getPaging(currentPage, boardLimit, listCount);

		listInfo.setPaging(paging);

		return listInfo;
	}
}
