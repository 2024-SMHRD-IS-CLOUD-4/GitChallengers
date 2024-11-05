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
<div class="container">
    <h2>회원가입</h2>
    <form action="joinCon" method="post" name="frm">
    	<div class="form-group">
			<label for="name">이름 *</label>
			<input type="text" name="name" required>
        </div>
        <div class="form-group">
			<label for="nick">닉네임 *</label>
			<input type="text" name="nick" required>
        </div>
        <div class="form-group">
            <label for="id">아이디 *</label>
            <input type="text" id="input" name="id" required>
            <button type="button" class="idCheck" id="idCheck">중복 확인</button>
            <span id="idCheckResult"></span>
        </div>
        <div class="form-group">
            <label for="password">비밀번호 *</label>
            <input type="password" id="pw" name="pw" oninput="pwC()" required>
        </div>
        <div class="form-group">
            <label for="confirm-password">비밀번호 확인 *</label>
            <input type="password" id="pwCheck" name="confirm-password" oninput="pwC()" required>
            <span id="pwCheckResult"></span>
        </div>
        <div class="form-group">
            <label for="phone">휴대폰번호 *</label>
            <input type="tel" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="email">이메일 *</label>
                <div class="email-group">
                	
                    <input type="text" name="email" required>
                    <input type="text" id="custom-domain" name="domain" required>                    
                    <select id="domain-select" name="custom" onchange="return checkEmail()">
                        <option value="">직접 입력</option>
                        <option value="@gmail.com">@gmail.com</option>
                        <option value="@naver.com">@naver.com</option>
                        <option value="@daum.net">@daum.net</option>
                    </select>
                </div>
        </div>
        <div class="form-group">
			<label for="birthdate">생년월일 *</label>
			<input type="date" id="birthdate" name="birthdate" required>
		</div>
        <div class="form-group">
            <label for="favorite-book">감명깊게 읽은책</label>
            <input id="favorite-book" name="fav_books">
        </div>
        <button type="submit" class="signup-btn">회원가입 완료</button>
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
    	
    	// 이메일 직접입력
    	function toggleEmailInput(select) {
            const customInput = document.getElementById('custom-domain');
            const domainSelect = document.getElementById('domain-select');
            if (select.value === "custom") {
                customInput.style.display = 'inline';
                domainSelect.style.display = 'none'; // Hide the dropdown
                customInput.placeholder = "예: @yourdomain.com";
                customInput.disabled = false;
                customInput.focus();
                customInput.required = true;
            } else {
                customInput.style.display = 'none';
                domainSelect.style.display = 'inline'; // Show the dropdown again
                customInput.disabled = true;
                customInput.required = false;
                customInput.value = ''; // Clear input when a predefined option is selected
            }
        }
    	
    	// 이메일
    	        function checkEmail() { //도메인 자동 선택
    		if (document.frm.custom.value != "") {
    			document.frm.domain.value = document.frm.custom.value;
    		} else {
    			document.frm.domain.value = "";
    			document.frm.domain.focus();
    		}
    	}
    	
    </script>
</div>
</body>
</html>