package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class Challenge {
	
	String book_title;
	String end_dt;
	String start_dt;
	int now_page;
	int total_page;
	String ch_content;
	String self_feedback;
	String ch_content_img;
	int deposit;
	int ch_num;
	String manager;
	int gr_total_point;
	String subManager;
	
}
