<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="./css/joinEdit.css">
    <script>
        function toggleEmailInput(select) {
            const customInput = document.getElementById('custom-domain');
            if (select.value === "custom") {
                customInput.style.display = 'inline';
                customInput.placeholder = "예: @yourdomain.com";
                customInput.disabled = false;
                customInput.required = true;
                customInput.focus();
            } else {
                customInput.style.display = 'none';
                customInput.disabled = true;
                customInput.required = false;
                customInput.value = '';
            }
        }

        function validateForm(event) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const errorMessage = document.getElementById('error-message');

            if (password !== confirmPassword) {
                event.preventDefault();
                errorMessage.textContent = "비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
                errorMessage.style.display = 'block';
            } else {
                errorMessage.style.display = 'none';
            }
        }

        function goBack() {
            window.history.back();
        }
    </script>
</head>

<body>
    <div class="container">
        <!-- 뒤로가기 버튼 -->
        <div class="back-button" onclick="goBack()">←</div>
        <h2>회원정보 수정</h2>
        
        <form action="RegisterServlet" method="post" onsubmit="validateForm(event)">
            <!-- 아이디 입력 (수정 불가) -->
            <div class="form-group">
                <label for="id">아이디 *</label>
                <div class="input-group">
                    <input type="text" name="id" value="<%= (String) session.getAttribute("userId") %>" disabled required>
                </div>
            </div>

            <!-- 닉네임 입력 -->
            <div class="form-group">
                <label for="nickname">닉네임 *</label>
                <input type="text" id="nickname" name="nickname" value="<%= (String) session.getAttribute("nickname") %>" required>
            </div>

            <!-- 비밀번호와 비밀번호 확인 -->
            <div class="form-group">
                <label for="password">비밀번호 *</label>
                <input type="password" id="password" name="pw" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">비밀번호 확인 *</label>
                <input type="password" id="confirm-password" name="confirm-pw" required>
            </div>

            <!-- 이름 입력 (수정 불가) -->
            <div class="form-group">
                <label for="name">이름 *</label>
                <input type="text" name="name" value="<%= (String) session.getAttribute("name") %>" disabled required>
            </div>

            <!-- 생년월일 입력 (수정 불가) -->
            <div class="form-group">
                <label for="birthdate">생년월일 *</label>
                <input type="date" id="birthdate" name="birthdate" value="<%= (String) session.getAttribute("birthdate") %>" disabled required>
            </div>

            <!-- 오류 메시지 표시 -->
            <div id="error-message" style="color: red; display: none; font-size: 14px; margin-bottom: 15px;"></div>

            <!-- 휴대폰번호 입력 -->
            <div class="form-group">
                <label for="phone">휴대폰번호 *</label>
                <input type="tel" name="phone" value="<%= (String) session.getAttribute("phone") %>" required>
            </div>

            <!-- 이메일 입력 -->
            <div class="form-group">
                <label for="email">이메일 *</label>
                <div class="email-group">
                    <input type="text" name="email" value="<%= (String) session.getAttribute("email") %>" required>
                    <select id="domain-select" name="email-domain" onchange="toggleEmailInput(this)" required>
                        <option value="gmail.com">@gmail.com</option>
                        <option value="naver.com">@naver.com</option>
                        <option value="daum.net">@daum.net</option>
                        <option value="custom">직접 입력</option>
                    </select>
                    <input type="text" id="custom-domain" name="custom-domain" placeholder="예: @yourdomain.com"
                        style="display:none; margin-top: 5px;" disabled>
                </div>
            </div>

            <!-- 감명 깊게 읽은 책 입력 -->
            <div class="form-group">
                <label for="favorite-book">감명깊게 읽은 책</label>
                <input type="text" name="fav-books" value="<%= (String) session.getAttribute("favBooks") %>">
            </div>

            <!-- 제출 버튼 -->
            <button type="submit" class="submit-btn">회원정보수정 완료</button>
        </form>
    </div>
</body>

</html>
