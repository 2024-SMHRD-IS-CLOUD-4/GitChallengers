<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reading Post</title>
    <link rel="stylesheet" href="./css/review.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    body {
        font-family: 'BMJUA', sans-serif;
    }
</style>
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

	<form action="review" method="post" onsubmit="return confirmReviewSubmission()" enctype="multipart/form-data">
        <div class="title-container">
            <input type="text" class="title" placeholder="리뷰 제목" name="review_title">
            <input type="hidden" name = "is_approved" value="N" id="is_approved">
        </div>

        <!-- Label for Image Upload -->
        <label for="file-input">
            <img id="preview-image" src="https://via.placeholder.com/150x120" alt="Upload Image" name="review_ocr">
        </label>
        <input type="file" id="file-input" accept="image/*" onchange="previewImage(event)">

        <!-- 줄과리와 느기진 -->
        <textarea class="summary" placeholder="내용" name="review_content"></textarea>

        <div class="footer">
            <div class="toggle-buttons">
                <button type="button" id="personal-button" onclick="toggleSelection('personal'); setRecommendValue(1);">추천</button>
                <button type="button" id="group-button" onclick="toggleSelection('group'); setRecommendValue(0);">비추천</button>
                <input type="hidden" id="setrecommend" name="review_heart" value="0">
            </div>
			<!-- ISBN 입력칸 -->
			<div class="isbn-container">
			    <button type="button" id="ocr-check-button" onClick="location.href='ocr.jsp'">OCR 인증</button>
			    <input type="text" id="isbn" placeholder="ISBN 입력">
			    <button type="button" class="prove" id="isbn-check-button">ISBN 인증</button>
			    <span id="proveResult"></span>
			    <span id="success-icon" class="success-icon" style="display: none;"><i class="fas fa-check"></i></span>
			</div>
            <!-- 글 작성 버튼 -->
            <button type="submit" class="action-button">리뷰 작성</button>
        </div>
    	</form>
    </div>

<script src="./js/review.js"></script>
<script type="text/javascript">
function setRecommendValue(actionValue) {
    document.getElementById('setrecommend').value = actionValue;
  }


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
					$('#proveResult').text("인증성공").css({"color": "green", "font-weight": "bold"}); // Set text color to green on success
					$('#is_approved').val("Y");
					$('#success-icon').css("color", "green").show(); // Show the success icon
				}else {
					$('#proveResult').text("인증 실패").css({"color": "red", "font-weight": "bold"}); // Set text color to red on failure
					$('#success-icon').hide(); // Hide the success icon if failed
					alert('인증 실패');
				}
			} else {
				$('#proveResult').text("인증 실패").css({"color": "red", "font-weight": "bold"}); // Set text color to red on failure
				$('#success-icon').hide(); // Hide the success icon if failed
				alert('인증 실패');
			}
		},
		error : function(){
			alert("통신실패")
		}
	})  		
})

function confirmReviewSubmission() {
    if (confirm('리뷰 작성 후에는 수정이 불가능합니다. 리뷰을 작성하시겠습니까?')) {
        return true;
    } else {
        alert('리뷰 작성을 취소했습니다.');
        return false;
    }
}
</script>
</body>

</html>
