<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<header>
		<form action="#">
				<input type="search" id="keyword" name="keyword">
				<input type="submit" value="검색">
		</form>
		<button type="button" onClick="#">마이프로필</button>
		<button type="button" onClick="loaction.href='logoutCon'">로그아웃</button>
	</header>
		
	<button type="button" onClick="#">나의 챌린지</button>
	<button type="button" onClick="#">그룹 챌린지</button>
	<button type="button" onClick="#">챌린지 작성</button>
	<div>진행중인 챌린지</div>
	<div>챌린지 현황</div>
	<button type="button" onClick="#">베스트 셀러</button>
	<button type="button" onClick="#">도서 물품</button>
	<button type="button" onClick="#">도서리뷰 작성</button>
	
	
</body>
</html>