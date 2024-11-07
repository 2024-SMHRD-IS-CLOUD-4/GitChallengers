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

import com.smhrd.model.Gc_heart;
import com.smhrd.model.Gc_heartDAO;


@WebServlet("/gc_like")
public class gc_like extends HttpServlet {
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
        
        int g_item_idx = jsonObject.getInt("g_item_idx");
        String id = jsonObject.getString("id");
        
        Gc_heart like = new Gc_heart(g_item_idx, id);
        Gc_heartDAO dao = new Gc_heartDAO();
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
