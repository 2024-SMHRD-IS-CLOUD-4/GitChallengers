package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Group;
import com.smhrd.model.GroupDAO;


@WebServlet("/groupCon")
public class groupCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 그룹 챌린지 생성
		request.setCharacterEncoding("UTF-8");
		String group_name = request.getParameter("group_name");
		String group_desc = request.getParameter("group_desc");
		String manager = request.getParameter("manager");
		String sub_manager = request.getParameter("sub_manager");
		int group_max = 10;
		
		
		Group group = new Group(group_name, group_desc, manager, sub_manager, group_max);
		GroupDAO dao = new GroupDAO();
		int result = dao.createGroup(group);
		
		
		if (result == 1) {
			response.sendRedirect("groupChList.jsp");
		}else {
			response.sendRedirect("groupCh.jsp");
		}
		
		
		
	}

}
