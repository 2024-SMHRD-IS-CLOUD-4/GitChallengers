package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ChallengeDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 챌린지 전체 목록 가져오기
	public List<Challenge> selectAll() {
		SqlSession sqlSession = factory.openSession(true);
		List<Challenge> result = sqlSession.selectOne("ChallengeMapper.selectAll");
		sqlSession.close();
		
		return result;
	}
	
	
	
}
