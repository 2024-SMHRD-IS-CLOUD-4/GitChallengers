package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Gc_commentDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 댓글 수 가져오기
	public int commentCount(int g_item_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.selectOne("Gc_commentMapper.commentCount", g_item_idx);
		sqlSession.close();
		
		return result;
	}
	
	// 댓글 작성하기
	public int commentWrite(Gc_comment c) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Gc_commentMapper.commentWrite", c);
		sqlSession.close();
		
		return result;
	}
	
	// 댓글 리스트 가져오기
	public List<Gc_comment> commentList(int g_item_idx){
		SqlSession sqlSession = factory.openSession(true);
		List<Gc_comment> result = sqlSession.selectList("Gc_commentMapper.commentList", g_item_idx);
		sqlSession.close();
		
		return result;
	}
	
	
}
