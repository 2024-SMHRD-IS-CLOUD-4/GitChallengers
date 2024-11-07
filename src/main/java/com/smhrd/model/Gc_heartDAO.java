package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Gc_heartDAO {

	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 좋아요 여부 조회
	public int likeCheck(Gc_heart h) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("Gc_heartMapper.likeCheck", h);
		sqlSession.close();
		
		return result;
	}
	
	// 좋아요 추가
	public int addLike(Gc_heart h) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Gc_heartMapper.addLike", h);
		sqlSession.close();
		
		return result;
	}
	
	// 좋아요 삭제
	public int deleteLike(Gc_heart h) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.delete("Gc_heartMapper.deleteLike", h);
		sqlSession.close();
		
		return result;
	}
	
	// 좋아요 추가
	public int likeCount(int g_item_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("Gc_heartMapper.likeCount", g_item_idx);
		sqlSession.close();
		
		return result;
	}
	
	
		
		
		
}
