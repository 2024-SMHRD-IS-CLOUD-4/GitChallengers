<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Challenge Group List</title>
    <link rel="stylesheet" href="./css/soloChList.css">
</head>
<body>
    <!-- 헤더 -->
    <div class="header">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/img/team-logo.png" alt="로고">
            <div class="nav-links">
                <a href="#">MY 챌린지</a>
                <a href="#">그룹 챌린지</a>
                <a href="#">개인 챌린지</a>
            </div>
        </div>
        <div class="header-icons">
            <button class="create-group-btn">챌린지 만들기</button>
            <a href="#" class="welcome-text">
                <%= session.getAttribute("userName") != null ? session.getAttribute("userName") + "님 환영합니다" : "로그인 해주세요" %>
            </a>
            <button class="logout-button">로그아웃</button>
        </div>
    </div>

    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <!-- 그룹 카드 1 -->
        <div class="group-card">
            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="반장 프로필">
            </div>
            <div class="content">
                <h3>돼지책</h3>
                <div class="details">
                    현재 8일차 진행중!!<br>
                    <strong>14일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button">작성하기</button>
        </div>

        <!-- 그룹 카드 2 -->
        <div class="group-card">
            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="반장 프로필">
            </div>
            <div class="content">
                <h3>돼지책</h3>
                <div class="details">
                    현재 3일차 진행중!!<br>
                    <strong>10일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button">작성하기</button>
        </div>

        <!-- MY 챌린지 팝업 -->
        <div id="myChallengePopup" class="popup hidden">
            <h3>MY 챌린지</h3>
            <div>
                <p>개인 챌린지</p>
                <button class="popup-button">돼지책</button>
                <button class="popup-button">돼지책</button>
                <button class="popup-button">돼지책</button>

                <p>그룹 챌린지</p>
                <button class="popup-button">하루 한권 읽어요~</button>
                <button class="popup-button">하루 두권 읽어요~</button>
                <button class="popup-button">하루 두권 읽어요~</button>
            </div>
        </div>
    </div>

    <script src="./js/soloChList.js"></script>
</body>
</html>
