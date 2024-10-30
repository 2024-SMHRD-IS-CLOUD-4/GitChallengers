package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
//챌린지 그룹 
public class Group {
	
	// 그룹 순번 
	private int group_idx;
	
	// 그룹 이름 
	private String group_name;
	
	// 그룹 소개 
	private String group_desc;
	
	// 그룹 방장 
	private String manager;
	
	// 그룹 부방장 
	private String sub_manager;
	
	// 등록 일자 
	private String created_at;
	
 
}
