package com.project.bmp.post.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.bmp.common.AwsS3;
import com.project.bmp.common.Pagination;
import com.project.bmp.common.Paging;
import com.project.bmp.post.model.service.PostService;
import com.project.bmp.post.model.vo.AttachedFile;
import com.project.bmp.post.model.vo.Comment;
import com.project.bmp.post.model.vo.Like;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;
import com.project.bmp.user.model.service.UserService;
import com.project.bmp.user.model.vo.User;

@Controller
public class PostController {

	@Autowired
	private PostService pService;

	@Autowired
	private UserService uService;

	private AwsS3 aws = AwsS3.getInstance();

	@RequestMapping("explorer")
	public ModelAndView explorer(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, ModelAndView mav) {
		ListInfo listInfo = getListInfo(session, sort, keyword, 1, 16, "");

		ArrayList<Post> list = pService.getPostList(listInfo);

		mav.addObject("listInfo", listInfo);
		mav.addObject("list", list);
		mav.setViewName("user/post/explorer");

		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "morePost.do", produces = "application/json;charset=utf-8")
	public String morePost(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, @RequestParam(value = "page") int page,
			@RequestParam(value = "limit") int limit, @RequestParam(value = "tab", defaultValue = "") String tab,
			@RequestParam(value = "blog", defaultValue = "0") int blog) {
		Gson gson = new Gson();

		ListInfo listInfo = getListInfo(session, sort, keyword, page, limit, tab);
		listInfo.setBlogNo(blog);

		ArrayList<Post> list = pService.getPostList(listInfo);

		return gson.toJson(list);
	}

	@RequestMapping("write")
	public String writeForm() {
		return "user/post/write";
	}

	@ResponseBody
	@RequestMapping(value = "write.do", produces = "application/json;charset=utf-8")
	public String write(Post post, @RequestParam(value = "fileArr[]", required = false) ArrayList<String> fileArr) {
		// 사용하지 않은 사진 삭제
		if (fileArr != null) {
			for (int i = fileArr.size() - 1; i >= 0; i--) {
				String str = fileArr.get(i);
				if (!post.getContent().contains(str)) {
					str.replace(aws.getURL(), "");
					aws.delete(str);
					fileArr.remove(i);
				}
			}
		}
		pService.addPost(post);

		int result = post.getNo();

		if (fileArr != null) {
			AttachedFile file = new AttachedFile(fileArr.get(0), "thumbnail", post.getUserNo(), result, 0);
			if (result > 0) {
				int r = pService.addFile(file);
				if (r < 1)
					result = 0;
			}
		} else {
			result = post.getNo();
		}
		return new Gson().toJson(result);
	}

	@ResponseBody
	@RequestMapping(value = "fileUpload.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws IllegalStateException, IOException {
		String orgFileName = upload.getOriginalFilename();
		String saveFileName = getSaveFileName(orgFileName);
		File file = new File(orgFileName);
		upload.transferTo(file);
		aws.upload(file, saveFileName);
		HashMap<String, String> map = new HashMap<>();
		map.put("url", aws.getURL() + saveFileName);

		return new Gson().toJson(map);
	}

	@ResponseBody
	@RequestMapping(value = "fileDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String fileDelete(@RequestParam(value = "fileArr[]") String[] fileArr) {
		aws.delete(null);

		return null;
	}

	@RequestMapping("blog")
	public ModelAndView blog(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "page", defaultValue = "1") int page, int blog,
			@RequestParam(value = "tab", defaultValue = "") String tab, ModelAndView mav) {
		ListInfo listInfo = getListInfo(session, sort, keyword, page, 16, tab);
		listInfo.setBlogNo(blog);

		ArrayList<Post> list = pService.getPostList(listInfo);
		User profile = uService.getProfile(blog);

		mav.addObject("listInfo", listInfo);
		mav.addObject("list", list);
		mav.addObject("profile", profile);
		mav.setViewName("user/post/blog");
		return mav;
	}

	@RequestMapping(value = "post", method = RequestMethod.GET)
	public ModelAndView post(ModelAndView mav, int no) {
		Post post = pService.getPost(no);
		User profile = null;

		if (post != null) {
			pService.addCount(post.getUserNo());
			profile = uService.getProfile(post.getUserNo());
		}
		if (profile != null) {

			Paging paging = new Pagination().getPaging(1, 20, post.getCountComment());
			mav.addObject("post", post);
			mav.addObject("profile", profile);
			mav.addObject("paging",paging);
			mav.setViewName("user/post/blog");
		} else {
			// 에러페이지
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping("delete.do")
	public String delete(HttpSession session, int no) {
		System.out.println("들어옴 ");
		int result = pService.delPost(no);
		System.out.println("result = " + result);
		if (result > 0)
			return null;
		else
			return "error";
	}

	@ResponseBody
	@RequestMapping(value = "like.do", produces = "application/json;charset=utf-8")
	public String like(Like like, HttpSession session) {
		int result = 0;
		User accessor = (User) session.getAttribute("accessor");
		if (accessor == null) {
			return "signIn";
		}
		like.setUserNo(accessor.getNo());

		System.out.println(like.toString());
		if (like.getNo() == 0) {
			result = pService.addLike(like);
			if (result > 0)
				result = 2;
		} else {
			result = pService.delLike(like);
			if (result > 0)
				result = 1;
		}
		return result + "";
	}

	@ResponseBody
	@RequestMapping("comment.do")
	public String getComment(int no, int countComment, @RequestParam(value = "page", defaultValue = "1") int page) {
		Gson gson = new Gson();

		Paging paging = new Pagination().getPaging(page, 20, countComment);

		ArrayList<Comment> cList = pService.getComment(no, paging);

		return gson.toJson(cList);
	}

	@RequestMapping("admin")
	public ModelAndView admin(ModelAndView mav) {
		mav.setViewName("admin/common/dashboard");
		return mav;
	}

	public ListInfo getListInfo(HttpSession session, String sort, String keyword, int currentPage, int boardLimit,
			String tab) {
		User accessor = (User) session.getAttribute("accessor");

		int accessorNo = 0;
		if (accessor != null)
			accessorNo = accessor.getNo();

		String searchFilter = "닉네임";

		if (keyword != null && !keyword.equals("")) {
			searchFilter = "태그";
			keyword = "#" + keyword;
		}
		ListInfo listInfo = new ListInfo(accessorNo, sort, searchFilter, keyword, tab);

		int listCount = pService.getListCount(listInfo);

		Paging paging = new Pagination().getPaging(currentPage, boardLimit, listCount);

		listInfo.setPaging(paging);

		return listInfo;
	}

	public String getSaveFileName(String orgFileName) {
		String fileName = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		fileName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
		return fileName;

	}
}
