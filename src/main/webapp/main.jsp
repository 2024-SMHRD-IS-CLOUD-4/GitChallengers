<%@page import="com.smhrd.controller.groupCon"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Review"%>
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
		ReviewDAO reviewdao = new ReviewDAO();
		List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
		List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
		Member_info member_info = infodao.info(member.getId()); // 본인 정보 가져오기
		List<Member_info> rank = infodao.rank(); // 랭킹 불러오기
		List<Review> reviewList = reviewdao.bestReview(); // 리뷰 리스트 불러오기
		int ch_count = member_info.getCh_count(); // 챌린지 도전 횟수
		int ch_suc_count = reviewdao.count(member.getId()); // 챌린지 성공 횟수
		Group latestGroup = (Group) request.getAttribute("latestGroup");
		
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
                	<form action="search">
             	       <select id="searchSelect" name="type">
                 	       <option value="ch_review">리뷰</option>
              	          <option value="ch_group">그룹 챌린지</option>
             	       </select>
	                    <input type="text" id="searchInput" class="hidden" placeholder="검색어를 입력하세요..." name="keyword">
	                    <input type="submit" value="검색">
                	</form>
                </div>
                <i class="fas fa-bell"></i>
	                <a href="profile.jsp" class="welcome-text"><%=member.getNick() %>님 환영합니다</a>
                <form action="logoutCon">
	                <button class="logout-button">로그아웃</button>
                </form>
            </div>
        </div>
        
       
        
        <!-- 상단 챌린지 정보 및 상태 -->
        <div class="top-section">
        <% 
    
    if (latestGroup == null) {%>
    	<div class="challenge">
        <h2>진행중인 챌린지</h2>
        <div class="challenge-content">
            <div class="challenge-details">
            <p>진행중인 챌린지가 없습니다.</p>
                <div class="user-input">
                    <span>자유 내용</span>
                </div>
            </div>
        </div>
    </div>
  <%  } else {
%>
        
            <div class="challenge">
                <h2>진행중인 챌린지</h2>
                <div class="challenge-content">
                    <img src="img/pigbook-1.jfif" alt="책 이미지" class="challenge-image">
                    <div class="challenge-details">
                        <h3><%= latestGroup.getGroup_name() %></h3>
                        <p>6일차</p>
               			 <p>페이지 : </p>
                        <div class="user-input">
                            <span>자유 내용</span>
                        </div>
                    </div>
                </div>
            </div>

            <%}%>

            <%--
              <div class="top-section">
            <div class="challenge">
                <h2>진행 중인 챌린지</h2>
                <div class="challenge-content" id="challengeContent">
                    <%-- 진행 중인 챌린지가 없을 때 표시될 기본 메시지 --%>
       
<%--
                     <% if (currentChallenges == null || currentChallenges.isEmpty()) { %>
                        진행 중인 챌린지가 없습니다!
                    <% } else { %>
 --%>
                        <%-- 진행 중인 챌린지가 있을 때의 콘텐츠 렌더링 --%>
 <%--
                         <% for (Challenge challenge : currentChallenges) { %>
                            <div class="challenge-details">
                                <img src="<%= challenge.getImageUrl() %>" alt="<%= challenge.getName() %>" class="challenge-image">
                                <div class="challenge-description">
                                    <h3><%= challenge.getName() %></h3>
                                    <p><%= challenge.getDescription() %></p>
                                </div>
                            </div>
                        <% } %>
                    <% } %>
                </div>
            </div>
        </div>
  --%>

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
                        <h3><%=reviewList.get(0).getReview_title() %></h3>
                        <p><%=reviewList.get(0).getReview_content() %></p>
                    </div>
                </div>
                <div class="review-item">
                    <img src="img/pigbook-1.jfif" alt="Book Image" class="review-image">
                    <div class="review-content">
                        <h3><%=reviewList.get(1).getReview_title() %></h3>
                        <p><%=reviewList.get(1).getReview_content() %></p>
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
                    <img src="<%= request.getAttribute("bestSellerImage1") != null ? request.getAttribute("bestSellerImage1") : "img/bestbook-1.jpg" %>" alt="Product Image">
                    <div class="cart-icon" onclick="openExternalLink('https://product.kyobobook.co.kr/detail/S000000610612')">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage2") != null ? request.getAttribute("bestSellerImage2") : "img/bestbook-2.jpg" %>" alt="Product Image">
                    <div class="cart-icon" onclick="openExternalLink('https://product.kyobobook.co.kr/detail/S000000610650')">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage2") != null ? request.getAttribute("bestSellerImage2") : "img/bestbook-3.jpg" %>" alt="Product Image">
                    <div class="cart-icon" onclick="openExternalLink('https://product.kyobobook.co.kr/detail/S000000781116')">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage2") != null ? request.getAttribute("bestSellerImage2") : "img/bestbook-4.jpg" %>" alt="Product Image">
                    <div class="cart-icon" onclick="openExternalLink('https://product.kyobobook.co.kr/detail/S000000780090')">🛒</div>
                </div>
                <div class="product-item">
                    <img src="<%= request.getAttribute("bestSellerImage2") != null ? request.getAttribute("bestSellerImage2") : "img/bestbook-5.jpg" %>" alt="Product Image">
                    <div class="cart-icon" onclick="openExternalLink('https://product.kyobobook.co.kr/detail/S000000569962')">🛒</div>
                </div>
            </div>

            <!-- 굿즈 섹션 -->
            <h2>Goods</h2>
            <div class="goods">
			    <!-- Goods items with external link functionality -->
			    <div class="goods-item">
			        <img src="<%= request.getAttribute("goodsImage1") != null ? request.getAttribute("goodsImage1") : "img/bookend-1.jpg" %>" alt="Goods Image">
			        <div class="cart-icon" onclick="openExternalLink('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=288710988')">🛒</div>
			    </div>
			    <div class="goods-item">
			        <img src="<%= request.getAttribute("goodsImage2") != null ? request.getAttribute("goodsImage2") : "img/bookholder-1.jpg" %>" alt="Goods Image">
			        <div class="cart-icon" onclick="openExternalLink('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=318309467')">🛒</div>
			    </div>
			    <div class="goods-item">
			        <img src="<%= request.getAttribute("goodsImage2") != null ? request.getAttribute("goodsImage2") : "img/booklight-1.jpg" %>" alt="Goods Image">
			        <div class="cart-icon" onclick="openExternalLink('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=328047825')">🛒</div>
			    </div>
			    <div class="goods-item">
			        <img src="<%= request.getAttribute("goodsImage2") != null ? request.getAttribute("goodsImage2") : "img/bookmarker-1.jpg" %>" alt="Goods Image">
			        <div class="cart-icon" onclick="openExternalLink('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=346794451')">🛒</div>
			    </div>
			    <div class="goods-item">
			        <img src="<%= request.getAttribute("goodsImage2") != null ? request.getAttribute("goodsImage2") : "img/bookrest-1.jpg" %>" alt="Goods Image">
			        <div class="cart-icon" onclick="openExternalLink('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=322878449')">🛒</div>
			    </div>
			</div>

			<script>
			    function openExternalLink(url) {
			        // Open the external link in a new tab
			        window.open(url, '_blank');
			    }
			</script>


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
<script type="text/javascript">
// 진행 상황 차트 생성 함수
function createProgressChart(chartElementId, progressValue) {
    const ctx = document.getElementById(chartElementId).getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['진행된 페이지'],
            datasets: [{
                data: [progressValue, 100 - progressValue],
                backgroundColor: ['#B3261E', '#ffffff'],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom'
                }
            },
            cutout: '70%'
        }
    });
}

// 완료 확률 차트 생성 함수
function createCompletionChart(chartElementId, completionValue) {
    const ctx = document.getElementById(chartElementId).getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['완료 확률'],
            datasets: [{
                data: [completionValue, 100 - completionValue],
                backgroundColor: ['#4867FF', '#ffffff'],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom'
                }
            },
            cutout: '70%'
        }
    });
}

createProgressChart('progressChart', 70); 
createCompletionChart('completionChart', <%=(ch_count != 0) ? ch_suc_count/ch_count * 100 : 0%>);

</script>
</body>

</html>