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
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.model.Member;
import com.smhrd.model.Warning;
import com.smhrd.model.WarningDAO;


@WebServlet("/vote")
public class vote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 방장 추방 투표
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
		
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        String id = member.getId();
        int group_idx = jsonObject.getInt("group_idx");
        
        // 확인
        Warning warning = new Warning(group_idx, id);
        WarningDAO dao = new WarningDAO();
        int result = dao.warningCheck(warning);
        PrintWriter out = response.getWriter();
        
        if(result == 0) { // 신고 누적
        	dao.addWarning(warning);
        	out.print("true");
        }else {
        	out.print("false");
        }
        
        
	}

}
