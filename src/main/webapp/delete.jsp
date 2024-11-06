<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
String id = (String)session.getAttribute("id");

String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:XE";
String uid = "JSP";
String upw = "JSP";

Connection conn = null;
PreparedStatement psmt = null;

String sql = "delete from member where id=?";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// conn 생성
	conn = DriverManager.getConnection(url, uid, upw);
	// pstmt 생성
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, id);
	
	// sql 실행
	int result = psmt.executeUpdate();
	
	if(result == 1){ // 성공
		session.invalidate(); // 세션에 정보삭제
		response.sendRedirect("login.jsp");			
	} else{ // 실패
		request.setAttribute("errorMessage", "회원 정보를 찾을 수 없습니다."); // 오류 메시지 설정
		response.sendRedirect("main.jsp");
	}
	
} catch(Exception e){
	e.printStackTrace();
	request.setAttribute("errorMessage", "회원 탈퇴 중 오류가 발생했습니다. 관리자에게 문의하세요."); // 사용자 친화적인 오류 메시지
	request.getRequestDispatcher("error.jsp").forward(request, response); // 오류 페이지로 포워딩
	/* response.sendRedirect("login.jsp"); */
} finally{
	try{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	} catch(Exception e){
		e.printStackTrace();
	}
}

%>
</body>
</html>