package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ReviewDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 리뷰검색
	public List<Review> search(String keyword){
		SqlSession sqlSession = factory.openSession(true);
		List<Review> result = sqlSession.selectList("ReviewMapper.search", keyword);
		sqlSession.close();

		return result;
	}

}
