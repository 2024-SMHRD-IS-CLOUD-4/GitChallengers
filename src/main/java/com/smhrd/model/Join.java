package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
// 그룹 가입
public class Join {
	
	// 가입 순번 
    private int join_idx;

    // 그룹 순번 
    private int group_idx;

    // 가입자 아이디 
    private String id;

    // 가입 일자 
    private String joined_at;

	public Join(int group_idx, String id) {
		super();
		this.group_idx = group_idx;
		this.id = id;
	}
    
    

}
