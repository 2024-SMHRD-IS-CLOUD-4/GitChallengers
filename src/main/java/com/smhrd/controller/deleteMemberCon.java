package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("/deleteMemberCon")
public class deleteMemberCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member deleteMember = new Member(id, pw);
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteMember(deleteMember);
		
		if (result == 1) { // 탈퇴 성공
			HttpSession session = request.getSession();
            session.invalidate(); // 세션 무효화
            response.sendRedirect("login.jsp"); // 로그인 페이지로 이동
        } else { // 탈퇴 실패 (ID가 존재하지 않는 경우)
            request.setAttribute("errorMessage", "회원 정보를 찾을 수 없습니다.");
            request.getRequestDispatcher("delete.jsp").forward(request, response);
        }
    
    }
	}


