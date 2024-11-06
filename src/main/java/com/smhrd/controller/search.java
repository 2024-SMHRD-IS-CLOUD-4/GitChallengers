package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Group;
import com.smhrd.model.GroupDAO;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;


@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		ReviewDAO rdao = new ReviewDAO();
		GroupDAO gdao = new GroupDAO();
		request.setAttribute("type", type);
				
			
		if(type.equals("ch_review")) {
			System.out.println(1);
			List<Review> list = rdao.search(keyword);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/search.jsp").forward(request, response);
		}else {
			List<Group> list = gdao.search(keyword);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/search.jsp").forward(request, response);
			
		}
		
		
		

	}

}
