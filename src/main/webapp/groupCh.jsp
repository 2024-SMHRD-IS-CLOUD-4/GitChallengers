<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/groupCh.css">
<script src="js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		
	%>

	<div class="form-container">
		<form action="groupCon" method="post">
			<h2><input type="text" placeholder="그룹 이름" name="group_name"></h2>
			<input type="text" placeholder="인원수 (최대 15인)" name="group_max">
			<input type="hidden" name = "manager" value = "<%=member.getId()%>">
			<input type="text" placeholder="부방장" name="sub_manager" id="sub_manager">
			<textarea placeholder="그룹 소개글" name="group_desc"></textarea>
			<div class="button-group">
				<select>
					<option>7일</option>
					<option>15일</option>
					<option>30일</option>
				</select>
			</div>
			<button class="submit-button" >챌린지 그룹 생성</button>
		</form>
	</div>

	<script>

	</script>
</body>
</html>