package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Gc_comment {
	
	// 댓글 순번
	private int cmt_idx;
	
	// 댓글 내용
	private String cmt_content;
	
	// 댓글 작성일자
	private String created_at;
	
	// 댓글 작성자
	private String id;
	
	// 그룹 챌린지 아이템 순번
	private int g_item_idx;

	public Gc_comment(String cmt_content, String id, int g_item_idx) {
		super();
		this.cmt_content = cmt_content;
		this.id = id;
		this.g_item_idx = g_item_idx;
	}
	
	
	
	

}
