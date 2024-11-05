<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="./css/profile.css">
</head>

<body>
	<%
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response.sendRedirect("login.jsp");
	}
	Member_pointDAO pdao = new Member_pointDAO();
	
	%>
	<!-- Main Container -->
	<div class="container">
		<!-- Header -->
		<div class="header">
			<div class="logo">
				<img src="img/team-logo.png" alt="로고">
				<div class="nav-links">
					<a href="#">MY 챌린지</a> <a href="#">그룹 챌린지</a> <a href="#">개인
						챌린지</a>
				</div>
			</div>
			<div class="header-icons">
				<i class="fas fa-search"></i> <i class="fas fa-bell"></i>
				<button class="edit-profile-button" onClick="location.href='joinEdit.jsp'">회원정보 수정</button>
				<form action="logoutCon">
					<button class="logout-button">로그아웃</button>
				</form>
			</div>
		</div>

        <!-- Profile Section -->
        <div class="profile-section">
            <!-- Profile Picture and Edit Button -->
            <div class="profile-picture">
                <img src="img/chaechae-1.jpg" alt="Profile Image">
                <h2><%=member.getNick() %></h2>
                <button class="button-edit" onClick="location.href='profileEdit.jsp'">프로필 편집</button>
            </div>
            <!-- Stats and Intro Section -->
            <div class="stats-section">
                <div class="stats">
                    <div>
                        <p>챌린지 완료 횟수</p>
                        <span><%=member.getCh_suc_count() %>회</span>
                    </div>
                    <div>
                        <p>챌린지 완료 확률</p>
                        <%if(member.getCh_count() == 0) { %>
                        	<span>0%</span>
                        <%}else{ %>
                        <span><%=member.getCh_suc_count()/member.getCh_count() * 100 %>%</span>
                        <%} %>
                    </div>
                </div>
                <div class="intro-section">
                    <textarea rows="3" placeholder="여기에 소개글을 입력하세요." disabled><%= (member.getIntro() != null) ? member.getIntro() : "" %></textarea>
                </div>
                <div class="points-section">
                    <span>보유 포인트: 10000000원</span>
                    <button>포인트 충전</button>
                </div>

				<!-- Book Showcase Section (Moved under Points Section) -->
				<div class="book-showcase">
					<h3>MY BOOK</h3>
					<div class="book-list">
						<div class="book-item">
							<img src="img/pigbook-1.jfif" alt="돼지책">
							<p>돼지책</p>
						</div>
						<div class="book-item">
							<img src="img/pigbook-1.jfif" alt="돼지책">
							<p>돼지책</p>
						</div>
						<div class="book-item">
							<img src="img/pigbook-1.jfif" alt="돼지책">
							<p>돼지책</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Review Container -->
			<div class="review-container">
				<div class="review-buttons">
					<button onclick="showReview()">리뷰</button>
					<button onclick="showReviewCount()">작성 수</button>
				</div>
				<div id="review-content" class="review-content">
					<!-- 초기에는 리뷰 내용 표시 -->
					<p>여기에 리뷰 내용이 표시됩니다. 사용자는 스크롤을 통해 긴 리뷰 내용을 확인할 수 있습니다.</p>
					<p>리뷰 내용 예시: 이 책은 정말 재미있고, 가족 모두가 함께 즐길 수 있습니다....</p>
				</div>
			</div>
		</div>
		</div>

		<script src="./js/profile.js"></script>
</body>

</html>