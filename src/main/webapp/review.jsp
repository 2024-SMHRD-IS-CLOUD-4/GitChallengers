<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reading Post</title>
    <link rel="stylesheet" href="./css/review.css">
</head>

<body>

    <div class="card">
        <!-- Back Button -->
        <button class="back-button" onclick="history.back()">←</button>

        <div class="title-container">
            <input type="text" class="title" placeholder="리뷰 제목">
            <!-- 초록색 체크 표시 -->
            <span id="checkmark" style="display: none;">✅</span>
        </div>

        <!-- Label for Image Upload -->
        <label for="file-input">
            <img id="preview-image" src="https://via.placeholder.com/150x120" alt="Upload Image">
        </label>
        <input type="file" id="file-input" accept="image/*" onchange="previewImage(event)">

        <!-- 줄거리와 느껴지지 -->
        <textarea class="summary" placeholder="내용"></textarea>
        <textarea class="impressions" placeholder="느껴지"></textarea>

        <div class="footer">
            <!-- 인증사진첨부 버튼 -->
            <button id="auth-upload-button" onclick="document.getElementById('auth-file-input').click()">인증사진첨부</button>
            <input type="file" id="auth-file-input" accept="image/*" style="display: none;" onchange="previewAuthImage(event)">

            <!-- 추천/비추천 버튼 -->
            <div class="toggle-buttons">
                <button id="personal-button" onclick="toggleSelection('personal')">추천</button>
                <button id="group-button" onclick="toggleSelection('group')">비추천</button>
            </div>

            <!-- 글 작성 버튼 -->
            <button class="action-button">리뷰 작성</button>
        </div>
    </div>

    <script src="./js/review.js"></script>

</body>

</html>
