<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인챌린지방</title>
    <link rel="stylesheet" href="./css/soloChRoom.css">
</head>

<body>
	<%
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
	Pc_challengeDAO pcdao = new Pc_challengeDAO();
	List<Pc_challenge> list = pcdao.selectAll(member.getId());
	
	%>
	
    <!-- 헤더 -->
    <div class="header">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/img/team-logo.png" alt="로고">
            <div class="nav-links">
                <a href="#">MY 챌린지</a>
                <a href="groupChList.jsp">그룹 챌린지</a>
                <a href="#">개인 챌린지</a>
            </div>
        </div>
        <div class="header-icons">
            <i class="fas fa-search"></i>
            <!-- 사용자 환영 텍스트 추가 -->
            <a href="profile.jsp" class="welcome-text"><%=member.getNick() %> 환영합니다</a>
            <form action="logoutCon">
	                <button class="logout-button">로그아웃</button>
            </form>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="profile-upload">
                <div class="profile-img" id="profilePreview"></div>
            </div>
            <div class="profile-name"></div>
            <button class="button" onclick="location.href='<%= request.getContextPath() %>/writeChallenge'">오늘의 챌린지 작성</button>
        </div>

        <!-- 카드 영역 -->
        <div class="card-container">
            <!-- 카드 리스트 -->
            <% 
               
            %>
                <div class="card">
                    <div class="card-content">
                        <div class="card-header">그룹원 </div>
                        <div class="book-title"></div>
                        <div class="page-info">페이지: </div>
                        <div class="content-placeholder"></div>
                    </div>
                    <div class="card-icons">
                        <i class="heart">🤍</i>
                        <i class="comment">💬</i>
                        <i>📤</i>
                    </div>
                    <div class="comment-section">
                        <ul class="comment-list">
                           
                                <li></li>
                           
                        </ul>
                        <input type="text" class="comment-input" placeholder="댓글을 입력하세요">
                        <button class="comment-btn">댓글 작성</button>
                    </div>
                </div>
            

            <!-- MY 챌린지 팝업 -->
            <div id="myChallengePopup" class="popup hidden">
                <h3>MY 챌린지</h3>
                <div>
                    <p>개인 챌린지</p>
                    
                        <button class="popup-button"></button>
                   

                    <p>그룹 챌린지</p>
                    
                        <button class="popup-button"></button>
                    
                </div>
            </div>
        </div>
    </div>

    <script src="./js/soloChRoom.js"></script>
</body>

</html>
