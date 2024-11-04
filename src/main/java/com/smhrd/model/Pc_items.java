package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Pc_items {
	
	// 아이템 순번
	private int p_item_idx;
	
	// 아이템 제목
	private String p_item_title;
	
	// 아이템 소개
	private String p_item_desc;
	
	// 등록일자
	private String created_at;
	
	// 성공 여부
	private String is_success;
	
	// 개인 챌린지 순번
	private int pc_idx;
	
	// 개인 챌린지 이미지
	private String pc_ocr;

	public Pc_items(String p_item_title, String p_item_desc, int pc_idx, String pc_ocr) {
		super();
		this.p_item_title = p_item_title;
		this.p_item_desc = p_item_desc;
		this.pc_idx = pc_idx;
		this.pc_ocr = pc_ocr;
	}

	
	
}
