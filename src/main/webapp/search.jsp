<%@page import="com.smhrd.model.Group"%>
<%@page import="com.smhrd.model.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String type = (String) request.getAttribute("type");
	%>
	<form action="search">
		<select name="type">
			<option value="ch_review">리뷰</option>
			<option value="ch_group">그룹 챌린지</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어 입력">
		<input type="submit" value="검색">
	</form>
	<table>
	<%
		if (type != null && type.equals("ch_review")){
			List<Review> list = (List<Review>) request.getAttribute("list");
			for(Review r : list){%>
			<tr>
				<td><%=r.getReview_idx() %></td>			
				<td><%=r.getReview_title() %></td>
				<td><%=r.getReview_content() %></td>
			</tr>
	<%}
		}else if (type != null && type.equals("ch_group")){
			List<Group> list = (List<Group>) request.getAttribute("list");
			for(Group g: list) {%>
			<tr>
				<td><%=g.getGroup_idx() %></td>			
				<td><%=g.getGroup_name() %></td>
				<td><%=g.getGroup_desc() %></td>
			</tr>
			<%}
			}else {%>
				<tr>검색결과가 없습니다</tr>
			<%} %>
			
	</table>
	
	
	
	
	
</body>
</html>