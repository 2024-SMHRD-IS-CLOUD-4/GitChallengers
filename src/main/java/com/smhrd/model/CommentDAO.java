package com.smhrd.model;

import java.util.List;

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
	
	// 댓글 작성하기
	public int commentWrite(Comment c) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("CommentMapper.commentWrite", c);
		sqlSession.close();
		
		return result;
	}
	
	// 댓글 리스트 가져오기
	public List<Comment> commentList(int review_idx){
		SqlSession sqlSession = factory.openSession(true);
		List<Comment> result = sqlSession.selectList("CommentMapper.commentList", review_idx);
		sqlSession.close();
		
		return result;
	}
	

}
