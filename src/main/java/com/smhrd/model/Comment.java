package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

// 리뷰 댓글
@Getter
@AllArgsConstructor
public class Comment {
	
	// 댓글 순번
	private int cmt_idx;
	
	// 리뷰 순번
	private int review_idx;
	
	// 댓글 내용
	private String cmt_content;
	
	// 댓글 작성일자
	private String created_at;
	
	// 댓글 작성자
	private String id;

}
