<%@page import="com.smhrd.model.Member"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 설정</title>
    <link rel="stylesheet" href="./css/profileEdit.css">
</head>

<body>
		<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		%>
    <div class="profile-container">
        <h2>프로필 편집</h2>
        <!-- 뒤로가기 버튼 -->
        <div class="back-button" onclick="goBack()">←</div>

        <!-- 프로필 사진 변경 영역 -->
        <div class="profile-pic" onclick="document.getElementById('profileInput').click()">
            프로필 사진 변경
            <input type="file" id="profileInput" accept="image/*" onchange="previewImage(event)">
        </div>

        <div class="form-group">
            <label for="nickname">닉네임</label>
            <!-- 서버에서 닉네임을 받아서 표시하는 부분 -->
            <input type="text" id="nickname" value="<%= (request.getAttribute("nickname") != null) ? request.getAttribute("nickname") : "" %>" placeholder="8글자 이내">
        </div>

        <div class="form-group">
            <label for="intro">소개</label>
            <!-- 서버에서 소개를 받아서 표시하는 부분 -->
            <textarea id="intro" placeholder="자기소개를 입력하세요"><%= (request.getAttribute("intro") != null) ? request.getAttribute("intro") : "" %></textarea>
        </div>
        
        <!-- 저장 완료 버튼 -->
        <button class="save-button" disabled>저장완료</button>
    </div>

    <script src="./js/profileEdit.js"></script>
</body>

</html>
