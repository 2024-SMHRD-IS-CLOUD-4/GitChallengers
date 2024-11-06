<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/pReview.css">
    <title>책 리뷰</title>
    <script src="./js/pReview.js"></script>
</head>
<body>
    <div class="review-card">
        <div class="back-button">⬅</div>
        <div class="profile">
            <img src="<%= request.getContextPath() %>/img/chaechae-1.jpg" alt="프로필">
            <div class="author">작성자 닉네임</div>
        </div>
        <div class="title">제목</div>
        <img src="<%= request.getContextPath() %>/img/pigbook-1.jfif" alt="책">
        <div class="content">리뷰 내용</div>
        <div class="actions">
            <span class="like">❤</span>
            <span class="like-count">좋아요 10개</span>
            <span class="comment">💬</span>
            <span class="comment-count">댓글 0개</span>
        </div>
        <div class="comment-input" style="display: none;">
            <textarea rows="3" placeholder="댓글을 작성해주세요..."></textarea>
            <button>댓글 작성</button>
        </div>
        <div class="comments-section"></div>
    </div>
</body>
</html>