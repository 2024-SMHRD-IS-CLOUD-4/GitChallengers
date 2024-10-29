package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원가입
	public int join(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("MyMemberMapper.join", m);
		sqlSession.close();
		
		return result;
	}
	
	// 로그인
	public Member login(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		Member result = sqlSession.selectOne("MyMemberMapper.login", m);
		sqlSession.close();
		
		return result;
	}
	

}
