package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

/**
 * Servlet implementation class reviewBook
 */
@WebServlet("/reviewBook")
public class reviewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String idxParam = request.getParameter("idx");

		/** 책 이미지가 생기면 이미지 클릭할때 요청을 보내니깐, 이미지에 idx를 담아두고 여기서 받아오면 될거같은데?
		 * http://localhost:8082/Challengers/reviewBook?idx=24 이 방식으로 할거면 getParameter 남겨두고
		 * 아니면 if문 지우고 review_idx를 직접 받아서
		 * */
        if (idxParam != null && !idxParam.isEmpty()) {
            int idx = Integer.parseInt(idxParam);  // String을 int로 변환

            // ReviewDAO를 사용해 데이터베이스에서 리뷰 조회
            ReviewDAO dao = new ReviewDAO();
            Review review = dao.review(idx);

            if (review != null) {
                // review 객체를 request에 속성으로 저장하여 JSP로 전달
                request.setAttribute("review", review);
            }
            System.out.println("review" + review);
            if(review != null) {
    			request.setAttribute("review", review);
    		} 
        }
		/** 도서 이미지가 있으면 -> 클릭을 했을때 그 해당 review_idx를 알아야 리뷰를 불러올수가 있는데? 어떻게 가져올건지*/
		
		
		/** 아래 코드는 임시라서 틀리면 수정하시길*/
		RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewBook.jsp");
        dispatcher.forward(request, response);
        
	}

}
