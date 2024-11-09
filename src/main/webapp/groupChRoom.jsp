<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.smhrd.model.Gc_heartDAO"%>
<%@page import="com.smhrd.model.Gc_heart"%>
<%@page import="com.smhrd.model.Gc_commentDAO"%>
<%@page import="com.smhrd.model.Gc_comment"%>
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
<script src="js/jquery-3.7.1.min.js"></script>
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
	Gc_commentDAO gcdao = new Gc_commentDAO();
	Gc_heartDAO hdao = new Gc_heartDAO();
	int idx = Integer.parseInt(request.getParameter("idx")); // 방 인덱스
	Group group = dao.groupInfo(idx); // 방 정보
	List<Join> list = jdao.selectAll(idx); // 방 참가 인원 정보
	List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
    LocalDate now = LocalDate.now(); // 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
	Gc_items my = new Gc_items(idx, member.getId());
    List<Gc_items> myItemList = idao.getItem(my);
    Gc_items myItem = myItemList.get(0); // 내 최신글
    String time = myItem.getCreated_at();
	time = time.substring(0,10);
	
    
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
        	<%if (!member.getId().equals(group.getManager()) && !member.getId().equals(group.getSub_manager())) {%>
            <button class="kick-button">방장 추방</button>
            <form action="groupDelete">
	            <button type="submit">방 나가기</button>
	            <input type="hidden" name="group_idx" value="<%=idx%>">
            </form>
            <%} %>
            <div class="profile-upload">
               	<img src="profile_img/<%=infodao.info(group.getManager()).getProfile_img() %>" class="profile-img" id="profilePreview">
            </div>
            <div class="profile-name"><%=mdao.memberInfo(group.getManager()).getNick()%></div>
            <ul class="group-list">
            	<li class="group-item" data-id="<%=group.getSub_manager()%>">
					<img src="profile_img/<%=infodao.info(group.getSub_manager()).getProfile_img() %>">
					<span class="group-name"><%=mdao.memberInfo(group.getSub_manager()).getNick()%></span>
                </li>
                <%
                    for(Join j: list) {
                    	Member m = mdao.memberInfo(j.getId());
                    	if(!j.getId().equals(group.getManager()) && !j.getId().equals(group.getSub_manager())) {
                %>
			                <li class="group-item" data-id="<%=j.getId()%>">
			                    <img src="profile_img/<%=infodao.info(j.getId()).getProfile_img() %>">
			                    <span class="group-name"><%=m.getNick()%></span>
			                    <%if(member.getId().equals(group.getManager())) {%>
			                    <form action="memberDelete">
									<button type="submit">추방</button>
									<input type="hidden" name="group_idx" value = "<%=idx%>">
									<input type="hidden" name="id" value = "<%=j.getId()%>">
			                    </form>
			                    <%} %>
			                </li>
			                <% } %>
                	<% } %>
            </ul>
            <button class="button">오늘의 챌린지 작성</button>
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
                    <%	if (gi.getIs_success() == 'Y') {%>
                    	<span id="checkmark">✅</span>
                    <% 	}else if(member.getId().equals(group.getManager())) {%>
						<input type="checkbox" class="checkBox" data-g_item_idx="<%=gi.getG_item_idx()%>">
                   		<%}%>
                    <div class="book-title"><%= gi.getG_item_title() %></div>
                    <div class="page-info"></div>
                    <div class="content-placeholder"><%= gi.getG_item_desc() %></div>
                </div>
                
                <div class="actions">
                    <span class="like" id="like" data-id="<%=member.getId() %>" data-g_item_idx="<%=gi.getG_item_idx()%>">❤</span>
                    <span class="like-count">좋아요 <%=hdao.likeCount(gi.getG_item_idx()) %>개</span>
                    <span class="comment">💬</span>
                    <span class="comment-count">댓글 <%=gcdao.commentCount(gi.getG_item_idx()) %>개</span>
                </div>
                
                <div class="comment-input" >
                    <textarea rows="3" placeholder="댓글을 작성해주세요..." id="comment"
                    			data-g_item_idx="<%=gi.getG_item_idx()%>" data-id="<%=member.getId() %>"></textarea>
                    <button class="check">댓글 작성</button>
                </div>
                <div class="comments-section">
                	<%
                		List<Gc_comment> commentList = gcdao.commentList(gi.getG_item_idx());
                		for(Gc_comment gc : commentList) {%>
                			<span><%=mdao.memberInfo(gc.getId()).getNick() %> : </span>
                			<span><%=gc.getCmt_content() %></span><br>
                	<%}%>
                </div>
            </div>
        
    	        	<%}else {%>
    	        	<span>등록된 챌린지가 없습니다</span>
    	        	<%} %>
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

    <script src="./js/groupChRoom.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	// 글 작성은 하루에 하나
	    $(document).on('click', '.button', function() {
	    	var now = <%=now%>;
	    	var time = <%=time%>;
	    	var idx = <%= idx %>;
	    	
	    	if(now === time) {
	    		alert('오늘의 챌린지를 이미 작성하였습니다');
	    	}else {
	    		document.location.href='chWrite.jsp?idx='+idx;
	    	}
	    })
    
    	// 승인버튼
		$(document).on('click', '.checkBox', function() {
			var input = {
					g_item_idx : $(this).data('g_item_idx')
			};
			
			$.ajax({
				url : "checkBox",
				type : "post",
				contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(input),
				success : function(data){
					if (data == "true") {
						document.location.reload(); 
		            } else {
		                alert("실패");  
		            }
				},
				error : function(){
					alert("통신실패")
				}
				
			})  		
		})
    	
        // 동적으로 생성되는 요소에 대해 이벤트 위임을 사용
        // 댓글 작성
		$(document).on('click', '.check', function() {
			
			var textarea = $(this).prev('textarea');
			
			var input = {
					comment : textarea.val(),
					writerId : textarea.data('id'),
					g_item_idx : textarea.data('g_item_idx')
			};
			
			$.ajax({
				url : "gc_commentWrite",
				type : "post",
				contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(input),
				success : function(data){
					if (data == "true") {
						document.location.reload(); 
		            } else {
		                alert("실패");  
		            }
				},
				error : function(){
					alert("통신실패")
				}
				
			})  		
		})
		
		// 좋아요
		$(document).on('click', '.like', function() {
			var input = {
					id : $(this).data('id'),
					g_item_idx : $(this).data('g_item_idx')
			};
			
			$.ajax({
				url : "gc_like",
				type : "post",
				contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(input),
				success : function(data){
					if (data == "true") {
						document.location.reload(); 
		            } else {
		                alert("실패");  
		            }
				},
				error : function(){
					alert("통신실패")
				}
				
			})  		
		})
	    $(document).on('click', '.group-item', function() {
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
	})
	
	
	
    </script>
</body>

</html>
