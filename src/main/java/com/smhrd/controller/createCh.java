package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Pc_challenge;
import com.smhrd.model.Pc_challengeDAO;


@WebServlet("/createCh")
public class createCh extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		String pc_title = request.getParameter("pc_title");
		String pc_desc = request.getParameter("pc_desc");
		
		Pc_challenge ch = new Pc_challenge(pc_title, pc_desc, id);
		Pc_challengeDAO dao = new Pc_challengeDAO();
		int result = dao.createCh(ch);
		
		if (result == 1) {
			response.sendRedirect("soloChList.jsp");
		}else {
			response.sendRedirect("makeSoloCh.jsp");
		}
		
		
		
		
	}

}
