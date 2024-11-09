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

	// 최대인원
	private int group_max;
	
	// 방장신고스택
	private int warning_stack;
	
	// 선택 날짜
	private int days;
	

	public Group(int group_idx, String group_name, String group_desc, String manager, String sub_manager, int group_max, int days) {
		super();
		this.group_idx = group_idx;
		this.group_name = group_name;
		this.group_desc = group_desc;
		this.manager = manager;
		this.sub_manager = sub_manager;
		this.group_max = group_max;
		this.days = days;
	}
	

	
 
}
