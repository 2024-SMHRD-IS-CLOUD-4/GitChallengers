package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

@WebServlet("/loginCon")
public class loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member login = new Member(id, pw);
		MemberDAO dao = new MemberDAO();
		Member result = dao.login(login);
		
		if(result == null) {
			 request.setAttribute("errorMessage", "회원정보가 일치하지 않습니다!");
			 RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			 dispatcher.forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("member", result);
			response.sendRedirect("main.jsp");
		}
		
	}

}
