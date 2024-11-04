package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Gc_items;
import com.smhrd.model.Gc_itemsDAO;
import com.smhrd.model.Pc_items;
import com.smhrd.model.Pc_itemsDAO;


@WebServlet("/pcWrite")
public class pcWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String p_item_title = request.getParameter("p_item_title");
		System.out.println(p_item_title);
		String p_item_desc = request.getParameter("p_item_desc");
		System.out.println(p_item_desc);
		int pc_idx = Integer.parseInt(request.getParameter("pc_idx"));
		System.out.println(pc_idx);
		String pc_ocr = request.getParameter("pc_ocr");
		System.out.println(pc_ocr);
		
		Pc_items items = new Pc_items(p_item_title, p_item_desc, pc_idx, pc_ocr);
		Pc_itemsDAO dao = new Pc_itemsDAO();
		int result = dao.pcWrite(items);
		
		System.out.println(result);
		
	}

}
