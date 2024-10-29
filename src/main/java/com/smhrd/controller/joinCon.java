package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("/joinCon")
public class joinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		int age = Integer.parseInt(request.getParameter("age"));
		String fav_book = request.getParameter("fav_book");
		String phoneNum = request.getParameter("phoneNum");
		
		Member join = new Member(id, pw, name, nickname, email, address, age, fav_book, phoneNum);
		MemberDAO dao = new MemberDAO();
		int result = dao.join(join);
		
		if (result == 1) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("join.jsp");
		}
		
		
	}

}
