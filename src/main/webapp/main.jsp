<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/main.css">
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	
    <!-- 헤더 -->
    <div class="header">
        <div class="title">
            <img src="img/team-logo.png" alt="logo">
            <span><%=member.getNick()%>님 환영합니다!</span>
        </div>
        
        <!-- 검색창 -->
        <div class="search-bar">
        	<form action="#">
	            <input type="text" placeholder="검색어를 입력하세요" id="keyword" name="keyword">
        		<input type="submit" value="검색">
        	</form>
        </div>

        <div class="actions">
            <button onClick="location.href='propile.jsp'">마이프로필</button>
            <form action="logoutCon">
            	<button style="background-color: #E57B7B;">로그아웃</button>            
            </form>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="group-box">
                <button onClick="location.href='myCh.jsp'">나의 챌린지</button>
                <button onClick="location.href='groupChList.jsp'">그룹 챌린지</button>
                <button onClick="location.href='chWrite.jsp'">챌린지 작성</button>
            </div>
        </div>

        <!-- 메인 패널 -->
        <div class="main-panel">
            <!-- 진행중인 챌린지 리스트 -->
            <div class="challenge-list">
                <h3>진행중인 챌린지</h3>
                <p>여기에 진행 중인 챌린지 리스트가 표시됩니다.</p>
            </div>

            <!-- 진행 상황 및 완료 확률 -->
            <div class="progress-panel">
                <h3>챌린지 진행 상황</h3>
                <div class="progress-bar">
                    <span class="progress-label">현재 챌린지 진행 상황</span>
                    <div class="progress-container">
                        <div class="progress" style="width: 70%;"></div>
                    </div>
                </div>
                <div class="progress-bar">
                    <span class="progress-label">챌린지 완료 확률</span>
                    <div class="progress-container">
                        <div class="progress" style="width: 50%;"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 오른쪽 사이드바 -->
        <div class="rightbar">
            <div class="group-box">
                <button>베스트 셀러</button>
                <button>도서 물품</button>
                <button>도서리뷰 작성</button>
            </div>
        </div>
    </div>
	
	
</body>
</html>