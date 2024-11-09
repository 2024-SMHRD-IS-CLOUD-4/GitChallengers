package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class WarningDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 신고 확인
	public int warningCheck(Warning warning) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("WarningMapper.warningCheck", warning);
		sqlSession.close();
		
		return result;
	}

	// 신고
	public int addWarning(Warning warning) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("WarningMapper.addWarning", warning);
		sqlSession.close();
		
		return result;
	}

}
