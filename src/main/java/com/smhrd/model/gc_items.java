package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class gc_items {
	
	// 그룹 챌린지 아이템 순번
	private int item_idx;
	
	// 아이템 제목
	private String item_title;
	
	// 아이템 소개
	private String item_desc;
	
	// 그룹 챌린지 순번
	private int gc_idx;
	
	// 회원 아이디
	private String id;
	
	// 생성임
	private String created_at;
	
	// 성공 여부
	private String is_success;
	
	// 그룹챌린지 이미지
	private String gc_ocr;
	
	
	

}
