package com.project.bmp.user.model.service;

import java.util.ArrayList;

import com.project.bmp.dm.model.vo.DM;
import com.project.bmp.post.model.vo.ListInfo;
import com.project.bmp.user.model.vo.Block;
import com.project.bmp.user.model.vo.Follow;
import com.project.bmp.user.model.vo.User;

public interface UserService {
	public User selectUser(String email);

	public User selectUser(User accessor);
	
	public User getProfile(Follow follow);

	public int addUser(User accessor);

	public int updateConfirm(String email);

	public int updatePw(User accessor);

	public int addFollow(Follow follow);
	
	public int delFollow(Follow follow);

	public int editUser(User user);

	public int addFile(User user);

	public int editFile(User user);

	public int delFile(User user);

	public ArrayList<User> getFollowList(User user);

	public User getFollow(Follow follow);

	public int addBlock(Block block);

	public int delBlock(Block block);

	public int getListCount(ListInfo listInfo);
	
	public ArrayList<User> getUserList(ListInfo listInfo);

	public int delUsers(ArrayList<String> users);

}
