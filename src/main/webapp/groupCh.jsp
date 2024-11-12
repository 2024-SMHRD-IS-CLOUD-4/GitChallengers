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
	%>

	<div class="form-container">

    <form action="groupCon" method="post" id="groupForm">
        <h2><input type="text" placeholder="그룹 이름" name="group_name" required></h2>
        <input type="hidden" name="manager" value="<%= member.getId() %>">
        <input type="text" placeholder="부방장" name="sub_manager" id="sub_manager" required>
        <button type="button" id="idCheck">ID 확인</button>
        <span id="idCheckResult"></span>
        <textarea placeholder="그룹 소개글" name="group_desc" required></textarea>
        <div class="button-group">
            <select name="days">
                <option value="7">7일</option>
                <option value="15">15일</option>
                <option value="30">30일</option>
            </select>
        </div>
        <button type="button" class="submit-button" onclick="confirmPoints()">챌린지 그룹 생성</button>
    </form>
</div>

		

<!-- 포인트 소모 확인 모달 -->
<div id="pointsModal" class="modal">
    <div class="modal-content">
        <h2>포인트 소모 확인</h2>
        <p>이 그룹 챌린지를 생성하면 1000포인트가 소모됩니다. 계속하시겠습니까?</p>
        <button id="confirmBtn">확인</button>
        <button id="cancelBtn">취소</button>
    </div>
</div>
<script type="text/javascript">
// 모달 관련 요소
var modal = document.getElementById("pointsModal");
var confirmBtn = document.getElementById("confirmBtn");
var cancelBtn = document.getElementById("cancelBtn");

// 포인트 소모 확인 함수
function confirmPoints() {
    // 모달 띄우기
    modal.style.display = "block";
}

// 확인 버튼 클릭 시 폼 제출
confirmBtn.onclick = function() {
    // 폼 제출
    document.getElementById("groupForm").submit();
    modal.style.display = "none"; // 모달 숨기기
}

// 취소 버튼 클릭 시 모달 숨기기
cancelBtn.onclick = function() {
    modal.style.display = "none";
}

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>
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
						$("#idCheckResult").text("등록되지 않은 ID");
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
				alert('부방장 ID 확인이 필요합니다.');
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
