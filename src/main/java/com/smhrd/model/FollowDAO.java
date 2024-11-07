package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class FollowDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 팔로어 수 가져오기
	public int follower(String following) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("FollowMapper.follower", following);
		sqlSession.close();
		
		return result;
	}
	
	// 팔로잉 수 가져오기
	public int following(String follower) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("FollowMapper.following", follower);
		sqlSession.close();
		
		return result;
	}
}
