package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class GroupDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 그룹리스트 조회
	public List<Group> selectAll() {
		SqlSession sqlSession = factory.openSession(true);
		List<Group> result = sqlSession.selectOne("GroupMapper.selectAll");
		sqlSession.close();
		
		return result;
	}
	

}
