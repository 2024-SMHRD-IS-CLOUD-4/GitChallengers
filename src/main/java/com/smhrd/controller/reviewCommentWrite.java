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

import com.smhrd.model.Comment;
import com.smhrd.model.CommentDAO;


@WebServlet("/reviewCommentWrite")
public class reviewCommentWrite extends HttpServlet {
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
        
        String cmt_content = jsonObject.getString("cmt_content");
        String id = jsonObject.getString("id");
        int review_idx = jsonObject.getInt("review_idx");
		
		Comment comment = new Comment(review_idx, cmt_content, id);
		CommentDAO dao = new CommentDAO();
		int result = dao.commentWrite(comment);
		
		if (result == 1) {
			PrintWriter out = response.getWriter();
			out.print("true");			
		}
		
		
		
	}

}
