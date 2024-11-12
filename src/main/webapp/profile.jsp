<%@page import="com.smhrd.model.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Follow"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.smhrd.model.FollowDAO"%>
<%@page import="com.smhrd.model.Member_info"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
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
<style>
    body {
        font-family: 'BMJUA', sans-serif;
    }
</style>
</head>

<body>
	<script src="js/jquery-3.7.1.min.js"></script>
	<%
	Member member = (Member) session.getAttribute("member");
	if (member == null) {
		response.sendRedirect("login.jsp");
	}
	String id = request.getParameter("id");
	if (id == null) {
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

	JoinDAO jdao = new JoinDAO();
	GroupDAO gdao = new GroupDAO();
	Member_pointDAO mpdao = new Member_pointDAO();
	Pc_challengeDAO pcdao = new Pc_challengeDAO();
	List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
	List<Member_point> rank = mpdao.rank(); // 랭킹 불러오기
	List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
	ReviewDAO reviewdao = new ReviewDAO();
	int ch_count = member_info.getCh_count(); // 챌린지 도전 횟수
	int ch_suc_count = reviewdao.count(member_info.getId()); // 챌린지 성공 횟수
	%>

	<!-- Main Container -->
	<div class="container">
		<!-- Header -->
		<div class="header">
			<div class="logo">
				<img src="img/team-logo.png" alt="로고"
					onClick="location.href='main.jsp'">
				<div class="nav-links">
					<a href="#">MY 챌린지</a> <a href="groupChList.jsp">그룹 챌린지</a> <a
						href="soloChList.jsp">개인 챌린지</a> <a href="reviewMain.jsp">리뷰</a>
				</div>
			</div>
			<div class="header-icons">
				<i class="fas fa-search" id="searchIcon"></i>
				<div id="searchOptions" class="hidden">
					<form action="search">
						<select id="searchSelect" name="type">
							<option value="ch_review">리뷰</option>
							<option value="ch_group">그룹 챌린지</option>
						</select> <input type="text" id="searchInput" class="hidden"
							placeholder="검색어를 입력하세요..." name="keyword"> <input
							type="submit" value="검색">
					</form>
				</div>
				<%
				if (member.getId().equals(id)) {
				%>
				<button class="edit-profile-button"
					onClick="location.href='joinEdit.jsp'">회원정보 수정</button>
				<%
				}
				%>
				<form action="logoutCon">
					<button class="logout-button">로그아웃</button>
				</form>
			</div>
		</div>

		<!-- Profile Section -->
		<div class="profile-section">
			<!-- Profile Picture and Edit Button -->
			<div class="profile-picture">
				<img
					src="<%=member_info.getProfile_img() != null ? "profile_img/" + member_info.getProfile_img() : "img/team-logo.png"%>"
					alt="Profile Image">
				<h2><%=profileMember.getNick()%></h2>
				<%
				if (member.getId().equals(id)) {
				%>
				<button class="button-edit"
					onClick="location.href='profileEdit.jsp'">프로필 편집</button>
				<%
				}
				%>
				<br> <br> <span>팔로워 <span id="followerCount"><%=follower%></span></span>
				<span>팔로잉 <span id="followingCount"><%=following%></span></span> <br>
				<br>
				<%
				if (!member.getId().equals(id)) {
					Follow follow = new Follow(member.getId(), profileMember.getId());
				%>
				<button class="follow-button" id="followButton"
					data-follower="<%=member.getId()%>"
					data-following="<%=profileMember.getId()%>">
					<%
					if (fdao.followCheck(follow) == 1) {
					%>
					언팔로우
					<%
					} else {
					%>
					팔로우
					<%
					}
					%>
				</button>
				<%
				}
				%>
			</div>



			<!-- Stats and Intro Section -->
			<div class="stats-section">
				<div class="intro-section">
					<textarea rows="3" placeholder="여기에 소개글을 입력하세요." disabled><%=(member_info.getIntro() != null) ? member_info.getIntro() : ""%></textarea>
				</div>

				<%
				if (member.getId().equals(id)) {
				%>
				<div class="points-section">

					<span>보유 포인트: <%=member_info.getPoint()%>원
					</span><br> <span>보유 캐쉬: <%=member_info.getCash()%>원
					</span>

					<button class="button-edit" onclick="location.href='pay.jsp'">캐쉬
						충전</button>
				</div>

				<div class="points-section">
					<form action="delete.jsp">
						<button class="delete">회원탈퇴</button>
					</form>
				</div>
				<%
				}
				%>
				<div class="stats">
					<div>
						<p>챌린지 완료 횟수</p>
						<span><%=ch_suc_count%>회</span>
					</div>
					<div>
						<p>챌린지 완료 확률</p>
						<%
						if (ch_count == 0) {
						%>
						<span>0%</span>
						<%
						} else {
						%>
						<span><%=ch_suc_count/ ch_count * 100%>%</span>
						<%
						}
						%>
					</div>
				</div>
				<div class="chart-container">
					<h2>나의 챌린지 완료 확률</h2>
					<canvas id="challengeCompletionChart"></canvas>
				</div>
			</div>


			<div class="review-container" id="review-content">
				<div class="book-grid">
					<%
					for (Review r : rlist) {
					%>
					<div class="book-review"
						onclick="showScrollMessage(); location.href='reviewBook?idx=<%=r.getReview_idx()%>'">
						<div class="book-cover-container">
							<img src="img/<%=r.getReview_ocr()%>"
								class="book-cover" alt="Book Cover" />
							<div class="review">
								<h3><%=r.getReview_title()%></h3>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>

			<!-- MY 챌린지 팝업 -->
			<div id="myChallengePopup" class="popup hidden">
				<h3>MY 챌린지</h3>
				<div>
					<p>개인 챌린지</p>
					<%
					for (Pc_challenge p : pcList) {
					%>
					<button class="popup-button"
						onClick="location.href='soloChRoom.jsp?idx=<%=p.getPc_idx()%>'"><%=p.getPc_title() != null ? p.getPc_title() : "진행중인 챌린지 없음"%></button>
					<%
					}
					%>

					<p>그룹 챌린지</p>
					<%
					for (Join j : list) {
						Group g = gdao.groupInfo(j.getGroup_idx());
					%>
					<button class="popup-button"
						onClick="location.href='groupChRoom.jsp?idx=<%=g.getGroup_idx()%>'"><%=g.getGroup_name() != null ? g.getGroup_name() : "진행중인 챌린지 없음"%></button>
					<%
					}
					%>
				</div>
			</div>
		</div>
		</div>


		<script src="./js/profile.js"></script>

		<script>
		// Chart.js 라이브러리 로드
		const script = document.createElement('script');
		script.src = "https://cdn.jsdelivr.net/npm/chart.js";
		document.head.appendChild(script);
		var success = 0;
		if (<%=ch_count%> != 0) {
			success = <%=ch_suc_count%>/<%=ch_count%> *100;	
		}else {
			success = 0;
		}
		script.onload = function () {
		    const ctx = document.getElementById('challengeCompletionChart').getContext('2d');
		    const data = {
		        labels: ['완료된 챌린지', '미완료된 챌린지'],
		        datasets: [{
		            data: [success, 100-success], // 예시로 75% 완료된 상태를 표시합니다.
		            backgroundColor: ['#4caf50', '#e8e4de'],
		            hoverBackgroundColor: ['#45a049', '#ccc'],
		            borderWidth: 1
		        }]
		    };

		    const options = {
		        cutout: '70%', // 도넛형 그래프로 만들기 위해 가운데 부분을 잘라냅니다.
		        responsive: true,
		        plugins: {
		            legend: {
		                position: 'bottom'
		            }
		        }
		    };

		    new Chart(ctx, {
		        type: 'doughnut',
		        data: data,
		        options: options
		    });
		};
		
			// 팔로우
			$(document).on(
					'click',
					'.follow-button',
					function() {
						var input = {
							follower : $(this).data('follower'),
							following : $(this).data('following')
						};

						$.ajax({
							url : "follow",
							type : "post",
							contentType : "application/json; charset=UTF-8",
							data : JSON.stringify(input),
							success : function(data) {
								if (data == "true") {
									document.location.reload();
									var followButton = $('#followButton');
									if (followButton.text() === '팔로우') {
										followButton.text('언팔로우');
										followerCount
												.text(parseInt(followerCount
														.text()) + 1);
									} else {
										followButton.text('팔로우');
										followerCount
												.text(parseInt(followerCount
														.text()) - 1);
									}

								} else {
									alert("실패");
								}
							},
							error : function() {
								alert("통신실패")
							}

						})
					})
		</script>
</body>

</html>