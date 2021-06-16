package com.project.bmp.post.controller;

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
import com.project.bmp.post.model.service.PostService;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;
import com.project.bmp.user.model.service.UserService;
import com.project.bmp.user.model.vo.User;

@Controller
public class PostController {

	@Autowired
	private PostService pService;

	@RequestMapping("explorer")
	public ModelAndView explorer(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, ModelAndView mav) {
		ListInfo listInfo = getListInfo(session, sort, keyword, 1, 16);

		ArrayList<Post> list = pService.getPost(listInfo);

		mav.addObject("listInfo", listInfo);
		mav.addObject("list", list);
		mav.setViewName("user/post/explorer");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "morePost.do", produces = "application/json;charset=utf-8")
	public String morePost(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, @RequestParam(value = "page") int page,
			@RequestParam(value = "limit") int limit) {
		Gson gson = new Gson();

		ListInfo listInfo = getListInfo(session, sort, keyword, page, limit);

		ArrayList<Post> list = pService.getPost(listInfo);

		return gson.toJson(list);
	}

	@RequestMapping("write")
	public String writeForm() {
		return "user/post/write";
	}

	@ResponseBody
	@RequestMapping(value = "write.do", produces = "application/json;charset=utf-8")
	public String write(String title, String content) {
		return null;
	}

	@RequestMapping("blog")
	public ModelAndView blog(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "page", defaultValue = "1") int page, int blog, int post, ModelAndView mav) {
		ListInfo listInfo = getListInfo(session, sort, keyword, page, 16);
		listInfo.setBlog_no(blog);
		
		ArrayList<Post> list = pService.getPost(listInfo);

		mav.addObject("listInfo", listInfo);
		mav.addObject("list", list);
		mav.addObject("postNo", post);
		mav.setViewName("user/post/blog");
		return mav;
	}

	public ListInfo getListInfo(HttpSession session, String sort, String keyword, int currentPage, int boardLimit) {
		User accessor = (User) session.getAttribute("accessor");

		int accessor_no = 0;
		if (accessor != null)
			accessor_no = accessor.getNo();

		String searchFilter = "닉네임";

		if (keyword != null && !keyword.equals("")) {
			searchFilter = "태그";
			keyword = "#" + keyword;
		}
		ListInfo listInfo = new ListInfo(accessor_no, sort, searchFilter, keyword);

		int listCount = pService.getListCount(listInfo);

		Paging paging = new Pagination().getPaging(currentPage, boardLimit, listCount);

		listInfo.setPaging(paging);

		return listInfo;
	}
}
