package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CommentDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 댓글 수 가져오기
	public int commentCount(int review_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("CommentMapper.commentCount", review_idx);
		sqlSession.close();
		
		return result;
	}
	
	

}
