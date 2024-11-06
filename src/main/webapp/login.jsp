<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>
	<div class="login-container">
	    <h2>로그인</h2>
	    <div class="logo-container">
	        <img src="img/team-logo.png" alt="로고" class="site-logo">
	    </div>
	    <form action="loginCon" method="post">
	        <div class="form-group">
	            <label for="id">아이디</label>
	            <input type="text" name="id">
	        </div>
	        <div class="form-group">
	            <label for="pw">비밀번호</label>
	            <input type="password" name="pw">
	        </div>
	        
	        <div class="button-container">
	            <button type="submit" class="login-button">로그인</button>
	            <button type="button" class="signup-button" onClick="location.href='join.jsp'">회원가입</button>
	        </div>
	    </form>
	</div>
</body>
</html>