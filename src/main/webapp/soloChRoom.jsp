<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인챌린지방</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>./css/개인챌린지방.css">
</head>

<body>
    <!-- 헤더 -->
    <div class="header">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/img/team-logo.png" alt="로고">
            <div class="nav-links">
                <a href="<%= request.getContextPath() %>/myChallenge">MY 챌린지</a>
                <a href="<%= request.getContextPath() %>/groupChallenge">그룹 챌린지</a>
                <a href="<%= request.getContextPath() %>/personalChallenge">개인 챌린지</a>
            </div>
        </div>
        <div class="header-icons">
            <i class="fas fa-search"></i>
            <!-- 사용자 환영 텍스트 추가 -->
            <% if (request.getAttribute("user") != null) { %>
                <a href="#" class="welcome-text"><%= ((User) request.getAttribute("user")).getName() %>님 환영합니다</a>
            <% } %>
            <button class="logout-button" onclick="location.href='<%= request.getContextPath() %>/logout'">로그아웃</button>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="profile-upload">
                <div class="profile-img" id="profilePreview"></div>
            </div>
            <div class="profile-name"><%= ((User) request.getAttribute("roomMaster")).getNickname() %></div>
            <button class="button" onclick="location.href='<%= request.getContextPath() %>/writeChallenge'">오늘의 챌린지 작성</button>
        </div>

        <!-- 카드 영역 -->
        <div class="card-container">
            <!-- 카드 리스트 -->
            <% 
                List<Member> groupMembers = (List<Member>) request.getAttribute("groupMembers");
                if (groupMembers != null) {
                    for (Member member : groupMembers) { 
            %>
                <div class="card">
                    <div class="card-content">
                        <div class="card-header">그룹원 <%= member.getName() %></div>
                        <div class="book-title"><%= member.getBookTitle() %></div>
                        <div class="page-info">페이지: <%= member.getStartPage() %>~<%= member.getEndPage() %>p</div>
                        <div class="content-placeholder"><%= member.getContent() %></div>
                    </div>
                    <div class="card-icons">
                        <i class="heart">🤍</i>
                        <i class="comment">💬</i>
                        <i>📤</i>
                    </div>
                    <div class="comment-section">
                        <ul class="comment-list">
                            <% 
                                List<Comment> comments = member.getComments();
                                if (comments != null) {
                                    for (Comment comment : comments) { 
                            %>
                                <li><%= comment.getText() %></li>
                            <% 
                                    } 
                                }
                            %>
                        </ul>
                        <input type="text" class="comment-input" placeholder="댓글을 입력하세요">
                        <button class="comment-btn">댓글 작성</button>
                    </div>
                </div>
            <% 
                    } 
                }
            %>

            <!-- MY 챌린지 팝업 -->
            <div id="myChallengePopup" class="popup hidden">
                <h3>MY 챌린지</h3>
                <div>
                    <p>개인 챌린지</p>
                    <% 
                        List<Challenge> personalChallenges = (List<Challenge>) request.getAttribute("personalChallenges");
                        if (personalChallenges != null) {
                            for (Challenge challenge : personalChallenges) { 
                    %>
                        <button class="popup-button"><%= challenge.getName() %></button>
                    <% 
                            } 
                        }
                    %>

                    <p>그룹 챌린지</p>
                    <% 
                        List<Challenge> groupChallenges = (List<Challenge>) request.getAttribute("groupChallenges");
                        if (groupChallenges != null) {
                            for (Challenge challenge : groupChallenges) { 
                    %>
                        <button class="popup-button"><%= challenge.getName() %></button>
                    <% 
                            } 
                        }
                    %>
                </div>
            </div>
        </div>
    </div>

    <script src="<%= request.getContextPath() %>./js/개인챌린지방.js"></script>
</body>

</html>
