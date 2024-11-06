package com.smhrd.model;

public class GroupCheckPoint {
    private int userId; // 사용자 ID
    private int groupId; // 그룹 ID

    public  GroupCheckPoint(int userId, int groupId) {
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
