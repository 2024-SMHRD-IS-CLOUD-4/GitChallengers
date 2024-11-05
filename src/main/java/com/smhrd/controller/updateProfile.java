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
import com.smhrd.model.Member_info;
import com.smhrd.model.Member_infoDAO;


@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String profile_img = request.getParameter("profile_img");
		String intro = request.getParameter("intro");
		
		Member_infoDAO dao = new Member_infoDAO();
		MemberDAO mdao = new MemberDAO();
		Member_info member = new Member_info(id, profile_img, intro);
		int result = dao.update(member);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			Member newMember = mdao.memberInfo(id);
			session.setAttribute("member", newMember);
			response.sendRedirect("profile.jsp");
		}else {
			response.sendRedirect("profileEdit.jsp");
		}
		
	}

}
