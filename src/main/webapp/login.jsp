<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginController" method="post">
		<h1>로그인</h1>
		<span>아이디</span><br>
		<input type="text" name="id"><br>
		<span>비밀번호</span><br>
		<input type="password" name="pw"><br>
		<input type="submit" value="로그인">
		<button type="button" onClick="location.href='join.jsp'">회원가입</button>
	</form>
</body>
</html>