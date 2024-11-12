<%@page import="com.smhrd.model.Member_info"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
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
    <style>
    body {
        font-family: 'BMJUA', sans-serif;
    }
</style>
</head>

<body>
		<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		Member_infoDAO infodao = new Member_infoDAO();
		Member_info member_info = infodao.info(member.getId()); // 회원 정보 가져오기
		%>
    <div class="profile-container">
    	<form action="updateProfile" method="post" enctype="multipart/form-data">
    	<input type="hidden" name = "id" value = "<%=member.getId()%>">
        <h2>프로필 편집</h2>
        <!-- 뒤로가기 버튼 -->
        <div class="back-button" onclick="goBack()">←</div>

        <!-- 프로필 사진 변경 영역 -->
        <div class="profile-pic" onclick="document.getElementById('profileInput').click()">
            프로필 사진 변경
            <input type="file" id="profileInput" accept="image/*" onchange="previewImage(event)" name="profile_img">
        </div>

        <div class="form-group">
            <label for="nickname">닉네임</label>
            <!-- 서버에서 닉네임을 받아서 표시하는 부분 -->
            <input type="text" id="nickname" name="nick" value="<%=member.getNick()%>" disabled>
        </div>

        <div class="form-group">
            <label for="intro">소개</label>
            <!-- 서버에서 소개를 받아서 표시하는 부분 -->
            <textarea id="intro" placeholder="자기소개를 입력하세요" name="intro"><%= (member_info.getIntro() != null) ? member_info.getIntro() : "" %></textarea>
        </div>
        
        <!-- 저장 완료 버튼 -->
        <button type="submit" class="save-button">저장완료</button>
        </form>
    </div>

    <script src="./js/profileEdit.js"></script>
</body>

</html>
