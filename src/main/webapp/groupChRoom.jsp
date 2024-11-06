<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Gc_items"%>
<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Gc_itemsDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그룹챌린지방</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/groupChRoom.css">
</head>

<body>
<%	
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
	Pc_challengeDAO pcdao = new Pc_challengeDAO();
	GroupDAO gdao = new GroupDAO();
	GroupDAO dao = new GroupDAO(); 
	JoinDAO jdao = new JoinDAO();
	Gc_itemsDAO idao = new Gc_itemsDAO();
	MemberDAO mdao = new MemberDAO();
	Member_infoDAO infodao = new Member_infoDAO();
	int idx = Integer.parseInt(request.getParameter("idx")); // 방 인덱스
	Group group = dao.groupInfo(idx); // 방 정보
	List<Join> list = jdao.selectAll(idx); // 방 참가 인원 정보
	List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
	
	
%>

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
            <form action="logoutCon">
            <button class="logout-button">로그아웃</button>
            </form>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="profile-upload">
               	<img src="profile_img/<%=infodao.info(group.getManager()).getProfile_img() %>" class="profile-img" id="profilePreview">
            </div>
            <div class="profile-name"><%=mdao.memberInfo(group.getManager()).getNick()%></div>
            <ul class="group-list">
            	<li class="group-item">
					<img src="profile_img/<%=infodao.info(group.getSub_manager()).getProfile_img() %>">
					<span class="group-name"><%=mdao.memberInfo(group.getSub_manager()).getNick()%></span>
					<%if(member.getId().equals(group.getManager())) {%>
					<input type="checkbox">
					<%} %>
                </li>
                <%
                    for(Join j: list) {
                    	Member m = mdao.memberInfo(j.getId());
                    	if(!j.getId().equals(group.getManager()) && !j.getId().equals(group.getSub_manager())) {
                %>
			                <li class="group-item">
			                    <img src="profile_img/<%=infodao.info(j.getId()).getProfile_img() %>">
			                    <span class="group-name"><%=m.getNick()%></span>
			                    <%if(member.getId().equals(group.getManager())) {%>
			                    <input type="checkbox">
			                    <form action="memberDelete">
									<button type="submit">퇴장</button>
									<input type="hidden" name="group_idx" value = "<%=idx%>">
									<input type="hidden" name="id" value = "<%=j.getId()%>">
			                    </form>
			                    <%} %>
			                </li>
			                <% } %>
                	<% } %>
            </ul>
            <button class="button" onClick="location.href='chWrite.jsp?idx=<%=idx%>'">오늘의 챌린지 작성</button>
        </div>

        <!-- 카드 영역 -->
        <div class="card-container">
            <%
                // 카드 데이터 배열
                for (Join j : list) {
                	Gc_items items = new Gc_items(idx, j.getId());
                	List<Gc_items> getItem = idao.getItem(items); // 작성글 가져오기
                	for (Gc_items gi : getItem) {
                		if (gi != null) {
            %>
            <div class="card">
                <div class="card-content">
                    <div class="author"><%= mdao.memberInfo(j.getId()).getNick() %></div>
                    <div class="book-title"><%= gi.getG_item_title() %></div>
                    <div class="page-info"></div>
                    <div class="content-placeholder"><%= gi.getG_item_desc() %></div>
                </div>
                <div class="actions">
                    <span class="like">❤</span>
                    <span class="like-count">좋아요 10개</span>
                    <span class="comment">💬</span>
                    <span class="comment-count">댓글 0개</span>
                </div>
                <div class="comment-input" style="display: none;">
                    <textarea rows="3" placeholder="댓글을 작성해주세요..."></textarea>
                    <button>댓글 작성</button>
                </div>
                <div class="comments-section"></div>
            </div>
        </div>
    	        	<%} %>
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

    <script src="./js/groupChRoom.js"></script>
</body>

</html>
