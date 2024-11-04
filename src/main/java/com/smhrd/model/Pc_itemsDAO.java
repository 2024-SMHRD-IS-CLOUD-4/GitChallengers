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

}
