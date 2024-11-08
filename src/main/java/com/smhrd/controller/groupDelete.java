package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Join;
import com.smhrd.model.JoinDAO;
import com.smhrd.model.Member;


@WebServlet("/groupDelete")
public class groupDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 방 나가기
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		int group_idx = Integer.parseInt(request.getParameter("group_idx"));
		
		Join join = new Join(group_idx, id);
		JoinDAO dao = new JoinDAO();
		int result = dao.joinDelete(join);
		
		if(result == 1) {
			response.sendRedirect("groupChList.jsp");
		}else {
			response.sendRedirect("groupChRoom.jsp");
		}
		
	}

}
