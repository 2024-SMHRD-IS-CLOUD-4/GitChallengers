package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Member {
	
	String id;
	String pw;
	String name;
	String nickname;
	String email;
	String address;
	int age;
	String fav_book;
	String phoneNum;

	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
}
