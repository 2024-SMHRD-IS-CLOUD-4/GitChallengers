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


@WebServlet("/updateMember")
public class updateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email") + request.getParameter("domain");
		String phone = request.getParameter("phone");
		String birthdate = request.getParameter("birthdate");
		String fav_books = request.getParameter("fav_books");
		
		Member update;
		
		if(fav_books == null) {
			update = new Member(id, pw, name, nick, email, phone, birthdate);
		}else {
			update = new Member(id, pw, name, nick, email, phone, birthdate, fav_books);			
		}
		
		MemberDAO dao = new MemberDAO();
		int result = dao.update(update);
		
		if(result == 1) {
			session = request.getSession();
			Member newMember = dao.memberInfo(id);
			session.setAttribute("member", newMember);
			response.sendRedirect("profile.jsp");
		}else {
			response.sendRedirect("profileEdit.jsp");
		}
		
		
		
		
	}

}
