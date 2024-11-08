package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;


@WebServlet("/review")
public class review extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		String review_content = request.getParameter("review_content");
		char is_approved = request.getParameter("is_approved").charAt(0);
		String review_title = request.getParameter("review_title");
		String review_ocr = request.getParameter("review_ocr");
		System.out.println(review_ocr);
		
		Review review = new Review(id, review_content, review_ocr, is_approved, review_title);
		ReviewDAO dao = new ReviewDAO();
		int result = dao.reviewWrite(review);
		
		if(result == 1) {
			response.sendRedirect("reviewMain.jsp");
		}else {
			response.sendRedirect("review.jsp");
		}
		
		
	}

}
