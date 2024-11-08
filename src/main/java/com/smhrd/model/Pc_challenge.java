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

	public Pc_challenge(String pc_title, String pc_desc, String id) {
		super();
		this.pc_title = pc_title;
		this.pc_desc = pc_desc;
		this.id = id;
	}
	


}
