<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reading Post</title>
    <link rel="stylesheet" href="./css/review.css">
</head>

<body>
<%
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
%>
	<form action="review" >
    <div class="card">
        <!-- Back Button -->
        <button class="back-button" onclick="history.back()">←</button>

        <div class="title-container">
            <input type="text" class="title" placeholder="리뷰 제목" name="review_title">
            <input type="hidden" name = "id" value = "<%=member.getId()%>">
            <!-- 초록색 체크 표시 -->
            <span id="checkmark" style="display: none;">✅</span>
        </div>

        <!-- Label for Image Upload -->
        <label for="file-input">
            <img id="preview-image" src="https://via.placeholder.com/150x120" alt="Upload Image">
        </label>
        <input type="file" id="file-input" accept="image/*" onchange="previewImage(event)">

        <!-- 줄거리와 느낀점 -->
        <textarea class="summary" placeholder="내용" name="review_content"></textarea>

        <div class="footer">
            <div class="toggle-buttons">
                <button id="personal-button" onclick="toggleSelection('personal')">추천</button>
                <button id="group-button" onclick="toggleSelection('group')">비추천</button>
                <!-- 추천할 대상 입력 칸 -->
                <input type="text" class="recommendation-target" placeholder="추천 대상">
            </div>

            <!-- 인증사진첨부 버튼 -->
            <button id="auth-upload-button" onclick="document.getElementById('auth-file-input').click()">인증사진첨부</button>
            <input type="file" id="auth-file-input" accept="image/*" style="display: none;" onchange="previewAuthImage(event)" name="review_ocr">

            <!-- 글 작성 버튼 -->
            <button class="action-button">리뷰 작성</button>
        </div>
    </div>
    </form>

    <script src="./js/review.js"></script>

</body>

</html>