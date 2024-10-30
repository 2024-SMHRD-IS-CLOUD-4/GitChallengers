<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/grChMain.css">
<body>
<%
	Member member = (Member) session.getAttribute("member");
	GroupDAO dao = new GroupDAO();
	List<Group> list = dao.selectAll();
%>
    <!-- 헤더 -->
    <div class="header">
        <div class="title">
            <img src="img/team-logo.png" alt="logo">
            <span><%=member.getNick()%>님 환영합니다!</span>
        </div>
        
        <!-- 검색창 -->
        <div class="search-bar">
            <input type="text" placeholder="검색어를 입력하세요">
        </div>

        <button class="create-group-btn" onClick="location.href='groupCh.jsp'">그룹 만들기</button>
    </div>



    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <!-- 그룹 카드 1 -->
        <div class="group-card">
            <div class="profile">
                <img src="#" alt="반장 프로필">
                <span>반장 이름</span>
            </div>
            <div class="content">
                <h3>하루 한권 읽어요</h3>
                <p>1일 1리뷰 필수!!!</p>
                <div class="details">
                    현재 참가인원 10/15명<br>
                    <strong>14일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button">참가하기</button>
        </div>

        <!-- 그룹 카드 2 -->
        <div class="group-card">
            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="반장 프로필">
                <span>반장 이름</span>
            </div>
            <div class="content">
                <h3>그룹 이름</h3>
                <p>그룹 설명</p>
                <div class="details">
                    현재 참가인원 8/20명<br>
                    <strong>10일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button">참가하기</button>
        </div>

        <!-- 그룹 카드 3 -->
        <div class="group-card">
            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="반장 프로필">
                <span>반장 이름</span>
            </div>
            <div class="content">
                <h3>그룹 이름</h3>
                <p>그룹 설명</p>
                <div class="details">
                    현재 참가인원 12/20명<br>
                    <strong>5일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button">참가하기</button>
        </div>

        <!-- 그룹 카드 4 -->
        <div class="group-card">
            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="반장 프로필">
                <span>반장 이름</span>
            </div>
            <div class="content">
                <h3>그룹 이름</h3>
                <p>그룹 설명</p>
                <div class="details">
                    현재 참가인원 15/15명<br>
                    <strong>1일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button">참가하기</button>
        </div>
    </div>
</body>
</html>