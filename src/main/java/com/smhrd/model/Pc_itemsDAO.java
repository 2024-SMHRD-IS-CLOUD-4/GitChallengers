package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Pc_itemsDAO {

	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 개인 챌린지 작성글 불러오기
	public List<Pc_items> selectAll(int pc_idx) {
		SqlSession sqlSession = factory.openSession(true);
		List<Pc_items> result = sqlSession.selectList("Pc_itemsMapper.selectAll", pc_idx);
		sqlSession.close();

		return result;
	}
	
	// 개인 챌린지 글 작성
	public int pcWrite(Pc_items i) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("Pc_itemsMapper.pcWrite", i);
		sqlSession.close();
		
		return result;
	}
}
