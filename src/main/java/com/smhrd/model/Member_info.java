package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Member_info {
	
	// 아이디
	private String id;
	
	// 챌린지 도전 횟수
	private int ch_count;
	
	// 챌린지 성공 회수
	private int ch_suc_count;
	
	// 프로필 사진
	private String profile_img;
	
	// 프로필 소개
	private String intro;
	
	// 보유 캐시
	private int cash;
	
	// 보유 금액
	private int point;

	public Member_info(String id, String profile_img, String intro) {
		super();
		this.id = id;
		this.profile_img = profile_img;
		this.intro = intro;
	}
	
	

}
