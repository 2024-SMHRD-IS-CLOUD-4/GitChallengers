package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Review_heart {
	
	// 리뷰 좋아요 순서
	private int re_heart_idx;
	
	// 리뷰 순서
	private int review_idx;
	
	// 아이디
	private String id;
	
	// 좋아요 날짜
	private String heart_date;
	
	

}
