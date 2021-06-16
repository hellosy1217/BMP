package com.project.bmp.post.model.service;

import java.util.ArrayList;

import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.post.model.vo.Post;

public interface PostService {

	int getListCount(ListInfo listInfo);

	ArrayList<Post> getPost(ListInfo listInfo);

}
