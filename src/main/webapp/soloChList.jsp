<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Member_point"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Challenge Group List</title>
    <link rel="stylesheet" href="./css/soloChList.css">
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		JoinDAO jdao = new JoinDAO();
		GroupDAO gdao = new GroupDAO();
		Member_pointDAO mpdao = new Member_pointDAO();
		Pc_challengeDAO pcdao = new Pc_challengeDAO();
		List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
		List<Member_point> rank = mpdao.rank(); // 랭킹 불러오기
		List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
		
	%>
    <!-- 헤더 -->
	<div class="header">
		<div class="logo">
		    <img src="img/team-logo.png" alt="로고" onClick="location.href='main.jsp'">
		    <div class="nav-links">
		        <a href="#">MY 챌린지</a>
		        <a href="groupChList.jsp">그룹 챌린지</a>
		        <a href="soloChList.jsp">개인 챌린지</a>
		    </div>
		</div>
		<div class="header-icons">
			<button class="create-group-btn">챌린지 만들기</button>
		    <a href="profile.jsp" class="welcome-text"><%=member.getNick() %> 환영합니다</a>
		    <form action="logoutCon">
		     <button class="logout-button">로그아웃</button>
		    </form>
		</div>
    </div>
    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <!-- 그룹 카드 1 -->
        <%
        	for (Pc_challenge pc : pcList) {
        		if(pc != null) {
        %>
        <div class="group-card">
            <div class="profile">
                <img src="https://via.placeholder.com/60" alt="반장 프로필">
            </div>
            <div class="content">
                <h3><%=pc.getPc_title() %></h3>
                <div class="details">
                    현재 8일차 진행중!!<br>
                    <strong>14일 후 종료 예정</strong>
                </div>
            </div>
            <button class="join-button" onClick="location.href='pcWrite.jsp?idx=<%=pc.getPc_idx()%>'">작성하기</button>
        </div>
			<%} %>
		<%} %>
        <!-- MY 챌린지 팝업 -->
        <div id="myChallengePopup" class="popup hidden">
			<h3>MY 챌린지</h3>
			<div>
			    <p>개인 챌린지</p>
			    <%for (Pc_challenge p: pcList) {%>
				<button class="popup-button" onClick="location.href='soloChRoom.jsp?idx=<%=p.getPc_idx()%>'"><%= p.getPc_title() != null ? p.getPc_title() : "진행중인 챌린지 없음" %></button>
				<%} %>
			
				<p>그룹 챌린지</p>
				<%for (Join j : list) {
				Group g = gdao.groupInfo(j.getGroup_idx());                    	
				%>
				<button class="popup-button" onClick="location.href='groupChRoom.jsp?idx=<%=g.getGroup_idx()%>'"><%=g.getGroup_name() != null?g.getGroup_name() : "진행중인 챌린지 없음"%></button>
				<%} %>
			</div>
		</div>
    </div>

    <script src="./js/soloChList.js"></script>
</body>
</html>
