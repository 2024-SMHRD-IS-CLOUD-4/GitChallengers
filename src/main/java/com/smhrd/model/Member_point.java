package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Member_point {
	
	// 사용자 포인트 순번
	private int user_point_idx;
	
	// 정책 순번
	private int policy_idx;
	
	// 획득 포인트
	private int user_point;
	
	// 회원 아이디
	private String id;
	
	// 등록 일자
	private String created_at;
	
	// 캐시
	private int cash;

}
