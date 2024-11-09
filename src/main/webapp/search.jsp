<%@page import="com.smhrd.model.Group"%>
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
<%@page import="com.smhrd.model.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./css/searchResult.css">
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
		List<Join> mlist = jdao.selectMy(member.getId()); // 내 그룹 불러오기
		List<Pc_challenge> pcList = pcdao.selectAll(member.getId()); // 개인 챌린지 리스트
		Member_info member_info = infodao.info(member.getId()); // 본인 정보 가져오기
		List<Member_info> rank = infodao.rank(); // 랭킹 불러오기
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
                <form action="logout" method="post" style="display:inline;">
                    <button class="logout-button">로그아웃</button>
                </form>
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
                    	Group g = gdao.groupInfo(j.getGroup_idx());                    	
                    %>
	                    <button class="popup-button" onClick="location.href='groupChRoom.jsp?idx=<%=g.getGroup_idx()%>'"><%=g.getGroup_name() != null?g.getGroup_name() : "진행중인 챌린지 없음"%></button>
                    <%} %>
                </div>
            </div>
<div class="search-container">
    <%
        String type = (String) request.getAttribute("type");
    %>
    <table class="styled-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (type != null && type.equals("ch_review")) {
                List<Review> list = (List<Review>) request.getAttribute("list");
                for (Review r : list) {
                    String content = r.getReview_content();
                    // 내용이 40자를 넘으면 자르고 "..."을 추가
                    if (content.length() > 40) {
                        content = content.substring(0, 40) + "...";
                    }
        %>
            <tr>
                <td><%= r.getReview_idx() %></td>
                <td><%= r.getReview_title() %></td>
                <td><%= content %></td>
            </tr>
        <%
                }
            } else if (type != null && type.equals("ch_group")) {
                List<Group> list = (List<Group>) request.getAttribute("list");
                for (Group g : list) {
                    String desc = g.getGroup_desc();
                    // 설명이 40자를 넘으면 자르고 "..."을 추가
                    if (desc.length() > 40) {
                        desc = desc.substring(0, 40) + "...";
                    }
        %>
            <tr>
                <td><%= g.getGroup_idx() %></td>
                <td><%= g.getGroup_name() %></td>
                <td><%= desc %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3">검색결과가 없습니다</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

    </table>
</div>

	
	
	
	
	<script src="./js/searchResult.js"></script>
</body>
</html>