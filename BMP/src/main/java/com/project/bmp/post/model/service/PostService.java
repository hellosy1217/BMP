package com.project.bmp.post.model.service;

import java.util.ArrayList;

import com.project.bmp.common.Paging;
import com.project.bmp.post.model.vo.AttachedFile;
import com.project.bmp.post.model.vo.Comment;
import com.project.bmp.post.model.vo.Like;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;

public interface PostService {

	int getListCount(ListInfo listInfo);

	ArrayList<Post> getPostList(ListInfo listInfo);

	int addLike(Like like);

	int delLike(Like like);

	int addPost(Post post);

	int addFile(Post post);

	Post getPost(Post post);

	int delPost(int no);

	int addCount(int no);

	ArrayList<Comment> getComment(int no, Paging paging);

	ArrayList<String> getFileNames(int no);

	int editHideDate(Post post);

	int delFile(int no);

	int editPost(Post post);

}
