package com.project.bmp.stats.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.stats.model.dao.StatsDAO;
import com.project.bmp.stats.model.vo.Stats;

@Service("sService")
public class StatsServiceImpl implements StatsService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private StatsDAO sDAO;
	
	@Override
	public ArrayList<Stats> getList() {
		return sDAO.getList(sqlSession);
	}
	
}
