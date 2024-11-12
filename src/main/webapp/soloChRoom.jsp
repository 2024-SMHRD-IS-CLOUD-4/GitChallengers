<%@page import="java.time.LocalDate"%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인챌린지방</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/soloChRoom.css">
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
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
	JoinDAO jdao = new JoinDAO();
	GroupDAO gdao = new GroupDAO();
	Pc_challengeDAO pcdao = new Pc_challengeDAO();
	Pc_itemsDAO idao = new Pc_itemsDAO();
	int idx = Integer.parseInt(request.getParameter("idx")); // 방 인덱스
	Pc_challenge myInfo = new Pc_challenge(idx, member.getId());
	List<Join> list = jdao.selectMy(member.getId()); // 내 그룹 불러오기
	List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
	List<Pc_items> iList = idao.selectAll(idx); // 작성글 가져오기
	LocalDate now = LocalDate.now(); // 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
    String time = "0";
    if (iList != null && !iList.isEmpty()) {
	    Pc_items myItem = iList.get(0); // 내 최신글
	    time = myItem.getCreated_at();
		time = time.substring(0,10);
    }
    Pc_challenge roomInfo = pcdao.info(myInfo); // 방 정보
	int totalDays = roomInfo.getDays(); // 챌린지 전체 기간
	int totalCount = idao.count(idx); // 총 진행한 챌린지 수
	
	
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
                <form action="search">
             	       <select id="searchSelect" name="type">
                 	       <option value="ch_review">리뷰</option>
              	          <option value="ch_group">그룹 챌린지</option>
             	       </select>
	                    <input type="text" id="searchInput" class="hidden" placeholder="검색어를 입력하세요..." name="keyword">
	                    <input type="submit" value="검색">
                	</form>
            </div>            
            <!-- 사용자 환영 텍스트 추가 -->
            <a href="profile.jsp" class="welcome-text"><%=member.getNick() %>님 환영합니다</a>
            <form action="logoutCon">
	                <button class="logout-button">로그아웃</button>
            </form>
        </div>
    </div>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <div class="profile-upload">
               	<img src="profile_img/" class="profile-img" id="profilePreview" onerror="this.src='img/team-logo.png'">
            </div>
            <div class="profile-name"><%=member.getId() %></div>
            <%if (totalDays == totalCount) {%>
            <button class="button2" onClick="location.href='review.jsp'">리뷰 작성하기</button>
            <%}else { %>
            <button class="button">오늘의 챌린지 작성</button>
            <%} %>			
            <canvas id="challengeProgressChart" width="200" height="200"></canvas>
        </div>
 	<%@ page import="java.sql.*" %>

 	
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
                    <div class="card-header"></div>
                    <div class="book-title"><%=i.getP_item_title() %></div>
                    <div class="page-info"></div>
                    <div class="content-placeholder"><%=i.getP_item_desc() %></div>
                    
                </div>
                
            </div>
    	        	<%} %>
	            <%} %>
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

    <script src="./js/soloChRoom.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript">
	// 글 작성은 하루에 하나
    $(document).on('click', '.button', function() {
    	var now = <%=now%>;
    	var idx = <%= idx %>;
    	var time = <%=time%>;

    	if(now === time) {
    		alert('오늘의 챌린지를 이미 작성하였습니다');
    	}else {
    		document.location.href='pcWrite.jsp?idx='+idx;
    	}
    })
    // 그래프 초기화 코드 (soloChRoom.js)
	document.addEventListener("DOMContentLoaded", () => {
		var success = 0;
        var totalCount = <%= totalCount %>;  
        var totalDays = <%= totalDays %>;    

        // 성공률 계산
        if (totalDays != 0) {
            success = (totalCount / totalDays) * 100;
        } else {
            success = 0;
        }
		
	    const ctx = document.getElementById('challengeProgressChart').getContext('2d');
	
	    // 챌린지 진행 데이터 (예시)
	    const progressData = {
	        labels: ['완료한 챌린지', '남은 챌린지'],
	        datasets: [{
	            data: [success, 100-success], // 진행도 예시 (70% 완료, 30% 남음)
	            backgroundColor: ['#4caf50', '#e0e0e0'],
	            hoverOffset: 4
	        }]
	    };
	
	    // 도넛 차트 생성
	    const challengeProgressChart = new Chart(ctx, {
	        type: 'doughnut',
	        data: progressData,
	        options: {
	            responsive: true,
	            plugins: {
	                legend: {
	                    display: true,
	                    position: 'bottom'
	                }
	            }
	        }
	    });
	});
    </script>
</body>

</html>
