<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Member_info"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@page import="com.smhrd.model.Member_point"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/searchResult.css">
</head>

<body>
    <%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		MemberDAO mdao = new MemberDAO();
		JoinDAO jdao = new JoinDAO();
		GroupDAO gdao = new GroupDAO();
		Member_pointDAO mpdao = new Member_pointDAO();
		Pc_challengeDAO pcdao = new Pc_challengeDAO();
		Member_infoDAO infodao = new Member_infoDAO();
		List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
		List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
		Member_info member_info = infodao.info(member.getId()); // 본인 정보 가져오기
		List<Member_info> rank = infodao.rank(); // 랭킹 불러오기
	%>
    <div class="search-container">
        <!-- Header -->
        <div class="header">
            <div class="logo">
                <img src="<%= request.getContextPath() %>/img/team-logo.png" alt="로고">
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
                <a href="#" class="welcome-text"><%= session.getAttribute("userName") %>님 환영합니다</a>
                <form action="logout" method="post" style="display:inline;">
                    <button class="logout-button">로그아웃</button>
                </form>
            </div>
        </div>
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
        <div class="results">
            검색 내용
        </div>
    </div>
    <script src="./js/searchResult.js"></script>
</body>

</html>
