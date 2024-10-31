<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Challenge and Shop Page</title>
    <link rel="stylesheet" href="./css/maintest.css">
</head>
<body>

    <!-- 헤더 -->
    <header>
        <div class="logo">
            <img src="<%=request.getContextPath()%>/img/team-logo.png" alt="Logo"> <!-- 로고 이미지 -->
        </div>
        <div class="menu">
            <a href="#">챌린지</a>
            <a href="#">챌린지</a>
            <a href="#">info</a>
            <span class="icon">🔍</span>
            <div class="profile-photo">
                <img src="<%=request.getContextPath()%>/img/chaechae-1.jpg" alt="Profile Photo">
            </div>
            <span class="icon">🔔</span>
            <button class="button">로그아웃</button>
        </div>
    </header>

    <!-- 메인 컨텐츠 -->
    <div class="container">
        <!-- 상단 챌린지 정보 및 상태 -->
        <div class="top-section">
            <div class="challenge">
                <h2>진행중인 챌린지</h2>
                <div style="height: 250px; background-color: #fff; border-radius: 5px;"></div>
            </div>
            <div class="status">
                <h2>현재 챌린지 진행 상황</h2>
                <div class="progress-chart">
                    <div class="progress-circle" data-progress="70"></div>
                    <span class="progress-text">70%</span>
                </div>
                <h2>챌린지 완료 확률</h2>
                <div class="progress-chart">
                    <div class="progress-circle" data-progress="50"></div>
                    <span class="progress-text">50%</span>
                </div>
            </div>
        </div>

        <!-- 리더보드 및 빈 네모 칸 -->
        <div class="bottom-section-wrapper">
            <div class="leaderboard-section">
                <h2>LEADERBOARD</h2>
                <div class="leaderboard-item-wrapper">
                    <img src="<%=request.getContextPath()%>/img/chaechae-1.jpg" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name">이름</span>
                        <span class="points">포인트</span>
                    </div>
                </div>
                <div class="leaderboard-item-wrapper">
                    <img src="https://via.placeholder.com/40" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name">이름</span>
                        <span class="points">포인트</span>
                    </div>
                </div>
                <div class="leaderboard-item-wrapper">
                    <img src="https://via.placeholder.com/40" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name">이름</span>
                        <span class="points">포인트</span>
                    </div>
                </div>
            </div>
            <div class="empty-section"></div>
        </div>

        <!-- 하단 베스트셀러 및 상품 목록 -->
        <div class="bottom-section">
            <h2>Best Seller</h2>
            <div class="products">
                <div class="product-item">
                    <img src="<%=request.getContextPath()%>/img/pigbook-1.jfif" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%=request.getContextPath()%>/img/harry-porter.jfif" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="product-item">
                    <img src="https://via.placeholder.com/100" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="product-item">
                    <img src="https://via.placeholder.com/100" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="product-item">
                    <img src="https://via.placeholder.com/100" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
            </div>

            <!-- 굿즈 섹션 -->
            <h2>Goods</h2>
            <div class="goods">
                <div class="goods-item">
                    <img src="<%=request.getContextPath()%>/img/book-holder.jpg" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="goods-item">
                    <img src="<%=request.getContextPath()%>/img/book-marker.jfif" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="goods-item">
                    <img src="https://via.placeholder.com/100" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="goods-item">
                    <img src="https://via.placeholder.com/100" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="goods-item">
                    <img src="https://via.placeholder.com/100" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
            </div>
        </div>
    </div>

    <script src="<%=request.getContextPath()%>/scripts.js"></script>
</body>
</html>
