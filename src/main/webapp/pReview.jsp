<%@page import="com.smhrd.model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Review_heartDAO"%>
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
<script src="js/jquery-3.7.1.min.js"></script>
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
	Review_heartDAO likedao = new Review_heartDAO();
	Review review = rdao.review(idx);
	Member reviewMember = mdao.memberInfo(review.getId());
	Member_info reviewMemberInfo = infodao.info(review.getId());
	List<Comment> commentList = cdao.commentList(idx);
	
	
%>


    <div class="review-card">
        <div class="back-button">⬅</div>
        <div class="profile">
            <img src="profile_img/<%= (reviewMemberInfo != null)? reviewMemberInfo.getProfile_img(): "" %>" alt="프로필">
            <div class="author"><%=reviewMember.getNick() %></div>
        </div>
        <div class="title"><%=review.getReview_title() %></div>
        <img src="<%= request.getContextPath() %>/img/pigbook-1.jfif" alt="책">
        <div class="content"><%=review.getReview_content() %></div>
        <div class="actions">
            <span class="like" data-id="<%=member.getId()%>" data-review_idx="<%=idx%>">❤</span>
            <span class="like-count">좋아요 <%=likedao.likeCount(idx) %>개</span>
            <span class="comment">💬</span>
            <span class="comment-count">댓글 <%=cdao.commentCount(idx) %>개</span>
        </div>
        <div class="comment-input">
            <textarea rows="3" placeholder="댓글을 작성해주세요..." id="comment"
            	 data-id="<%=member.getId()%>" data-review_idx="<%=idx%>"></textarea>
            <button class="check">댓글 작성</button>
        </div>
        <div class="comments-section">
        	<%
           		for(Comment c : commentList) {%>
           			<span><%=mdao.memberInfo(c.getId()).getNick() %> : </span>
           			<span><%=c.getCmt_content() %></span><br>
           	<%}%>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
        // 동적으로 생성되는 요소에 대해 이벤트 위임을 사용
        // 댓글 작성
		$(document).on('click', '.check', function() {
			
			var textarea = $(this).prev('textarea');
			
			var input = {
					cmt_content : textarea.val(),
					id : textarea.data('id'),
					review_idx : textarea.data('review_idx')
			};
			
			$.ajax({
				url : "reviewCommentWrite",
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
					review_idx : $(this).data('review_idx')
			};
			
			$.ajax({
				url : "reviewLike",
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
	})	
    
    </script>
</body>
</html>