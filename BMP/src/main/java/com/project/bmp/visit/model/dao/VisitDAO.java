package com.project.bmp.visit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("vDAO")
public class VisitDAO {

	public int addVisit(SqlSessionTemplate sqlSession, String ip) {
		return sqlSession.insert("visitMapper.addVisit", ip);
	}

}
