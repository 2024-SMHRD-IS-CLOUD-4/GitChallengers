package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Gc_itemsDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public int chWrite(Gc_items i) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Gc_itemsMapper.chWrite", i);
		sqlSession.close();
		
		return result;
	}
	
	public Gc_items getItem(Gc_items i) {
		SqlSession sqlSession = factory.openSession(true);
		Gc_items result = sqlSession.selectOne("Gc_itemsMapper.getItem", i);
		sqlSession.close();
		
		return result;
		
		
		
	}
	
	
	

}
