<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Member_point"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Cards</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/reviewMain.css">
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
	%>
        <!-- Header -->
        <div class="header">
            <div class="logo">
                <img src="img/team-logo.png" alt="로고" onClick="location.href='main.jsp'">
                <div class="nav-links">
                    <a href="#">MY 챌린지</a>
					<a href="groupChList.jsp">그룹 챌린지</a>
		        	<a href="soloChList.jsp">개인 챌린지</a>
		        	<a href="reviewMain.jsp">리뷰</a>
                </div>
            </div>
            <div class="header-icons">
                <i class="fas fa-search"></i>             
                <i class="fas fa-bell"></i>
                <a href="profile.jsp" class="welcome-text"><%=member.getNick() %> 환영합니다</a>
                <form action="logoutCon">
		     	<button class="logout-button">로그아웃</button>
		    	</form>
    		</div>
        </div>
	
        <div class="card">
            <img src="https://example.com/image1.png" alt="Book Image">
            <div class="card-content">
                <div class="card-title">리뷰 제목 ✅</div>
                <div class="card-body">내용</div>
            </div>
            <div class="card-stats">
                <span class="recommendation positive">추천해요!</span><br>
                좋아요 203개<br>
                댓글 10개
            </div>
        </div>

    <!-- Main Container -->
    <div class="container">
        <div class="card">
            <img src="https://example.com/image2.png" alt="Book Image">
            <div class="card-content">
                <div class="card-title">리뷰 제목 ✅</div>
                <div class="card-body">내용</div>
            </div>
            <div class="card-stats">
                <span class="recommendation positive">추천해요!</span><br>
                좋아요 150개<br>
                댓글 10개
            </div>
        </div>

        <div class="card">
            <img src="https://example.com/image3.png" alt="Book Image">
            <div class="card-content">
                <div class="card-title">리뷰 제목 ✅</div>
                <div class="card-body">내용</div>
            </div>
            <div class="card-stats">
                <span class="recommendation negative">추천하지 않아요!</span><br>
                좋아요 120개<br>
                댓글 15개
            </div>
        </div>

        <!-- MY 챌린지 팝업 -->
        <div id="myChallengePopup" class="popup hidden">
            <h3>MY 챌린지</h3>
            <div>
                <p>개인 챌린지</p>
                <button class="popup-button">돼지책</button>
                <button class="popup-button">하루 한권 읽어요</button>
            </div>
        </div>
    </div>

    <script src="./js/reviewMain.js"></script>
</body>
</html>

