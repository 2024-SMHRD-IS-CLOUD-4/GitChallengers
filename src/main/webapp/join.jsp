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
<div class="signup-container">
    <h2>회원가입</h2>
    <form action="joinCon" method="post">
        <div class="form-group">
            <label for="username">아이디</label>
            <input type="text" id="username" name="id">
            <button type="button" class="check-duplicate">중복 확인</button>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="pw">
        </div>
        <div class="form-group">
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="confirm-password" name="confirm-password">
        </div>
        <div class="form-group">
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phoneNum">
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
            <input type="text" id="address" name="address">
        </div>
        <div class="form-group">
            <label for="favorite-book">감명깊게 읽은책</label>
            <textarea id="favorite-book" name="fav_book"></textarea>
        </div>
        <button type="submit" class="signup-button">회원가입 완료</button>
    </form>
</div>
</body>
</html>