package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Gc_itemsDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 글 작성하기
	public int chWrite(Gc_items i) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Gc_itemsMapper.chWrite", i);
		sqlSession.close();
		
		return result;
	}
	
	// 글 가져오기
	public List<Gc_items> getItem(Gc_items i) {
		SqlSession sqlSession = factory.openSession(true);
		List<Gc_items> result = sqlSession.selectList("Gc_itemsMapper.getItem", i);
		sqlSession.close();
		
		return result;
		
		
		
	}
	
	
	

}
