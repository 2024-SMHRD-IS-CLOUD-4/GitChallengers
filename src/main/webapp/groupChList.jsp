<%@page import="java.time.LocalDate"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Pc_challenge"%>
<%@page import="com.smhrd.model.Member_point"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="com.smhrd.model.Pc_challengeDAO"%>
<%@page import="com.smhrd.model.Member_pointDAO"%>
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
		JoinDAO jdao = new JoinDAO();
		ReviewDAO reviewdao = new ReviewDAO();
		List<Group> list = dao.selectAll(); // 그룹 챌린지 전체 리스트
		List<Join> myList = jdao.selectMy(member.getId()); // 내가 가입한 그룹 챌린지
		Pc_challengeDAO pcdao = new Pc_challengeDAO();
		List<Join> mlist = jdao.selectMy(member.getId()); // 내 그룹 불러오기
		List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
		String memberId = (member != null) ? member.getId() : null;
		int count = (memberId != null) ? pcdao.count(memberId) : 0;
		int myJoin1 = 0;
		int myJoin2 = 0;
		int myJoin3 = 0;
		if (myList.size() > 2 && myList.get(2) != null){
			myJoin1 = myList.get(0).getGroup_idx();
			myJoin2 = myList.get(1).getGroup_idx();
			myJoin3 = myList.get(2).getGroup_idx();
		}else if (myList.size() > 1  && myList.get(1) != null){
			myJoin1 = myList.get(0).getGroup_idx();
			myJoin2 = myList.get(1).getGroup_idx();
		}else if (myList.size() > 0  && myList.get(0) != null){
			myJoin1 = myList.get(0).getGroup_idx();
		}
		String now = LocalDate.now().toString(); // 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		
		
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
            <i class="fas fa-bell"></i>
		    <a href="profile.jsp" class="welcome-text"><%=member.getNick() %>님 환영합니다</a>
        	<button class="create-group-btn" id="createGroup">그룹 만들기</button>
    		<form action="logoutCon">
		     <button class="logout-button">로그아웃</button>
		    </form>
    	</div>
    </div>


    <!-- 메인 컨테이너 -->
    <div class="main-container">
    <%
    	for(Group g : list) {
    		String created = g.getCreated_at().substring(0, 10);
    		if(now.equals(created)){
	    		int idx = g.getGroup_idx();
	    		int gcount = jdao.count(idx);
	    		List<Join> joinMember = jdao.selectAll(idx);
	    		boolean isJoined = false;
	    		Member managerInfo = mdao.memberInfo(g.getManager());
	    		String manager = (managerInfo != null) ? managerInfo.getNick() : "Unknown";
    %>
        <!-- 그룹 카드 1 -->
        <div class="group-card">
            <div class="profile" data-id="<%=managerInfo.getId()%>">
               <img src="<%= (infodao.info(managerInfo.getId()).getProfile_img() == null || infodao.info(managerInfo.getId()).getProfile_img().isEmpty()) ? "img/team-logo.png" : "profile_img/" + infodao.info(managerInfo.getId()).getProfile_img() %>" alt="방장 프로필">
                <span><%=manager%></span>
            </div>
            <div class="content" data-idx="<%=idx%>">
                <h3><%=g.getGroup_name()%></h3>
                <p><%=g.getGroup_desc() %></p>
                <div class="details">
                    현재 참가인원 <%=gcount%>/<%=g.getGroup_max() %><br>
                    <strong><%=g.getDays() %>일 챌린지</strong>
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
					<%for (Join j : mlist) {
					Group gr = dao.groupInfo(j.getGroup_idx());                    	
					%>
					<button class="popup-button" onClick="location.href='groupChRoom.jsp?idx=<%=gr.getGroup_idx()%>'"><%=gr.getGroup_name() != null?gr.getGroup_name() : "진행중인 챌린지 없음"%></button>
					<%} %>
				</div>
			</div>
            	<%for(Join j : joinMember) {
            		if(member.getId().equals(j.getId())) {	
            			isJoined = true;
					}%>
	            <%} %>
           	<%if (member.getId().equals(g.getManager()) || isJoined) { %>
            	<button class="join-button" onClick="location.href='groupChRoom.jsp?idx=<%=idx%>'">참여중</button>
            <%}else if(count >= g.getGroup_max()) { %>	
            	<button class="join-button">입장 불가</button>
            <%}else { %>
            	<button class="join-button" onClick="join(<%=idx%>, <%=count%>, <%=g.getGroup_max()%>)">참가하기</button>
            <%} %>
        </div>
    <%} %>
    <%} %>

    </div>
    <script src="./js/groupChList.js"></script>
    <script type="text/javascript">
    $(document).on('click', '.content', function() {
    	var idx = $(this).data('idx');
    	var myIdx1 = <%=myJoin1%>
        var myIdx2 = <%=myJoin2%>
        var myIdx3 = <%=myJoin3%>
    	if (idx == myIdx1 || idx == myIdx2 || idx == myIdx3){
    		document.location.href="groupChRoom.jsp?idx="+idx
    	}
    })
    
    
    $('#createGroup').on('click', () => {
    	if(<%=jdao.countGc(member.getId())%> > 3){
			alert('가입중인 챌린지가 3개 입니다');
    	}else if (<%=infodao.info(member.getId()).getPoint()%> < 1000){
			alert('포인트 부족');
    	}else if (<%=reviewdao.count(member.getId())%> < 5) {
    		alert('챌린지 완료횟수 부족');
    	}else {
    		location.href="groupCh.jsp"
    	}
    	
    })
    
    
    $(document).on('click', '.profile', function() {
		var id = $(this).data('id');
		
		// 폼을 동적으로 생성하여 POST 방식으로 데이터 전송
	    var form = $('<form>', {
	        method: 'POST',
	        action: 'profile.jsp'
	    });

	    // 'id' 파라미터 추가
	    form.append($('<input>', {
	        type: 'hidden',
	        name: 'id',
	        value: id
	    }));

	    // 폼 제출
	    $('body').append(form);
	    form.submit();		
	})
	$(document).ready(function() {
		const join = (idx, count, max) => {
			if (count >= max) {
	        	alert('인원초과');
			}else if(<%=jdao.countGc(member.getId())%> >= 3){
				alert('가입중인 챌린지가 3개 입니다');
			}else if(<%=infodao.info(member.getId()).getPoint()%> < 1000){
				alert('포인트 부족');
			}else{
	        	var id = "<%=member.getId() %>";
				$.ajax({
				   url: 'groupJoinCon',
				   method: 'post',
				   data: { "idx": idx, "id": id },
				   success: function(data) {
				      if (data === 'true') {
				         alert("가입 성공");
				         location.reload(true);
				      } else {
				         alert("가입 실패");
				         location.reload(true);
				      }
				   },
				   error: function() {
				      alert("통신실패");
				      location.reload(true);
				   }
				});
	      }
	   };

   window.join = join;
});
    </script>
</body>
</html>