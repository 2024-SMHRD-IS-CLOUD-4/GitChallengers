<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="joinCon" method="post">
		<h1>회원가입</h1>
		<span>아이디</span><br>
		<input type="text" name="id"><br>
		<span>비밀번호</span><br>
		<input type="password" name="pw"><br>
		<span>이름</span><br>
		<input type="text" name="name"><br>
		<span>닉네임</span><br>
		<input type="text" name="nickname"><br>
		<span>이메일</span><br>
		<input type="text" name="email"><br>
		<span>주소</span><br>
		<input type="text" name="address"><br>
		<span>나이</span><br>
		<input type="text" name="age"><br>
		<span>감명깊게 읽은 책</span><br>
		<input type="text" name="fav_book"><br>
		<span>전화번호</span><br>
		<input type="text" name="phoneNum"><br>
		<input type="submit" value="완료">
	</form>
</body>
</html>