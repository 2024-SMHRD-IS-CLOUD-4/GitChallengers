package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Follow {
	
	// 팔로우 순번
	private int follow_idx;
	
	// 팔로워
	private String follower;
	
	// 팔로잉
	private String following;
	
	// 팔로우 날짜
	private String followed_at;

	public Follow(String follower, String following) {
		super();
		this.follower = follower;
		this.following = following;
	}
	

}
