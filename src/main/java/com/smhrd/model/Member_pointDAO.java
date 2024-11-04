package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class Member_pointDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 랭킹 불러오기
	public List<Member_point> rank() {
		SqlSession sqlSession = factory.openSession(true);
		List<Member_point> result = sqlSession.selectList("Member_pointMapper.rank");
		sqlSession.close();
		
		return result;
		
		
	}
	
	
}
