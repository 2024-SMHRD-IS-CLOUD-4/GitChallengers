package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/pcWrite")
public class pcWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String p_item_title = request.getParameter("p_item_title");
		String p_item_desc = request.getParameter("p_item_desc");
		int pc_idx = Integer.parseInt(request.getParameter("pc_idx")); 
		String id = request.getParameter("id");
		String pc_ocr = request.getParameter("pc_ocr");
		
	}

}
