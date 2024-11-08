<%@page import="com.smhrd.model.Review_heartDAO"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.Comment"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Review"%>
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
    <title>Review Cards</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/reviewMain.css">
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		ReviewDAO rdao = new ReviewDAO();
		CommentDAO cdao = new CommentDAO();
		Member_infoDAO infodao = new Member_infoDAO();
		Review_heartDAO likedao = new Review_heartDAO();
		List<Review> rList = rdao.selectAll(); // 리뷰 리스트 불러오기
		JoinDAO jdao = new JoinDAO();
		GroupDAO gdao = new GroupDAO();
		Member_pointDAO mpdao = new Member_pointDAO();
		Pc_challengeDAO pcdao = new Pc_challengeDAO();
		List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
		List<Member_point> rank = mpdao.rank(); // 랭킹 불러오기
		List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
		
		
		
	%>
        <!-- Header -->
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
		
		<%for(Review r : rList) {
			int review_idx = r.getReview_idx();
			int count = cdao.commentCount(review_idx);
			
		%>
        <div class="card" onClick="location.href='pReview.jsp?idx=<%=review_idx%>'">
            <img src="profile_img/<%=infodao.info(r.getId()).getProfile_img() %>" alt="Book Image">
            <div class="card-content">
                <div class="card-title"><%=r.getReview_title()%> <%if(r.getIs_approved() == 'Y') {%> ✅<%} %></div>
                <div class="card-body"><%=r.getReview_content() %></div>
            </div>
            <div class="card-stats">
                <span class="recommendation positive">추천해요!</span><br>
                좋아요 <%=likedao.likeCount(review_idx) %>개<br>
                댓글 <%=count %>개
            </div>
        </div>
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

    <script src="./js/reviewMain.js"></script>
</body>
</html>

