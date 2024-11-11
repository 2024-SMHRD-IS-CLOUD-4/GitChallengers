package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.model.Gc_items;
import com.smhrd.model.Gc_itemsDAO;
import com.smhrd.model.Group;
import com.smhrd.model.GroupDAO;
import com.smhrd.model.Member;


@WebServlet("/mainCon")
public class mainCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 쿼리 파라미터에서 listIdx 값 읽기
        int group_idx = Integer.parseInt(request.getParameter("listIdx"));
        
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        String id = member.getId();
        System.out.println(id);
        System.out.println(group_idx);

        LocalDate now = LocalDate.now();
        GroupDAO gdao = new GroupDAO();
        Gc_itemsDAO gidao = new Gc_itemsDAO();
        Gc_items myItems = new Gc_items(group_idx, id);
        Group myGroup = gdao.groupInfo(group_idx);

        String groupName = myGroup.getGroup_name();
        String groupDesc = myGroup.getGroup_desc();
        int progress = gidao.count(myItems);

        // 날짜 계산 (예외 처리 추가)
        long daysBetween = 0;
        try {
            String created = myGroup.getCreated_at();
            String dateOnly = created.split(" ")[0]; // 날짜만 추출
            LocalDate start = LocalDate.parse(dateOnly);
            daysBetween = start.until(now, ChronoUnit.DAYS);
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
            daysBetween = 0;
        }

        // 응답 데이터 준비
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("title", groupName);
        jsonResponse.put("daysBetween", daysBetween);
        jsonResponse.put("groupDesc", groupDesc);
        jsonResponse.put("progress", progress);

        // JSON 응답 출력
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
    }
}

