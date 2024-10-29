<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/grCh.css">
</head>
<body>
  <div class="form-container">
    <h2>그룹 이름</h2>
    <input type="text" placeholder="인원수 (최대 15인)">
    <textarea placeholder="그룹 소개글"></textarea>
    <div class="button-group">
      <button onclick="selectButton(this)">7일</button>
      <button onclick="selectButton(this)">15일</button>
      <button onclick="selectButton(this)">30일</button>
    </div>
    <button class="submit-button">챌린지 그룹 생성</button>
  </div>

  <script>
    function selectButton(button) {
      // Remove 'selected' class from all buttons
      const buttons = document.querySelectorAll('.button-group button');
      buttons.forEach(btn => btn.classList.remove('selected'));

      // Add 'selected' class to the clicked button
      button.classList.add('selected');
    }
  </script>
</body>
</html>