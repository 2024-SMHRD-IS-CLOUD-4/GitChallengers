package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Review_heartDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 좋아요 여부 조회
	public int likeCheck(Review_heart h) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("Review_heartMapper.likeCheck", h);
		sqlSession.close();
		
		return result;
	}
	
	// 좋아요 추가
	public int addLike(Review_heart h) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Review_heartMapper.addLike", h);
		sqlSession.close();
		
		return result;
	}
	
	// 좋아요 삭제
	public int deleteLike(Review_heart h) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.delete("Review_heartMapper.deleteLike", h);
		sqlSession.close();
		
		return result;
	}
	
	// 좋아요 수
	public int likeCount(int review_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("Review_heartMapper.likeCount", review_idx);
		sqlSession.close();
		
		return result;
	}

}
