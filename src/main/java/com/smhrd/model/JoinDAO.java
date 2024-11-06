package com.smhrd.model;

import java.util.List;

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
	
	// 그룹 챌린지 가입
	public int join(Join j) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("JoinMapper.join", j);
		sqlSession.close();
		
		return result;
	}
	
	// 그룹 챌린지 인원 가져오기
	public List<Join> selectAll(int idx){
		SqlSession sqlSession = factory.openSession(true);
		List<Join> result = sqlSession.selectList("JoinMapper.selectAll", idx);
		sqlSession.close();
		
		return result;
	}
	
	// 회원이 속한 그룹 찾아오기
	public List<Join> selectMy(String id){
		SqlSession sqlSession = factory.openSession(true);
		List<Join> result = sqlSession.selectList("JoinMapper.selectMy", id);
		sqlSession.close();
		
		return result;
	}
	
	// 그룹 챌린지 회원 삭제
	public int removeMember(Join j) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("JoinMapper.removeMember", j);
		sqlSession.close();
		
		return result;
	}
	
}
