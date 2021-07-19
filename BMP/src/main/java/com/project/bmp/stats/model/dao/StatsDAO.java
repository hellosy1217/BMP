package com.project.bmp.stats.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.bmp.stats.model.vo.Stats;

@Repository("sDAO")
public class StatsDAO {

	public ArrayList<Stats> getList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("statsMapper.getList");
	}

}
