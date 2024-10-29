<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" href="./css/join.css">
<script src="js/jquery-3.7.1.min.js"></script>
<div class="signup-container">
    <h2>회원가입</h2>
    <form action="joinCon" method="post">
        <div class="form-group">
            <label for="username">아이디</label>
            <input type="text" id="input" name="id">
            <button type="button" class="idCheck" id="idCheck">중복 확인</button>
            <span id="idCheckResult"></span>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="pw" name="pw" oninput="pwC()">
        </div>
        <div class="form-group">
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="pwCheck" name="confirm-password" oninput="pwC()">
            <span id="pwCheckResult"></span>
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email">
            <select>
                <option>@gmail.com</option>
                <option>@naver.com</option>
                <option>@daum.com</option>
                <option>@kakao.com</option>
                <!-- 필요에 따라 옵션 추가 -->
            </select>
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" id="address" name="addr">
        </div>
        <div class="form-group">
            <label for="favorite-book">감명깊게 읽은책</label>
            <textarea id="favorite-book" name="fav_book"></textarea>
        </div>
        <button type="submit" class="signup-button">회원가입 완료</button>
    </form>
    <script>
    	// 아이디 중복 확인
    	$('#idCheck').on('click', () => {
    		let input = $('#input').val();
    		$.ajax({
    			url : "idCheck",
    			type : "get",
    			data : {"input":input},
    			success : function(data){
					if(data === 'true'){ 
						$("#idCheckResult").text("사용할 수 없는 아아디");
					}else { 
						$("#idCheckResult").text("사용할 수 있는 아아디");
					}
				},
				error : function(){
					alert("통신실패")
				}
    			
    		})  		
    	})
    	// 비밀번호 확인
    	const pwC = () => {
	    	if ($('#pw').val() == $('#pwCheck').val()) {
	    		$('#pwCheckResult').text('비밀번호 일치')
	    	}else {
	    		$('#pwCheckResult').text('비밀번호 불일치')
	    	}    		
    	}
    </script>
</div>
</body>
</html>