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
			<h2><input type="text" placeholder="그룹 이름" name="group_name" required></h2>
			<input type="hidden" name = "manager" value = "<%=member.getId()%>">
			<input type="text" placeholder="부방장" name="sub_manager" id="sub_manager" required>
			<button type="button" id="idCheck">id 확인</button>
			<span id="idCheckResult"></span>
			<textarea placeholder="그룹 소개글" name="group_desc" required></textarea>
			<div class="button-group">
				<select name="days">
					<option value="7">7일</option>
					<option value="15">15일</option>
					<option value="30">30일</option>
				</select>
			</div>
			<button class="submit-button" >챌린지 그룹 생성</button>
		</form>
	</div>

	<script>
		$('#idCheck').on('click', () => {
			let input = $('#sub_manager').val();
			$.ajax({
				url : "idCheck",
				type : "get",
				data : {"input":input},
				success : function(data){
					if(data === 'true'){ 
						$("#idCheckResult").text("확인");
					}else { 
						$("#idCheckResult").text("등록되지 않은 id");
					}
				},
				error : function(){
					alert("통신실패")
				}
				
			})  		
		})
		
		
	</script>
</body>
</html>