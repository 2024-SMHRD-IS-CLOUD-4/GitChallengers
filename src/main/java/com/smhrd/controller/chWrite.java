package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Gc_items;
import com.smhrd.model.Gc_itemsDAO;


@WebServlet("/chWrite")
public class chWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String g_item_title = request.getParameter("g_item_title");
		String g_item_desc = request.getParameter("g_item_desc");
		int gc_idx = Integer.parseInt(request.getParameter("gc_idx")); 
		String id = request.getParameter("id");
		String gc_ocr = request.getParameter("gc_ocr");
		
		Gc_items items = new Gc_items(g_item_title, g_item_desc,gc_idx, id, gc_ocr);
		Gc_itemsDAO dao = new Gc_itemsDAO();
		int result = dao.chWrite(items);
		
		if(result == 1) {
			response.sendRedirect("groupChRoom.jsp?idx="+gc_idx);
		}else {
			response.sendRedirect("chWrite.jsp");
		}
		
	}

}
