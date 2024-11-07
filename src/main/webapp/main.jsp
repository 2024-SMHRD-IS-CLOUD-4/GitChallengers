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
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Challenge and Shop Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

    <!-- Main Container -->
    <div class="container">
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
        
        <!-- 상단 챌린지 정보 및 상태 -->
        <div class="top-section">
            <div class="challenge">
                <h2>진행중인 챌린지</h2>
                <div class="challenge-content">
                    <img src="img/pigbook-1.jfif" alt="책 이미지" class="challenge-image">
                    <div class="challenge-details">
                        <h3>돼지책</h3>
                        <p>6일차</p>
                        <p>페이지: 120-150p</p>
                        <div class="user-input">
                            <span>자유 내용</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="status">
                <h2>현재 챌린지 진행 상황</h2>
                <div style="width: 25%; margin: auto;">
                    <canvas id="progressChart"></canvas>
                </div>
                <h2>챌린지 완료 확률</h2>
                <div style="width: 25%; margin: auto;">
                    <canvas id="completionChart"></canvas>
                </div>
            </div>
        </div>

        <!-- 리더보드 및 베스트 리뷰 칸 -->
        <div class="bottom-section-wrapper">
            <div class="leaderboard-section">
                <h2>LEADERBOARD</h2>

                <!-- 리더보드 데이터 수동 삽입 -->
                <div class="leaderboard-item-wrapper">
                    <img src="img/gold.png" alt="Gold Medal" class="medal-icon">
                    <img src="profile_img/<%=infodao.info(rank.get(0).getId()).getProfile_img() %>" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name"><%=(rank != null && !rank.isEmpty() && rank.get(0) != null && rank.get(0).getId() != null) ? mdao.memberInfo(rank.get(0).getId()).getNick()  : "이름" %></span>
                        <span class="points"><%=(rank != null && !rank.isEmpty() && rank.get(0) != null && rank.get(0).getId() != null) ? rank.get(0).getPoint() : "포인트" %>p</span>
                    </div>
                </div>
                <div class="leaderboard-item-wrapper">
                    <img src="img/silver.png" alt="Silver Medal" class="medal-icon">
                    <img src="profile_img/<%=infodao.info(rank.get(1).getId()).getProfile_img() %>" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name"><%=(rank != null && !rank.isEmpty() && rank.get(1) != null && rank.get(1).getId() != null) ? mdao.memberInfo(rank.get(1).getId()).getNick() : "이름" %></span>
                        <span class="points"><%=(rank != null && !rank.isEmpty() && rank.get(1) != null && rank.get(1).getId() != null) ? rank.get(1).getPoint() : "포인트" %>p</span>
                    </div>
                </div>
                <div class="leaderboard-item-wrapper">
                    <img src="img/bronze.png" alt="Bronze Medal" class="medal-icon">
                    <img src="profile_img/<%=infodao.info(rank.get(2).getId()).getProfile_img() %>" alt="User Image">
                    <div class="leaderboard-item">
                        <span class="name"><%=(rank != null && !rank.isEmpty() && rank.get(2) != null && rank.get(2).getId() != null) ? mdao.memberInfo(rank.get(2).getId()).getNick() : "이름" %></span>
                        <span class="points"><%=(rank != null && !rank.isEmpty() && rank.get(2) != null && rank.get(2).getId() != null) ? rank.get(2).getPoint() : "포인트" %>p</span>
                    </div>
                </div>
            </div>
           <div class="best-review-section">
                <h2>BEST REVIEW</h2>
                <div class="review-item">
                    <img src="img/pigbook-1.jfif" alt="Book Image" class="review-image">
                    <div class="review-content">
                        <h3>리뷰 제목</h3>
                        <p>내용</p>
                    </div>
                </div>
                <div class="review-item">
                    <img src="img/pigbook-1.jfif" alt="Book Image" class="review-image">
                    <div class="review-content">
                        <h3>리뷰 제목</h3>
                        <p>내용</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 하단 베스트셀러 및 상품 목록 -->
        <div class="bottom-section">
            <h2>Best Seller</h2>
            <div class="products">
                <!-- 베스트셀러 수동 삽입 -->
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage1") != null ? request.getAttribute("bestSellerImage1") : "img/pigbook-1.jfif" %>" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage2") != null ? request.getAttribute("bestSellerImage2") : "img/harry-porter.jfif" %>" alt="Product Image">
                    <div class="cart-icon">🛒</div>
                </div>
            </div>

            <!-- 굿즈 섹션 -->
            <h2>Goods</h2>
            <div class="goods">
                <!-- 굿즈 아이템 수동 삽입 -->
                <div class="goods-item">
                    <img src="<%= request.getAttribute("goodsImage1") != null ? request.getAttribute("goodsImage1") : "img/book-holder.jpg" %>" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
                </div>
                <div class="goods-item">
                    <img src="<%= request.getAttribute("goodsImage2") != null ? request.getAttribute("goodsImage2") : "img/book-marker.jfif" %>" alt="Goods Image">
                    <div class="cart-icon">🛒</div>
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
        </div>
    </div>
    <script src="./js/main.js"></script>

</body>

</html>
