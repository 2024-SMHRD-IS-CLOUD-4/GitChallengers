<%@page import="com.smhrd.model.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Follow"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.smhrd.model.FollowDAO"%>
<%@page import="com.smhrd.model.Member_info"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="./css/profile.css">
</head>

<body>
<script src="js/jquery-3.7.1.min.js"></script>
	<%
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response.sendRedirect("login.jsp");
	}
	String id = request.getParameter("id");
	if(id == null){
		id = member.getId();
	}
	Member_pointDAO pdao = new Member_pointDAO();
	Member_infoDAO infodao = new Member_infoDAO();
	FollowDAO fdao = new FollowDAO();
	MemberDAO mdao = new MemberDAO();
	ReviewDAO rdao = new ReviewDAO();
	Member profileMember = mdao.memberInfo(id); // 프로필 주인 정보
	Member_info member_info = infodao.info(id); // 회원 정보 가져오기
	int follower = fdao.follower(id); // 팔로워 수
	int following = fdao.following(id); // 팔로잉 수
	List<Review> rlist = rdao.reviewList(id); // 리뷰 불러오기
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
				<%if(member.getId().equals(id)) {%>
				<button class="edit-profile-button" onClick="location.href='joinEdit.jsp'">회원정보 수정</button>
				<%} %>
				<form action="logoutCon">
					<button class="logout-button">로그아웃</button>
				</form>
			</div>
		</div>

        <!-- Profile Section -->
        <div class="profile-section">
            <!-- Profile Picture and Edit Button -->
            <div class="profile-picture">
                <img src="profile_img/<%=member_info.getProfile_img() %>" alt="Profile Image">
                <h2><%=profileMember.getNick() %></h2>
                <%if(member.getId().equals(id)) {%>
                <button class="button-edit" onClick="location.href='profileEdit.jsp'">프로필 편집</button>
                <%} %>
                <br><br>
                <span>팔로워 <span id="followerCount"><%=follower %></span></span>
  				<span>팔로잉 <span id="followingCount"><%=following %></span></span>
  				<br><br>
  				<%if(!member.getId().equals(id)) {
  					Follow follow = new Follow(member.getId(), profileMember.getId());
  				%>
  				<button class="follow-button" id="followButton" data-follower="<%=member.getId()%>" data-following="<%=profileMember.getId()%>">
  				<%if (fdao.followCheck(follow) == 1) {%>
  				언팔로우
  				<%}else{ %>
  				팔로우
  				<%} %>
  				</button>
  				<%} %>
            </div>
            
          
            
            <!-- Stats and Intro Section -->
            <div class="stats-section">
                <div class="stats">
                    <div>
                        <p>챌린지 완료 횟수</p>
                        <span><%=member_info.getCh_suc_count() %>회</span>
                    </div>
                    <div>
                        <p>챌린지 완료 확률</p>
                        <%if(member_info.getCh_count() == 0) { %>
                        	<span>0%</span>
                        <%}else{ %>
                        <span><%=member_info.getCh_suc_count()/member_info.getCh_count() * 100 %>%</span>
                        <%} %>
                    </div>
                </div>
                <div class="intro-section">
                    <textarea rows="3" placeholder="여기에 소개글을 입력하세요." disabled><%= (member_info.getIntro() != null) ? member_info.getIntro() : "" %></textarea>
                </div>
                
            	<%if(member.getId().equals(id)) {%>
                <div class="points-section">

                    <span>보유 포인트: <%=member_info.getPoint() %>원</span><br>
                    <span>보유 캐쉬: <%=member_info.getCash() %>원</span>

                    <button class="button-edit" onclick="location.href='pay.jsp'">캐쉬 충전</button>
               </div>
                
                <div class="points-section">
                <form action="delete.jsp">
	                <button class="delete">회원탈퇴</button>
                </form>
                </div>
                <%} %>
                
                <!-- Book Showcase Section (Moved under Points Section) -->
                <div class="book-showcase">
                    <h3>MY BOOK</h3>
                    <div class="book-list">
                        <div class="book-item">
                            <img src="img/pigbook-1.jfif" alt="돼지책">
                            <p>돼지책</p>
                        </div>
                        <div class="book-item">
                            <img src="img/pigbook-1.jfif" alt="돼지책">
                            <p>돼지책</p>
                        </div>
                        <div class="book-item">
                            <img src="img/pigbook-1.jfif" alt="돼지책">
                            <p>돼지책</p>
                        </div>
                    </div>
                </div>
            </div>
            
            

			<!-- Review Container -->
			<div class="review-container">
				<div class="review-buttons">
					<button onclick="showReview()">리뷰</button>
					<button onclick="showReviewCount()">작성 수</button>
				</div>
				<div id="review-content" class="review-content">
					<!-- 초기에는 리뷰 내용 표시 -->
					<%for(Review r : rlist) {%>
				    <div class="review">
				        <h3 onClick="location.href='reviewBook?idx=<%=r.getReview_idx()%>'"><%=r.getReview_title() %></h3> 
				        <!-- 사진 넣고 a태그로 넘어가게 페이지 이동시에는 idx를 보내던가 아니면 쿼리에 idx넣기 -->
				    </div>
				    <%} %>
				</div>
			</div>
		</div>
		</div>

		<script src="./js/profile.js"></script>

<script>
	// 팔로우
	$(document).on('click', '.follow-button', function() {
		var input = {
				follower : $(this).data('follower'),
				following : $(this).data('following')
		};
		
		$.ajax({
			url : "follow",
			type : "post",
			contentType: "application/json; charset=UTF-8",
			data : JSON.stringify(input),
			success : function(data){
				if (data == "true") {
					document.location.reload();
					var followButton = $('#followButton');
					if (followButton.text() === '팔로우') {
						followButton.text('언팔로우');
						followerCount.text(parseInt(followerCount.text()) + 1);
					}else {
						followButton.text('팔로우');
						followerCount.text(parseInt(followerCount.text()) - 1);
					}
					
	            } else {
	                alert("실패");  
	            }
			},
			error : function(){
				alert("통신실패")
			}
			
		})  		
	})

</script>
</body>

</html>