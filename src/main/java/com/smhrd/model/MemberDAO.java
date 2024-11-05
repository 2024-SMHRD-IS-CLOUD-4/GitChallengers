package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원가입
	public int join(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("MemberMapper.join", m);
		sqlSession.close();
		
		return result;
	}
	
	// 로그인
	public Member login(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		Member result = sqlSession.selectOne("MemberMapper.login", m);
		sqlSession.close();
		
		return result;
	}
	
	// 아이디 중복 확인
	public boolean idCheck(String id) {
		SqlSession sqlSession = factory.openSession(true);
		boolean result = sqlSession.selectOne("MemberMapper.idCheck", id);
		sqlSession.close();
		
		return result;
	}
	
	// 회원정보 가져오기
	public List<Member> selectAll() {
		SqlSession sqlSession = factory.openSession(true);
		List<Member> result = sqlSession.selectList("MemberMapper.selectAll");
		sqlSession.close();
		
		return result;
	}
	
	// 회원정보 수정
	public int update(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("MemberMapper.update", m);
		sqlSession.close();
		
		return result;
	}
	
	// 프로필 수정
	public int updateProfile(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("MemberMapper.updateProfile", m);
		sqlSession.close();
		
		return result;
	}
	
	

}
