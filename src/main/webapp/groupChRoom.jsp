<%@page import="com.smhrd.model.Gc_items"%>
<%@page import="com.smhrd.model.Gc_itemsDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그룹챌린지방</title>
    <link rel="stylesheet" href="./css/groupChallengeRoom.css">
</head>

<body>
<%	
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
	GroupDAO dao = new GroupDAO(); 
	JoinDAO jdao = new JoinDAO();
	Gc_itemsDAO idao = new Gc_itemsDAO();
	int idx = Integer.parseInt(request.getParameter("idx")); // 방 인덱스
	Group group = dao.groupInfo(idx); // 방 정보
	List<Join> list = jdao.selectAll(idx); // 방 참가 인원 정보
	
	
%>

    <div class="header">
        <div class="logo">
            <img src="img/team-logo.png" alt="로고">
            <div class="nav-links">
                <a href="#">챌린지</a>
                <a href="#">챌린지</a>
                <a href="#">info</a>
            </div>
        </div>
        <div class="header-icons">
            <i class="fas fa-search"></i>
            <div class="profile-circle">
                <img src="img/chaechae-1.jpg" alt="프로필 이미지">
            </div>
            <i class="fas fa-bell"></i>
            <button class="logout-button">로그아웃</button>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="profile-upload">
                <div class="profile-img" id="profilePreview"></div>
            </div>
            <div class="profile-name"><%=group.getManager()%></div>
            <ul class="group-list">
            	<li class="group-item">
					<img src="">
					<span class="group-name"><%=group.getSub_manager()%></span>
					<input type="checkbox">
                </li>
                <%
                    for(Join j: list) {
                    	if(!j.getId().equals(group.getManager()) && !j.getId().equals(group.getSub_manager())) {
                %>
			                <li class="group-item">
			                    <img src="">
			                    <span class="group-name"><%=j.getId()%></span>
			                    <input type="checkbox">
			                </li>
			                <% } %>
                	<% } %>
            </ul>
            <button class="button" onClick="location.href='chWrite.jsp?idx=<%=idx%>'">오늘의 챌린지 작성</button>
        </div>

        <!-- 카드 영역 -->
        <div class="card-container">
            <%
                // 카드 데이터 배열
                for (Join j : list) {
                	Gc_items items = new Gc_items(idx, j.getId());
                	List<Gc_items> getItem = idao.getItem(items); // 작성글 가져오기
                	for (Gc_items gi : getItem) {
                		if (gi != null) {
            %>
            <div class="card">
                <div class="card-content">
                    <div class="card-header"><%= j.getId() %></div>
                    <div class="book-title"><%= gi.getG_item_title() %></div>
                    <div class="page-info"></div>
                    <div class="content-placeholder"><%= gi.getG_item_desc() %></div>
                </div>
                <div class="card-icons">
                    <i class="heart">🤍</i>
                    <i class="comment">💬</i>
                    <i>📤</i>
                </div>
                <div class="comment-section">
                    <ul class="comment-list"></ul>
                    <input type="text" class="comment-input" placeholder="댓글을 입력하세요">
                    <button class="comment-btn">댓글 작성</button>
                </div>
            </div>
    	        	<%} %>
	            <%} %>
            <%} %>
        </div>
    </div>

    <script src="./js/groupChallengeRoom.js"></script>
</body>

</html>
