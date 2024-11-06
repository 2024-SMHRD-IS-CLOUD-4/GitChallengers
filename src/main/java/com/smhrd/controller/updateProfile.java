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
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Member_info;
import com.smhrd.model.Member_infoDAO;


@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		// 파일의 절대 경로 설정 (저장 경로)
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("profile_img");
		
		// 파일 최대 크기 3mb
		int maxSize = 1024*1024*3;
		
		// (request, 파일저장경로, 파일 최대 크기, 인코딩 타입, 파일이름 생성규칙 - 이름이 중복되었을때 처리)
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String id = multi.getParameter("id");
		String profile_img = multi.getFilesystemName("profile_img");
		String intro = multi.getParameter("intro");
		
		Member_infoDAO dao = new Member_infoDAO();
		MemberDAO mdao = new MemberDAO();
		Member_info member = new Member_info(id, profile_img, intro);
		int result = dao.update(member);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			Member newMember = mdao.memberInfo(id);
			session.setAttribute("member", newMember);
			response.sendRedirect("profile.jsp");
		}else {
			response.sendRedirect("profileEdit.jsp");
		}
		
	}

}
