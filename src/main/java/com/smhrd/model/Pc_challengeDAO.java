package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Pc_challengeDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 개인 챌린지 리스트 불러오기
	public List<Pc_challenge> selectAll(String id) {
		SqlSession sqlSession = factory.openSession(true);
		List<Pc_challenge> result = sqlSession.selectList("Pc_challengeMapper.selectAll", id);
		sqlSession.close();
		
		return result;	
	}

}
