package com.smhrd.controller;

import com.smhrd.model.GroupDAO;

public class GroupController {

    private GroupDAO groupDAO;

    // GroupController 생성자 - GroupService 주입
    public GroupController(GroupDAO groupDAO) {
        this.groupDAO = groupDAO;
    }

    // 그룹에서 멤버를 제거하는 요청을 처리하는 메서드
    public String removeMember(int groupId, int adminId, int memberId) {
        // GroupService의 removeMember 메서드를 호출하여 멤버 제거 시도
        boolean success = groupDAO.removeMember(adminId, groupId, memberId);
        
        // 멤버 제거 성공 여부에 따라 적절한 응답 반환
        if (success) {
            return "그룹에서 멤버가 성공적으로 제거되었습니다.";
        } else {
            return "멤버를 제거하는 데 실패했습니다. 권한이 없거나 유효하지 않은 요청입니다.";
        }
    }
}
