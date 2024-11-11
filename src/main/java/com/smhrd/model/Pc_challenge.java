package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Pc_challenge {
	
	// 개인 챌린지 순번
	private int pc_idx;
	
	// 챌린지 체목
	private String pc_title;
	
	// 챌린지 소개
	private String pc_desc;
	
	// 개설자 아이디
	private String id;
	
	// 등록 일자
	private String created_at;
	
	// 선택 날짜
	private int days;

	public Pc_challenge(String pc_title, String pc_desc, String id, int days) {
		super();
		this.pc_title = pc_title;
		this.pc_desc = pc_desc;
		this.id = id;
		this.days = days;
	}

	public Pc_challenge(int pc_idx, String id) {
		super();
		this.pc_idx = pc_idx;
		this.id = id;
	}
	
	

}
