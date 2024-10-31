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
	int idx = Integer.parseInt(request.getParameter("idx"));
	GroupDAO dao = new GroupDAO();
	Group group = dao.groupInfo(idx);
	JoinDAO jdao = new JoinDAO();
	List<Join> list = jdao.selectAll(idx);
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
            <button class="button">오늘의 챌린지 작성</button>
        </div>

        <!-- 카드 영역 -->
        <div class="card-container">
            <%
                // 카드 데이터 배열
                String[] cardHeaders = {"그룹원 000", "그룹원 001", "그룹원 002"};
                String[] bookTitles = {"책 제목", "책 제목", "책 제목"};
                String[] pageInfos = {"페이지: 120~150p", "페이지: 151~180p", "페이지: 181~200p"};
                String[] contents = {"자유 내용", "자유 내용", "자유 내용"};
                
                for (int i = 0; i < cardHeaders.length; i++) {
            %>
            <div class="card">
                <div class="card-content">
                    <div class="card-header"><%= cardHeaders[i] %></div>
                    <div class="book-title"><%= bookTitles[i] %></div>
                    <div class="page-info"><%= pageInfos[i] %></div>
                    <div class="content-placeholder"><%= contents[i] %></div>
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
        </div>
    </div>

    <script src="./js/groupChallengeRoom.js"></script>
</body>

</html>
