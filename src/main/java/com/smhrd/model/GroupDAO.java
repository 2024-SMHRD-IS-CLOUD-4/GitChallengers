package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class GroupDAO {

    SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
    
    // 그룹 챌린지 검색
    public List<Group> search(String group_name){
		SqlSession sqlSession = factory.openSession(true);
		List<Group> result = sqlSession.selectList("GroupMapper.search", group_name);
		sqlSession.close();

		return result;
	}

    // 그룹리스트 조회
    public List<Group> selectAll() {
        SqlSession sqlSession = factory.openSession(true);
        List<Group> result = sqlSession.selectList("GroupMapper.selectAll");
        sqlSession.close();

        return result;
    }

    // 그룹 생성
    public int createGroup(Group g) {
        SqlSession sqlSession = factory.openSession(true);
        int result = sqlSession.insert("GroupMapper.createGroup", g);
        sqlSession.close();

        return result;
    }

    // 그룹 정보 가져오기
    public Group groupInfo(int idx) {
        SqlSession sqlSession = factory.openSession(true);
        Group result = sqlSession.selectOne("GroupMapper.groupInfo", idx);
        sqlSession.close();

        return result;
    }
    
}
