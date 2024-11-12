<%@page import="com.smhrd.model.Member"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Group Creation Form</title>
  <link rel="stylesheet" href="./css/makeSoloCh.css">
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
    <span class="back-arrow" onclick="history.back()">←</span>
    <br><br>
    <form id="challengeForm" action="createCh" method="post">
      <input type="text" name="pc_title" placeholder="책 이름">
      <textarea name="pc_desc" placeholder="소개글"></textarea>
      <div class="button-group">
        <select name="days">
          <option value="7">7일</option>
          <option value="15">15일</option>
          <option value="30">30일</option>
        </select>
      </div>
      <button type="button" class="submit-button" onclick="confirmChallengeCreation()">챌린지 생성</button>
    </form>
  </div>

  <script>
    function selectButton(button) {
      const buttons = document.querySelectorAll('.button-group button');
      buttons.forEach(btn => btn.classList.remove('selected'));
      button.classList.add('selected');
    }

    function confirmChallengeCreation() {
        const confirmation = confirm('챌린지 생성 후에는 수정이 불가능합니다. 챌린지를 생성하겠습니까?');
        if (confirmation) {
          document.getElementById('challengeForm').submit();
        } else {
          alert('챌린지 생성을 취소했습니다.');
        }
      }
  </script>
</body>
</html>

