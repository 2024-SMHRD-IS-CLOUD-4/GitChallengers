package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Group;
import com.smhrd.model.GroupDAO;
import com.smhrd.model.Join;
import com.smhrd.model.JoinDAO;
import com.smhrd.model.Member;
import com.smhrd.model.Warning;
import com.smhrd.model.WarningDAO;


@WebServlet("/kickManager")
public class kickManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 방장 교체
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String manager = member.getId();
		String sub_manager = request.getParameter("sub_manager");
		String id = request.getParameter("manager");
		int group_idx = Integer.parseInt(request.getParameter("idx"));
		
		
		Group group = new Group(group_idx, manager, sub_manager);
		Join join = new Join(group_idx, id);
		Warning warning = new Warning(group_idx, id);
		GroupDAO dao = new GroupDAO();
		JoinDAO jdao = new JoinDAO();
		WarningDAO wdao = new WarningDAO();
		dao.update(group);
		jdao.removeMember(join);
		wdao.warningDelete(warning);
		
		response.sendRedirect("groupChRoom.jsp?idx="+group_idx);
		
	}

}
