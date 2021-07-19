package com.project.bmp.visit.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bmp.visit.model.dao.VisitDAO;

@Service("vService")
public class VisitServiceImpl implements VisitService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private VisitDAO vDAO;

	@Override
	public int addVisit(String ip) {
		return vDAO.addVisit(sqlSession, ip);
	}

}
