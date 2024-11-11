package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {
	
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원가입
	public int join(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.insert("MemberMapper.join", m);
		sqlSession.close();
		
		return result;
	}
	
	// 로그인
	public Member login(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		Member result = sqlSession.selectOne("MemberMapper.login", m);
		sqlSession.close();
		
		return result;
	}
	
	// 아이디 중복 확인
	public boolean idCheck(String id) {
		SqlSession sqlSession = factory.openSession(true);
		boolean result = sqlSession.selectOne("MemberMapper.idCheck", id);
		sqlSession.close();
		
		return result;
	}
	
	// 회원정보 가져오기
	public List<Member> selectAll() {
		SqlSession sqlSession = factory.openSession(true);
		List<Member> result = sqlSession.selectList("MemberMapper.selectAll");
		sqlSession.close();
		
		return result;
	}
	
	// 회원정보 수정
	public int update(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("MemberMapper.update", m);
		sqlSession.close();
		
		return result;
	}
	
	// 프로필 수정
	public int updateProfile(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		int result = sqlSession.update("MemberMapper.updateProfile", m);
		sqlSession.close();
		
		return result;
	}
	
	// 업데이트 회원 정보 가져오기
	public Member memberInfo(String id) {
		SqlSession sqlSession = factory.openSession(true);
		Member result = sqlSession.selectOne("MemberMapper.memberInfo", id);
		sqlSession.close();
		
		return result;
	}

	//회원 탈퇴
	public int deleteMember(Member m) {
		SqlSession sqlSession = factory.openSession(true);
		
        try {
        	int deletedRows = 0;
        	// 4. CH_MEMBER에서 회원 데이터를 삭제
        	deletedRows += sqlSession.delete("MemberMapper.deleteFromMember", m);
        	// 2. CH_JOIN에서 해당 회원이 가입한 그룹을 먼저 삭제
        	deletedRows += sqlSession.delete("MemberMapper.deleteFromJoin", m);
        	
        	// 3. CH_GROUP에서 해당 회원과 관련된 그룹을 삭제 (관리자/부방장 관련 그룹 삭제)
        	deletedRows += sqlSession.delete("MemberMapper.deleteFromGroup", m);
        	
        	 // 1. CH_GC_ITEMS에서 해당 회원의 데이터를 삭제
            deletedRows += sqlSession.delete("MemberMapper.deleteFromGcItems", m);


            // 트랜잭션 커밋
            sqlSession.commit();
            return deletedRows;
        } catch (Exception e) {
            // 오류 발생 시 롤백
            sqlSession.rollback();
            throw e;
        } finally {
            sqlSession.close();
		
	}
	
}
}