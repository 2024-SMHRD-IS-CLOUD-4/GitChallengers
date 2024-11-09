package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Warning {
	
	// 경고 인덱스
	private int warn_idx;
	
	// 그룹 챌린지인덱스
	private int group_idx;
	
	// id
	private String id;
	
	// 경고스택
	private int warning_stack;

	public Warning(int group_idx, String id) {
		super();
		this.group_idx = group_idx;
		this.id = id;
	}
	
	

}
