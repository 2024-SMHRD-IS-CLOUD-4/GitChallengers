<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.Member_info"%>
<%@page import="com.smhrd.model.Member_infoDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Review"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/pReview.css">
    <title>책 리뷰</title>
    <script src="./js/pReview.js"></script>
</head>
<body>
<%
	Member member = (Member) session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	}
	int idx = Integer.parseInt(request.getParameter("idx"));
	ReviewDAO rdao = new ReviewDAO();
	MemberDAO mdao = new MemberDAO();
	Member_infoDAO infodao = new Member_infoDAO();
	CommentDAO cdao = new CommentDAO();
	Review review = rdao.review(idx);
	Member reviewMember = mdao.memberInfo(review.getId());
	Member_info reviewMemberInfo = infodao.info(review.getId());
	
	
	
%>


    <div class="review-card">
        <div class="back-button">⬅</div>
        <div class="profile">
            <img src="profile_img/<%=reviewMemberInfo.getProfile_img() %>" alt="프로필">
            <div class="author"><%=reviewMember.getNick() %></div>
        </div>
        <div class="title"><%=review.getReview_title() %></div>
        <img src="<%= request.getContextPath() %>/img/pigbook-1.jfif" alt="책">
        <div class="content"><%=review.getReview_content() %></div>
        <div class="actions">
            <span class="like">❤</span>
            <span class="like-count">좋아요 10개</span>
            <span class="comment">💬</span>
            <span class="comment-count">댓글 <%=cdao.commentCount(idx) %>개</span>
        </div>
        <div class="comment-input" style="display: none;">
            <textarea rows="3" placeholder="댓글을 작성해주세요..."></textarea>
            <button>댓글 작성</button>
        </div>
        <div class="comments-section"></div>
    </div>
    <script type="text/javascript">
    	
    
    </script>
</body>
</html>