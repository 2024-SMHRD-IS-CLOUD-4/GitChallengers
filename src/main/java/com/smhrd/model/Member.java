package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
//회원정보 
public class Member {

	// 아이디 
	private String id;
	
	// 비밀번호 
	private String pw;
	
	// 이름 
	private String name;
	
	// 닉네임 
	private String nick;
	
	// 이메일 
	private String email;
	
	// 휴대폰번호 
	private String phone;
	
	// 생년월일 
	private String birthday;
	
	// 선호 도서 
	private String fav_book;
	
	// 가입 일자 
	private String joined_at;
	
	// 챌린지 도전회수
	private int ch_count;
	
	// 챌린지 성공횟수
	private int ch_suc_count;

	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public Member(String id, String pw, String name, String nick, String email, String phone,
			String birthday, String fav_book) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.fav_book = fav_book;
	}

	public Member(String id, String pw, String name, String nick, String email, String phone, String birthday) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
	}

	
	
}
