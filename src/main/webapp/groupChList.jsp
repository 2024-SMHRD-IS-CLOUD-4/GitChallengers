<%@page import="com.smhrd.model.Join"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/groupChList.css">
<script src="js/jquery-3.7.1.min.js"></script>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		
		GroupDAO dao = new GroupDAO();
		List<Group> list = dao.selectAll();
	%>
    <!-- 헤더 -->
    <div class="header">
        <div class="title">
            <img src="img/team-logo.png" alt="logo">
            <span><%=member.getNick()%>님 환영합니다!</span>
        </div>
        
        <!-- 검색창 -->
        <div class="search-bar">
            <input type="text" placeholder="검색어를 입력하세요">
        </div>

        <button class="create-group-btn" onClick="location.href='groupCh.jsp'">그룹 만들기</button>
    </div>


    <!-- 메인 컨테이너 -->
    <div class="main-container">
    <%
    	for(Group g : list) {
    		int idx = g.getGroup_idx();
    		JoinDAO jdao = new JoinDAO();
    		int count = jdao.count(idx);
    		List<Join> joinMember = jdao.selectAll(idx);
    		boolean isJoined = false;
    %>
        <!-- 그룹 카드 1 -->
        <div class="group-card">
            <div class="profile" onClick="location.href='groupChRoom.jsp?idx=<%=idx%>'">
                <img src="#" alt="반장 프로필">
                <span><%=g.getManager()%></span>
            </div>
            <div class="content" onClick="location.href='groupChRoom.jsp?idx=<%=idx%>'">
                <h3><%=g.getGroup_name()%></h3>
                <p><%=g.getGroup_desc() %></p>
                <div class="details">
                    현재 참가인원 <%=count%>/<%=g.getGroup_max() %><br>
                    <strong>14일 후 종료 예정</strong>
                </div>
            </div>
            	<%for(Join j : joinMember) {
            		if(member.getId().equals(j.getId())) {	
            			isJoined = true;
					}%>
	            <%} %>
           	<%if (member.getId().equals(g.getManager()) || isJoined) { %>
            	<button class="join-button">참여중</button>
            <%}else if(count >= g.getGroup_max()) { %>	
            	<button class="join-button">입장 불가</button>
            <%}else { %>
            	<button class="join-button" onClick="join(<%=idx%>, <%=count%>, <%=g.getGroup_max()%>)">참가하기</button>
            <%} %>
        </div>
    <%} %>

    </div>
    <script type="text/javascript">
    	const join = (idx, count, max) => {
    		if (count >= max) {
    			alert('인원초과');
    		}else{
	    		var id = "<%=member.getId() %>"
	    		$.ajax({
	    			url : 'groupJoinCon',
	    			method : 'post',
	    			data : {"idx":idx,"id":id},
	    			success : function(data){
						if(data === 'true'){ 
							alert("가입 성공");
							location.reload(true);
						}else { 
							alert("가입 실패");
							location.reload(true);
						}
					},
					error : function(){
						alert("통신실패");
						location.reload(true);
					}
	    			
	    		})
    		}
    	}
    	
    </script>
</body>
</html>