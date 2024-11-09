package com.smhrd.model;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

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
 
    
    
    public void scheduleGroupDeletion(Group g) {
    	 SqlSession sqlSession = factory.openSession(true);
        // 스케줄러 설정
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        
        // days 값만큼 초로 기다린 후 그룹 삭제 작업 실행
        scheduler.schedule(() -> {
        	 try {
                 System.out.println("그룹 삭제 작업 시작: " + g.getGroup_name());
                 int group_idx = g.getGroup_idx();

                 // 그룹 삭제 작업 실행
                 deleteGroup(sqlSession, group_idx);

             } catch (Exception e) {
                 e.printStackTrace(); // 예외 처리
             } finally {
                 // 예외 발생 여부와 관계없이 세션 종료
                 sqlSession.close();
             }
         }, g.getDays(), TimeUnit.SECONDS); // 초 단위로 대기 후 실행
       
    }

    // 그룹 및 관련 데이터 삭제 메소드
    public int deleteGroup(SqlSession sqlSession, int group_idx) {
        sqlSession = factory.openSession(true);
        int result = sqlSession.delete("GroupMapper.deleteGroup", group_idx);
        sqlSession.commit();  // 트랜잭션 커밋
        sqlSession.close();
        System.out.println("삭제된 행의 수: " + result);
        return result;
    }

    
    
    
    
    
}
