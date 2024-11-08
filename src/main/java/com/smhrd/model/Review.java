package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Review {

	// 리뷰순번
	private int review_idx;
	
	// 사용자 아이디
	private String id;
	
	// 리뷰 내용
	private String review_content;
	
	// 리뷰사진
	private String review_ocr;
	
	// 인증여부
	private char is_approved;
	
	// 리뷰좋아요
	private int review_heart;
	
	// 리뷰제목
	private String review_title;

	public Review(String id, String review_content, String review_ocr, char is_approved, String review_title) {
		super();
		this.id = id;
		this.review_content = review_content;
		this.review_ocr = review_ocr;
		this.is_approved = is_approved;
		this.review_title = review_title;
	}


	
	

}
