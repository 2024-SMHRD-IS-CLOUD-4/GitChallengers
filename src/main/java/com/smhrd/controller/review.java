package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Member;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;


@WebServlet("/review")
public class review extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		// 파일의 절대 경로 설정 (저장 경로)
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("img");
		
		// 파일 최대 크기 3mb
		int maxSize = 1024*1024*3;
		
		// (request, 파일저장경로, 파일 최대 크기, 인코딩 타입, 파일이름 생성규칙 - 이름이 중복되었을때 처리)
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		String review_content = multi.getParameter("review_content");
		char is_approved = multi.getParameter("is_approved").charAt(0);
		String review_title = multi.getParameter("review_title");
		String review_ocr = multi.getFilesystemName("review_ocr");
		int review_heart = Integer.parseInt(multi.getParameter("review_heart"));
		
		// review_ocr 값이 없으면 null로 처리
        if (review_ocr == null || review_ocr.trim().isEmpty()) {
            review_ocr = null;
        }
		
		Review review = new Review(id, review_content, review_ocr, is_approved, review_heart, review_title);
		ReviewDAO dao = new ReviewDAO();
		int result = dao.reviewWrite(review);
		
		if(result == 1) {
			response.sendRedirect("reviewMain.jsp");
		}else {
			response.sendRedirect("review.jsp");
		}
		
		
	}

}
