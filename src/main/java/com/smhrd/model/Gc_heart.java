package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Gc_heart {
	
	// 그룹 좋아요 순서
	private int gc_heart_idx;
	
	// 그룹 아이템 순서
	private int g_item_idx;
	
	// 아이디
	private String id;
	
	// 좋아요 날짜
	private String heart_date;

	public Gc_heart(int g_item_idx, String id) {
		super();
		this.g_item_idx = g_item_idx;
		this.id = id;
	}
	
	
	

}
