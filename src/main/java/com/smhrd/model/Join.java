package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Join {
	
	// 가입 순번 
    private int join_idx;

    // 그룹 순번 
    private int group_idx;

    // 가입자 아이디 
    private String id;

    // 가입 일자 
    private String joined_at;

    // 승인 여부 
    private String is_accepted;

}
