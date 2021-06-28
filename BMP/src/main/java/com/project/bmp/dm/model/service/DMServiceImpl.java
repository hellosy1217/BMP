package com.project.bmp.dm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.common.Paging;
import com.project.bmp.dm.model.dao.DMDAO;
import com.project.bmp.dm.model.vo.DM;
import com.project.bmp.dm.model.vo.Room;

@Service("dService")
public class DMServiceImpl implements DMService {

	@Autowired
	private DMDAO dDAO;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int listCount(int no) {
		return dDAO.listCount(sqlSession, no);
	}

	@Override
	public ArrayList<Room> getList(int no, Paging paging) {
		return dDAO.getList(sqlSession, no, paging);
	}

	@Override
	public Room getMessage(DM dm) {
		return dDAO.getMessage(sqlSession, dm);
	}

}
