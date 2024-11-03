<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Challenge and Shop Page</title>
    <link rel="stylesheet" href="./css/maintest.css">
</head>

<body>

    <!-- Main Container -->
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="logo">
                <img src="img/team-logo.png" alt="로고">
                <div class="nav-links">
                    <a href="#">MY 챌린지</a>
                    <a href="#">그룹 챌린지</a>
                    <a href="#">개인 챌린지</a>
                </div>
            </div>
            <div class="header-icons">
                <i class="fas fa-search search-icon">🔍</i>
                <i class="fas fa-bell notification-icon">🔔</i>
                <a href="#" class="welcome-text"><%= request.getAttribute("userName") != null ? request.getAttribute("userName") : "사용자님" %> 환영합니다</a>
                <button class="logout-button" onclick="location.href='logout.jsp'">로그아웃</button>
            </div>
        </div>
        
        <!-- 상단 챌린지 정보 및 상태 -->
        <div class="top-section">
            <div class="challenge">
                <h2>진행중인 챌린지</h2>
                <div style="height: 250px; background-color: #fff; border-radius: 5px;"></div>
            </div>
            <div class="status">
                <h2>현재 챌린지 진행 상황</h2>
                <div class="progress-chart">
                    <div class="progress-circle" data-progress="<%= request.getAttribute("challengeProgress") %>"></div>
                    <span class="progress-text"><%= request.getAttribute("challengeProgress") %>%</span>
                </div>
                <h2>챌린지 완료 확률</h2>
                <div class="progress-chart">
                    <div class="progress-circle" data-progress="<%= request.getAttribute("completionProbability") %>"></div>
                    <span class="progress-text"><%= request.getAttribute("completionProbability") %>%</span>
                </div>
            </div>
        </div>

        <!-- 리더보드 및 빈 네모 칸 -->
        <div class="bottom-section-wrapper">
            <div class="leaderboard-section">
                <h2>LEADERBOARD</h2>

                <!-- 리더보드 데이터 수동 삽입 -->
                <div class="leaderboard-item-wrapper">
                    <img src="<%= request.getAttribute("leaderImage1") != null ? request.getAttribute("leaderImage1") : "img/chaechae-1.jpg" %>" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name"><%= request.getAttribute("leaderName1") != null ? request.getAttribute("leaderName1") : "이름" %></span>
                        <span class="points"><%= request.getAttribute("leaderPoints1") != null ? request.getAttribute("leaderPoints1") : "포인트" %></span>
                    </div>
                </div>
                <div class="leaderboard-item-wrapper">
                    <img src="<%= request.getAttribute("leaderImage2") != null ? request.getAttribute("leaderImage2") : "img/chaechae-1.jpg" %>" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name"><%= request.getAttribute("leaderName2") != null ? request.getAttribute("leaderName2") : "이름" %></span>
                        <span class="points"><%= request.getAttribute("leaderPoints2") != null ? request.getAttribute("leaderPoints2") : "포인트" %></span>
                    </div>
                </div>
                <div class="leaderboard-item-wrapper">
                    <img src="<%= request.getAttribute("leaderImage3") != null ? request.getAttribute("leaderImage3") : "img/chaechae-1.jpg" %>" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name"><%= request.getAttribute("leaderName3") != null ? request.getAttribute("leaderName3") : "이름" %></span>
                        <span class="points"><%= request.getAttribute("leaderPoints3") != null ? request.getAttribute("leaderPoints3") : "포인트" %></span>
                    </div>
                </div>
            </div>
            <div class="empty-section"></div>
        </div>

        <!-- 하단 베스트셀러 및 상품 목록 -->
        <div class="bottom-section">
            <h2>Best Seller</h2>
            <div class="products">
                <!-- 베스트셀러 수동 삽입 -->
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage1") != null ? request.getAttribute("bestSellerImage1") : "img/pigbook-1.jfif" %>" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage2") != null ? request.getAttribute("bestSellerImage2") : "img/harry-porter.jfif" %>" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
            </div>

            <!-- 굿즈 섹션 -->
            <h2>Goods</h2>
            <div class="goods">
                <!-- 굿즈 아이템 수동 삽입 -->
                <div class="goods-item">
                    <img src="<%= request.getAttribute("goodsImage1") != null ? request.getAttribute("goodsImage1") : "img/book-holder.jpg" %>" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="goods-item">
                    <img src="<%= request.getAttribute("goodsImage2") != null ? request.getAttribute("goodsImage2") : "img/book-marker.jfif" %>" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
            </div>

            <!-- MY 챌린지 팝업 -->
            <div id="myChallengePopup" class="popup hidden">
                <h3>MY 챌린지</h3>
                <div>
                    <p>개인 챌린지</p>
                    <button class="popup-button"><%= request.getAttribute("personalChallenge1") != null ? request.getAttribute("personalChallenge1") : "돼지책" %></button>
                    <button class="popup-button"><%= request.getAttribute("personalChallenge2") != null ? request.getAttribute("personalChallenge2") : "돼지책" %></button>
                    <button class="popup-button"><%= request.getAttribute("personalChallenge3") != null ? request.getAttribute("personalChallenge3") : "돼지책" %></button>

                    <p>그룹 챌린지</p>
                    <button class="popup-button"><%= request.getAttribute("groupChallenge1") != null ? request.getAttribute("groupChallenge1") : "하루 한권 읽어요~" %></button>
                    <button class="popup-button"><%= request.getAttribute("groupChallenge2") != null ? request.getAttribute("groupChallenge2") : "하루 두권 읽어요~" %></button>
                    <button class="popup-button"><%= request.getAttribute("groupChallenge3") != null ? request.getAttribute("groupChallenge3") : "하루 두권 읽어요~" %></button>
                </div>
            </div>
        </div>
    </div>
    <script src="./js/maintest.js"></script>

</body>

</html>
