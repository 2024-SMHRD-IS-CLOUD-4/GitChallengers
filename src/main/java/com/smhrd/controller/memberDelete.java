package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Join;
import com.smhrd.model.JoinDAO;


@WebServlet("/memberDelete")
public class memberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 그룹 챌린지 추방
		request.setCharacterEncoding("UTF-8");
		int group_idx = Integer.parseInt(request.getParameter("group_idx"));
		String id = request.getParameter("id");
		
		Join member = new Join(group_idx, id);
		JoinDAO dao = new JoinDAO();
		dao.removeMember(member);
		
		response.sendRedirect("groupChRoom.jsp?idx=" + group_idx);
		
		
		
	}

}
