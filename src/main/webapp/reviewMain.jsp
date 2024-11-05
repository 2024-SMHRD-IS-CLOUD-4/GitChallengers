<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="#">리뷰</a>
                </div>
            </div>
            <div class="header-icons">
                <i class="fas fa-search"></i>
                <i class="fas fa-bell"></i>
                <a href="#" class="welcome-text">사용자님 환영합니다</a>
                <button class="logout-button">로그아웃</button>
            </div>
        </div>
        
        <!-- Card Section -->
        <c:forEach var="review" items="${reviews}">
            <div class="card">
                <img src="${review.imageUrl}" alt="Book Image">
                <div class="card-content">
                    <div class="card-title">${review.title} ✅</div>
                    <div class="card-body">${review.body}</div>
                </div>
                <div class="card-stats">
                    <c:choose>
                        <c:when test="${review.recommendation == 'positive'}">
                            <span class="recommendation positive">추천해요!</span><br>
                        </c:when>
                        <c:otherwise>
                            <span class="recommendation negative">추천하지 않아요!</span><br>
                        </c:otherwise>
                    </c:choose>
                    좋아요 ${review.likes}개<br>
                    댓글 ${review.comments}개
                </div>
            </div>
        </c:forEach>
        
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
