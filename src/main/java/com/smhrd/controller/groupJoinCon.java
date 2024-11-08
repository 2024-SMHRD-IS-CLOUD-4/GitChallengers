package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Join;
import com.smhrd.model.JoinDAO;
import com.smhrd.model.Member_pointDAO;


@WebServlet("/groupJoinCon")
public class groupJoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 그룹 챌린지 참여
		request.setCharacterEncoding("UTF-8");
		int group_idx = Integer.parseInt(request.getParameter("idx"));
		String id = request.getParameter("id");
		
		Join groupJoin = new Join(group_idx, id);
		JoinDAO dao = new JoinDAO();
		int result = dao.join(groupJoin);

		PrintWriter out = response.getWriter();
		if(result == 1) {
			Member_pointDAO pointdao = new Member_pointDAO();
			pointdao.groupCh(id);
			out.print(true);			
		}else {
			out.print(false);
		}
		
	}

}
