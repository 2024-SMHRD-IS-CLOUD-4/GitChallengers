package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String profile_img = request.getParameter("profile_img");
		String intro = request.getParameter("intro");
		
		MemberDAO dao = new MemberDAO();
		Member member = new Member(id, nick, profile_img, intro);
		int result = dao.updateProfile(member);
		
		if(result == 1) {
			response.sendRedirect("profile.jsp");
		}else {
			response.sendRedirect("profileEdit.jsp");
		}
		
	}

}
