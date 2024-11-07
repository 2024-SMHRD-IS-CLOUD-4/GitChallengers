<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="./css/groupChList.css">
<script src="js/jquery-3.7.1.min.js"></script>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		
		GroupDAO dao = new GroupDAO();
		MemberDAO mdao = new MemberDAO();
		Member_infoDAO infodao = new Member_infoDAO();
		List<Group> list = dao.selectAll();
	%>
    <!-- 헤더 -->
    <div class="header">
        <div class="logo">
            <img src="img/team-logo.png" alt="로고" onClick="location.href='main.jsp'">
             <div class="nav-links">
		        <a href="#">MY 챌린지</a>
		        <a href="groupChList.jsp">그룹 챌린지</a>
		        <a href="soloChList.jsp">개인 챌린지</a>
		        <a href="reviewMain.jsp">리뷰</a>
		    </div>
        </div>
        <div class="header-icons">
			<i class="fas fa-search" id="searchIcon"></i>
			<div id="searchOptions" class="hidden">
                <select id="searchSelect">
                    <option value="review">리뷰</option>
                    <option value="group">그룹 챌린지</option>
                </select>
                <input type="text" id="searchInput" class="hidden" placeholder="검색어를 입력하세요...">
            </div>
            <i class="fas fa-bell"></i>
		    <a href="profile.jsp" class="welcome-text"><%=member.getNick() %> 환영합니다</a>
        	<button class="create-group-btn" onClick="location.href='groupCh.jsp'">그룹 만들기</button>
    		<form action="logoutCon">
		     <button class="logout-button">로그아웃</button>
		    </form>
    	</div>
    </div>


    <!-- 메인 컨테이너 -->
    <div class="main-container">
    <%
    	for(Group g : list) {
    		int idx = g.getGroup_idx();
    		JoinDAO jdao = new JoinDAO();
    		int count = jdao.count(idx);
    		List<Join> joinMember = jdao.selectAll(idx);
    		boolean isJoined = false;
    		Member managerInfo = mdao.memberInfo(g.getManager());
    		String manager = (managerInfo != null) ? managerInfo.getNick() : "Unknown";
    %>
        <!-- 그룹 카드 1 -->
        <div class="group-card">
            <div class="profile" onClick="location.href='groupChRoom.jsp?idx=<%=idx%>'">
                <img src="profile_img/<%=infodao.info(managerInfo.getId()).getProfile_img() %>" alt="방장 프로필">
                <span><%=manager%></span>
            </div>
            <div class="content" onClick="location.href='groupChRoom.jsp?idx=<%=idx%>'">
                <h3><%=g.getGroup_name()%></h3>
                <p><%=g.getGroup_desc() %></p>
                <div class="details">
                    현재 참가인원 <%=count%>/<%=g.getGroup_max() %><br>
                    <strong>14일 후 종료 예정</strong>
                </div>
            </div>
            	
            	<%for(Join j : joinMember) {
            		if(member.getId().equals(j.getId())) {	
            			isJoined = true;
					}%>
	            <%} %>
           	<%if (member.getId().equals(g.getManager()) || isJoined) { %>
            	<button class="join-button">참여중</button>
            <%}else if(count >= g.getGroup_max()) { %>	
            	<button class="join-button">입장 불가</button>
            <%}else { %>
            	<button class="join-button" onClick="join(<%=idx%>, <%=count%>, <%=g.getGroup_max()%>)">참가하기</button>
            <%} %>
        </div>
    <%} %>

    </div>
    <script src="./js/groupChList.js"></script>
</body>
</html>