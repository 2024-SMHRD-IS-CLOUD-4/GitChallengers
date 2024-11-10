<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reading Post</title>
    <link rel="stylesheet" href="./css/review.css">
</head>

<body>
<script src="js/jquery-3.7.1.min.js"></script>
<%
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
%>
    <div class="card">
        <!-- Back Button -->
        <button class="back-button" onclick="history.back()">←</button>

        <span id="proveResult"></span>
	<form action="review" method="post">
        <div class="title-container">
            <input type="text" class="title" placeholder="리뷰 제목" name="review_title">
            <input type="hidden" name = "is_approved" value="N" id="is_approved">
            <!-- 초록색 체크 표시 -->
            <span id="checkmark" style="display: none;">✅</span>
        </div>

        <!-- Label for Image Upload -->
        <label for="file-input">
            <img id="preview-image" src="https://via.placeholder.com/150x120" alt="Upload Image" name="review_ocr">
        </label>
        <input type="file" id="file-input" accept="image/*" onchange="previewImage(event)">

        <!-- 줄거리와 느낀점 -->
        <textarea class="summary" placeholder="내용" name="review_content"></textarea>

        <div class="footer">
            <div class="toggle-buttons">
                <button id="personal-button" onclick="toggleSelection('personal')">추천</button>
                <button id="group-button" onclick="toggleSelection('group')">비추천</button>
            </div>
			<!-- ISBN 입력칸 -->
			<div class="isbn-container">
			    <input type="text" id="isbn-input" placeholder="ISBN 입력">
			    <button id="isbn-check-button">인증 확인</button>
			</div>
            <!-- 글 작성 버튼 -->
            <button class="action-button">리뷰 작성</button>
        </div>
    	</form>
    </div>

<script src="./js/review.js"></script>
<script type="text/javascript">
$(document).on('click', '.prove', function() {
	var input = $('#isbn').val();
	
	$.ajax({
		url : "SearchAPIServlet",
		type : "post",
		data : {isbn: input},
		success : function(data){
			if (data && data.items && data.items.length > 0) { // 데이터가 있으면
				var book = data.items[0];
				if(book.isbn == input){
					$('#proveResult').text("인증성공");
					$('#is_approved').val("Y");
				}
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