package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Group;
import com.smhrd.model.GroupDAO;
import com.smhrd.model.Member_pointDAO;
import com.smhrd.model.ReviewDAO;


@WebServlet("/groupCon")
public class groupCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 그룹 챌린지 생성
		request.setCharacterEncoding("UTF-8");
		
		String groupIdxParam = request.getParameter("group_idx");
		int group_idx = 0;  // 기본값 설정
		if (groupIdxParam != null && !groupIdxParam.isEmpty()) {
		    try {
		        group_idx = Integer.parseInt(groupIdxParam);
		    } catch (NumberFormatException e) {
		        // 잘못된 형식일 경우 예외 처리
		        e.printStackTrace();
		    }
		}

		String group_name = request.getParameter("group_name");
		String group_desc = request.getParameter("group_desc");
		String manager = request.getParameter("manager");
		String sub_manager = request.getParameter("sub_manager");
		
		int group_max = 10;
		
		int days = 0;
		try {
		    String daysParam = request.getParameter("days");
		    if (daysParam != null && !daysParam.isEmpty()) {
		        days = Integer.parseInt(daysParam);
		    }
		} catch (NumberFormatException e) {
		    // 예외 처리 (days 값이 유효하지 않은 경우)
		    e.printStackTrace();
		    days = 7; // 기본값 7일 설정
		}
		
		
		// 선택된 날짜 정보 확인
		System.out.println("선택된 날짜: " + days);
		
		Group group = new Group(group_idx, group_name, group_desc, manager, sub_manager, group_max, days);
		GroupDAO dao = new GroupDAO();
		int result = dao.createGroup(group);
		 
		
		if (result == 1) {
			Member_pointDAO pointdao = new Member_pointDAO();
			pointdao.groupCh(manager);
			// 그룹 생성 후 자동 삭제 예약
		    dao.scheduleGroupDeletion(group);
			response.sendRedirect("groupChList.jsp");
		}else {
			response.sendRedirect("groupCh.jsp");
		}
		
		

	}
}
