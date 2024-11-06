<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 발생</title>
</head>
<body>
<h2>오류 발생</h2>
    <p><%= request.getAttribute("errorMessage") %></p>
    <a href="main.jsp">메인 페이지로 돌아가기</a>
</body>
</html>
