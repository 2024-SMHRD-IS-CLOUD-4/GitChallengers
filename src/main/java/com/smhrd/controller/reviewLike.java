package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.smhrd.model.Review_heart;
import com.smhrd.model.Review_heartDAO;


@WebServlet("/reviewLike")
public class reviewLike extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 본문에서 JSON 데이터를 읽어오기
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        
        // JSON 데이터를 StringBuilder에 쌓기
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        // JSON 데이터 파싱 (JSON 라이브러리 사용)
        String jsonData = sb.toString();
        
        // JSON 객체로 변환
        JSONObject jsonObject = new JSONObject(jsonData);
        
        int review_idx = jsonObject.getInt("review_idx");
        String id = jsonObject.getString("id");
        
        Review_heart like = new Review_heart(review_idx, id);
        Review_heartDAO dao = new Review_heartDAO();
        int result = dao.likeCheck(like);
        
        PrintWriter out = response.getWriter();
		
        if (result == 0) {
        	dao.addLike(like);
        	out.print("true");
        }else {
        	dao.deleteLike(like);
        	out.print("true");
        }
		
		
	}
		
}
