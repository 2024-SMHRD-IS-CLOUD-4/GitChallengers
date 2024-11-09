package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Gc_items {
	
	// 그룹 챌린지 아이템 순번
	private int g_item_idx;
	
	// 아이템 제목
	private String g_item_title;
	
	// 아이템 소개
	private String g_item_desc;
	
	// 그룹 챌린지 순번
	private int gc_idx;
	
	// 회원 아이디
	private String id;
	
	// 생성임
	private String created_at;
	
	// 성공 여부
	private char is_success;
	
	// 그룹 좋아요
	private int gc_con_heart;
	
	// 그룹챌린지 이미지
	private String gc_ocr;

	public Gc_items(String g_item_title, String g_item_desc, int gc_idx, String id, String gc_ocr) {
		super();
		this.g_item_title = g_item_title;
		this.g_item_desc = g_item_desc;
		this.gc_idx = gc_idx;
		this.id = id;
		this.gc_ocr = gc_ocr;
	}

	public Gc_items(int gc_idx, String id) {
		super();
		this.gc_idx = gc_idx;
		this.id = id;
	}
	
	
	

}
