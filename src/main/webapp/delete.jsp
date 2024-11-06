<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">

<script type="text/javascript">
	// 에러 메시지가 있을 경우 alert을 띄운다
	<c:if test="${not empty errorMessage}">
	alert("${errorMessage}");
	</c:if>
</script>

<style>
/* 모달 배경 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}
/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 500px;
}
/* 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
/* 버튼 스타일 */
.modal-buttons {
	display: flex;
	justify-content: flex-end;
}

.modal-buttons button {
	padding: 10px 20px;
	margin: 0 10px;
	cursor: pointer;
}
</style>
</head>
<body>

	 <form id="deleteForm" action="deleteMemberCon" method="POST">
	<div class="form-group">
		<label for="id">아이디</label> <input type="text" name="id"> <label
			for="pw">비밀번호</label> <input type="password" name="pw">
		<button type="button" onclick="openConfirmModal()">확인</button>
	</div>

	 <!-- 탈퇴 확인 모달 -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>정말 탈퇴하시겠습니까?</h3>
            <div class="modal-buttons">
                <!-- 예 버튼을 눌렀을 때 폼 제출 -->
                <button type="button" onclick="submitForm()">예</button>
                <!-- 아니요 버튼을 눌렀을 때 모달 닫기 -->
                <button type="button" onclick="closeModal()">아니요</button>
            </div>
        </div>
    </div>
	</form>
	
	
	<script type="text/javascript">
		// 모달을 열기 위한 함수
		function openConfirmModal() {
			document.getElementById("confirmModal").style.display = "block";
		}

		// 모달을 닫기 위한 함수
		function closeModal() {
			document.getElementById("confirmModal").style.display = "none";
		}
		 // 폼을 실제로 제출하는 함수
	    function submitForm() {
	        document.getElementById("deleteForm").submit(); // 폼 제출
	    }
		
	</script>
	








</body>
</html>