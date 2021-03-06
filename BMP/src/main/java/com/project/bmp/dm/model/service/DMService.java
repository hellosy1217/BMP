package com.project.bmp.dm.model.service;

import java.util.ArrayList;

import com.project.bmp.common.Paging;
import com.project.bmp.dm.model.vo.DM;
import com.project.bmp.dm.model.vo.Room;

public interface DMService {

	int listCount(int no);

	ArrayList<Room> getList(int no, Paging paging);

	Room getMessage(DM dm);

	int addMessage(DM dm);

	ArrayList<DM> updateMessage(DM dm);

	int updateReadDate(Room room);

	int findRoom(Room room);

	int addRoom(Room room);


}
