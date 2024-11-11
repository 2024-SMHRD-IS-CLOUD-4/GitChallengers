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
		<form action="groupCon" method="post" id="groupForm">
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
			<button type="button" class="submit-button" id="createGroup">챌린지 그룹 생성</button>
		</form>
	</div>

	<script>
		let idCheckPassed = false;

		$('#idCheck').on('click', () => {
			let input = $('#sub_manager').val();
			$.ajax({
				url : "idCheck",
				type : "get",
				data : {"input":input},
				success : function(data){
					if(data === 'true'){ 
						$("#idCheckResult").text("확인");
						idCheckPassed = true;
					}else { 
						$("#idCheckResult").text("등록되지 않은 id");
						idCheckPassed = false;
					}
				},
				error : function(){
					alert("통신실패")
				}
			})  		
		})

		$('#createGroup').on('click', () => {
			if (!idCheckPassed) {
				alert('부방장 id 확인이 필요합니다.');
				return;
			}

			if(confirm('챌린지를 생성하시겠습니까?')) {
				$('#groupForm').submit();
			} else {
				// 챌린지 생성 취소
				alert('챌린지 생성이 취소되었습니다.');
			}
		});
	</script>
</body>
</html>
