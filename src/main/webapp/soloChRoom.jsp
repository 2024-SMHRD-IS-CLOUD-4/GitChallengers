<%@page import="com.smhrd.model.Pc_items"%>
<%@page import="com.smhrd.model.Pc_itemsDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Member_point"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인챌린지방</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/soloChRoom.css">
</head>

<body>
	<%
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
	JoinDAO jdao = new JoinDAO();
	GroupDAO gdao = new GroupDAO();
	Pc_challengeDAO pcdao = new Pc_challengeDAO();
	Pc_itemsDAO idao = new Pc_itemsDAO();
	int idx = Integer.parseInt(request.getParameter("idx")); // 방 인덱스
	List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
	List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
	List<Pc_items> iList = idao.selectAll(idx); // 작성글 가져오기
	
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
            <!-- 사용자 환영 텍스트 추가 -->
            <a href="profile.jsp" class="welcome-text"><%=member.getNick() %> 환영합니다</a>
            <form action="logoutCon">
	                <button class="logout-button">로그아웃</button>
            </form>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="profile-upload">
                <div class="profile-img" id="profilePreview"></div>
            </div>
            <div class="profile-name"></div>
            <button class="button" onclick="location.href='pcWrite.jsp?idx=<%=idx%>'">오늘의 챌린지 작성</button>
        </div>

        <!-- 카드 영역 -->
        <div class="card-container">
            <!-- 카드 리스트 -->
            <%
                // 카드 데이터 배열
                for (Pc_items i : iList) {
                	if(i != null) {
            %>
            <div class="card">
                <div class="card-content">
                    <div class="card-header"><%=member.getId() %></div>
                    <div class="book-title"><%=i.getP_item_title() %></div>
                    <div class="page-info"></div>
                    <div class="content-placeholder"><%=i.getP_item_desc() %></div>
                </div>
                
            </div>
    	        	<%} %>
	            <%} %>
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
        </div>
    </div>

    <script src="./js/soloChRoom.js"></script>
</body>

</html>
