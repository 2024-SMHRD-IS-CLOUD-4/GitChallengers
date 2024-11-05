package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class GroupDAO {

    // 그룹과 사용자 관계를 관리하는 데이터베이스 액세스 객체(DAO)
    private GroupDAO groupDao;
    
   

    // 관리자가 그룹에서 멤버를 제거하는 메서드
    public boolean removeMember(int adminId, int groupId, int memberId) {
        // 1단계: adminId가 실제로 해당 그룹의 관리자임을 확인
        if (!groupDao.isGroupAdmin(adminId, groupId)) {
            System.out.println("사용자가 멤버를 제거할 권한이 없습니다.");
            return false;
        }

        // 2단계: 해당 멤버가 그룹에 속해 있는지 확인
        if (!groupDao.isGroupMember(memberId, groupId)) {
            System.out.println("사용자가 그룹의 멤버가 아닙니다.");
            return false;
        }

        // 3단계: 그룹에서 멤버를 제거
        boolean isRemoved = groupDao.removeMemberFromGroup(memberId, groupId);
        if (isRemoved) {
            System.out.println("그룹에서 멤버가 성공적으로 제거되었습니다.");
            return true;
        } else {
            System.out.println("그룹에서 멤버를 제거하는 데 실패했습니다.");
            return false;
        }
    }


// 데이터베이스에 접근하는 DAO 클래스


    SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

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

    // 사용자가 그룹의 관리자임을 확인하는 메서드
    public boolean isGroupAdmin(int userId, int groupId) {
        SqlSession sqlSession = factory.openSession(true);
        GroupCheck params = new GroupCheck(userId, groupId);
        Boolean result = sqlSession.selectOne("GroupMapper.isGroupAdmin", params);
        sqlSession.close();
        return result != null ? result : false;
    }

    // 사용자가 그룹의 멤버인지 확인하는 메서드
    public boolean isGroupMember(int userId, int groupId) {
        SqlSession sqlSession = factory.openSession(true);
        GroupCheck params = new GroupCheck(userId, groupId);
        Boolean result = sqlSession.selectOne("GroupMapper.isGroupMember", params);
        sqlSession.close();
        return result != null ? result : false;
    }

    // 그룹에서 멤버를 제거하는 메서드
    public boolean removeMemberFromGroup(int userId, int groupId) {
        SqlSession sqlSession = factory.openSession(true);
        GroupCheck params = new GroupCheck(userId, groupId);
        int result = sqlSession.delete("GroupMapper.removeMemberFromGroup", params);
        sqlSession.close();
        return result > 0;
    }
}

// 그룹 관리자 확인 및 멤버 확인을 위한 클래스
class GroupCheck {
    private int userId;
    private int groupId;

    public GroupCheck(int userId, int groupId) {
        this.userId = userId;
        this.groupId = groupId;
    }

    // Getter 및 Setter 메서드
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
}
