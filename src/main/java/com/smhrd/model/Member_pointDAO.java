package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Member_pointDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 랭킹 불러오기
	public List<Member_point> rank() {
		SqlSession sqlSession = factory.openSession(true);
		List<Member_point> result = sqlSession.selectList("Member_pointMapper.rank");
		sqlSession.close();
		
		return result;
	}
	
	// 회원가입시 포인트 충전
	public int join(String id) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Member_pointMapper.join", id);
		sqlSession.close();
		
		return result;
	}
	
	// 그룹챌린지 가입시 포인트 차감
	public int groupCh(String id) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Member_pointMapper.groupCh", id);
		sqlSession.close();
		
		return result;
	}
	
	
}
