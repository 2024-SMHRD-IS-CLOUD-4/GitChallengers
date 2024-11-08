package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Member_point;
import com.smhrd.model.Member_pointDAO;


@WebServlet("/joinCon")
public class joinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email") + request.getParameter("domain");
		String phone = request.getParameter("phone");
		String birthdate = request.getParameter("birthdate");
		String fav_books = request.getParameter("fav_books");
		birthdate = birthdate.replace("-","");
		
		Member join;
		
		if(fav_books == null) {
			join = new Member(id, pw, name, nick, email, phone, birthdate);
		}else {
			join = new Member(id, pw, name, nick, email, phone, birthdate, fav_books);			
		}
		MemberDAO dao = new MemberDAO();
		int result = dao.join(join);
		
		if (result == 1) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("join.jsp");
		}
		
		
	}

}
