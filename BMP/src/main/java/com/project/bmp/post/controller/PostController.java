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
import com.project.bmp.user.model.vo.Follow;
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

	@RequestMapping("postwrite")
	public String writeForm() {
		return "user/post/write";
	}

	@ResponseBody
	@RequestMapping(value = "postwrite.do", produces = "application/json;charset=utf-8")
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

		// 파일 이름 저장
		if (fileArr != null && result > 0) {
			ArrayList<AttachedFile> fList = new ArrayList<>();
			for (String s : fileArr) {
				fList.add(new AttachedFile(s, 0, result, 0));
			}
			post.setFileList(fList);

			int r = pService.addFile(post);
			if (r == 0)
				result = 0;
		}
		return new Gson().toJson(result);
	}

	@ResponseBody
	@RequestMapping(value = "fileUpload.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws IllegalStateException, IOException {
		String orgFileName = upload.getOriginalFilename();
		String saveFileName = aws.getSaveFileName(orgFileName);
		File file = new File(orgFileName);
		upload.transferTo(file);
		aws.upload(file, saveFileName);
		HashMap<String, String> map = new HashMap<>();
		map.put("url", aws.getURL() + saveFileName);

		return new Gson().toJson(map);
	}

	@RequestMapping("blog")
	public ModelAndView blog(HttpSession session, @RequestParam(value = "sort", defaultValue = "인기순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "page", defaultValue = "1") int page, int blog,
			@RequestParam(value = "tab", defaultValue = "") String tab, ModelAndView mav) {
		ListInfo listInfo = getListInfo(session, sort, keyword, page, 16, tab);
		listInfo.setBlogNo(blog);

		ArrayList<Post> list = pService.getPostList(listInfo);
		User profile = uService.getProfile(new Follow(blog, listInfo.getAccessor_no()));

		mav.addObject("listInfo", listInfo);
		mav.addObject("list", list);
		mav.addObject("profile", profile);
		mav.setViewName("user/post/blog");
		return mav;
	}

	@RequestMapping(value = "post")
	public ModelAndView post(HttpSession session, ModelAndView mav, int no,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "scroll", defaultValue = "") String scroll) {
		User accessor = (User) session.getAttribute("accessor");
		int userNo = 0;
		if (accessor != null)
			userNo = accessor.getNo();
		Post post = new Post(no, userNo);
		post = pService.getPost(post);
		User profile = null;

		if (post != null) {
			pService.addCount(post.getNo());
			profile = uService.getProfile(new Follow(post.getUserNo(), userNo));
		}
		if (profile != null) {
			Paging paging = new Pagination().getPaging(page, 20, post.getCountComment());
			ArrayList<Comment> cList = pService.getComment(no, paging);

			mav.addObject("post", post);
			mav.addObject("profile", profile);
			mav.addObject("paging", paging);
			mav.addObject("cList", cList);
			mav.addObject("scroll", scroll);
			mav.setViewName("user/post/blog");
		} else {
			// 에러페이지
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "delPost.do", produces = "application/json;charset=utf-8")
	public String delete(int no) {
		ArrayList<String> files = pService.getFileNames(no);
		int result = pService.delPost(no);
		if (result > 0 && files != null) {
			for (String s : files)
				aws.delete(s);
		} else if (result == 0) {
		} // 에러페이지
		return new Gson().toJson("success");
	}

	@RequestMapping("edit")
	public ModelAndView edit(HttpSession session, int no, ModelAndView mav) {
		User accessor = (User) session.getAttribute("accessor");
		Post post = pService.getPost(new Post(no, accessor.getNo()));
		ArrayList<String> fileNames = new ArrayList<>();
		for (AttachedFile file : post.getFileList())
			fileNames.add(file.getName());
		mav.addObject("post", post);
		mav.addObject("fileNames", fileNames);
		mav.setViewName("user/post/write");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "edit.do", produces = "application/json;charset=utf-8")
	public String edit(Post post, @RequestParam(value = "fileArr[]", required = false) ArrayList<String> fileArr) {
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

		pService.editPost(post);

		int result = 0;
		// 파일 이름 저장
		if (fileArr != null) {
			pService.delFile(post.getNo());
			ArrayList<AttachedFile> fList = new ArrayList<>();
			for (String s : fileArr) {
				fList.add(new AttachedFile(s, 0, post.getNo(), 0));
			}
			post.setFileList(fList);

			result = pService.addFile(post);
		}
		return new Gson().toJson(result);
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

		if (like.getNo() == 0) {
			result = pService.addLike(like);
			if (result > 0)
				result = like.getNo();
		} else {
			result = pService.delLike(like);
			result = 0;
		}
		return result + "";
	}

	@ResponseBody
	@RequestMapping(value = "hide.do", produces = "application/json;charset=utf-8")
	public String hide(int no, String hide) {
		int result = pService.editHideDate(new Post(no, hide));

		return new Gson().toJson(result + "");
	}

	@ResponseBody
	@RequestMapping(value = "addComment.do", produces = "application/json;charset=utf-8")
	public String addComment(Comment comment) {
		int result = pService.addComment(comment);

		return new Gson().toJson(result + "");
	}

	@ResponseBody
	@RequestMapping(value = "delComment.do", produces = "application/json;charset=utf-8")
	public String delComment(int no) {
		int result = pService.delComment(no);

		return new Gson().toJson(result + "");
	}

	@RequestMapping("admin/post")
	public ModelAndView postList(HttpSession session, @RequestParam(value = "sort", defaultValue = "등록순") String sort,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, ModelAndView mav,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		ListInfo listInfo = getListInfo(session, sort, keyword, page, 15, "admin");
		ArrayList<Post> list = pService.getPostList(listInfo);

		mav.addObject("list", list);
		mav.addObject("listInfo", listInfo);
		mav.addObject("paging", listInfo.getPaging());
		mav.setViewName("admin/post/list");
		return mav;
	}

	@ResponseBody
	@RequestMapping("admin/delPosts.do")
	public String delPosts(@RequestParam(value = "posts[]") ArrayList<String> posts) {
		String msg = "error";
		int result = pService.delPosts(posts);
		if (result > 0)
			msg = "success";
		System.out.println(posts.toString());
		System.out.println("삭제실행: "+result);
		return new Gson().toJson(msg);
	}

	public ListInfo getListInfo(HttpSession session, String sort, String keyword, int currentPage, int boardLimit,
			String tab) {
		User accessor = (User) session.getAttribute("accessor");

		int accessorNo = 0;
		if (accessor != null)
			accessorNo = accessor.getNo();

		ListInfo listInfo = new ListInfo(accessorNo, sort, keyword, tab);

		int listCount = pService.getListCount(listInfo);

		Paging paging = new Pagination().getPaging(currentPage, boardLimit, listCount);

		listInfo.setPaging(paging);

		return listInfo;
	}

}
