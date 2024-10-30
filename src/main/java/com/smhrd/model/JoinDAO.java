package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class JoinDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 그룹 인원수
	public int count(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("JoinMapper.count", idx);
		sqlSession.close();
		
		return result;
	}
	
	
}
