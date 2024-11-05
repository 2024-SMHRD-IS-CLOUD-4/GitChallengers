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
	private String birthdate;
	
	// 선호 도서 
	private String fav_books;
	
	// 가입 일자 
	private String joined_at;

	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public Member(String id, String pw, String name, String nick, String email, String phone,
			String birthdate, String fav_books) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.email = email;
		this.phone = phone;
		this.birthdate = birthdate;
		this.fav_books = fav_books;
	}

	public Member(String id, String pw, String name, String nick, String email, String phone, String birthdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.email = email;
		this.phone = phone;
		this.birthdate = birthdate;
	}

	
}
