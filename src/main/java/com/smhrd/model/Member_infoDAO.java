package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Member_infoDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원 정보 가져오기
	public Member_info info(String id) {
		SqlSession sqlSession = factory.openSession(true);
		Member_info result = sqlSession.selectOne("Member_infoMapper.info", id);
		sqlSession.close();
		
		return result;
	}
	
	// 회원정보 수정
	public int update(Member_info m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("Member_infoMapper.info", m);
		sqlSession.close();
		
		return result;
		
	}

}
