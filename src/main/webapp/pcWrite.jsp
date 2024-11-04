<%@page import="com.smhrd.model.GroupDAO"%>
<%@page import="com.smhrd.model.Join"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.JoinDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reading Post</title>
    <link rel="stylesheet" href="./css/chWrite.css">
</head>
<body>
	<%
		Member member = (Member) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("login.jsp");
		}
		int idx = Integer.parseInt(request.getParameter("idx"));
		JoinDAO jdao = new JoinDAO();
		List<Join> list = jdao.selectMy(member.getId());
		GroupDAO gdao = new GroupDAO();
		
	%>
	<div class="card">
	    <!-- Back Button -->
	    <button class="back-button" onclick="history.back()">←</button>
	    
	<form action="pcWrite" method="post">
		    <input type="text" class="title" placeholder="제목" name="p_item_title">
		    <input type="hidden" name = "id" value = "<%=member.getId()%>">
		    <input type="hidden" name = "pc_idx" value = "<%=idx%>">
		    <!-- Label for Image Upload -->
		    <label for="file-input">
		        <img id="preview-image" src="https://via.placeholder.com/150x120" alt="Upload Image">
		    </label>
		    <input type="file" id="file-input" accept="image/*" onchange="previewImage(event)" name="pc_ocr">
		    
		    <input type="text" class="page-info-input" placeholder="페이지: 120~150p">
		    <textarea class="content" placeholder="자유 내용" name="p_item_desc"></textarea>
		    
		    <div class="footer">
		        
		        <button class="action-button" type="submit">글 작성</button>
		    </div>
	</form>
	</div>
<script>
    function previewImage(event) {
        const preview = document.getElementById('preview-image');
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

   
</script>

</body>
</html>
