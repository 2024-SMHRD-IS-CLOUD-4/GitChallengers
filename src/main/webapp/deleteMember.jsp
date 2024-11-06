<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	
    // 세션에서 로그인한 사용자의 ID를 가져옵니다.
    String userId = (String) session.getAttribute("id");
	String userPw = (String) session.getAttribute("pw");
	   	

    // 만약 세션에 user_id가 없다면, 로그인 페이지로 리다이렉트합니다.
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // 데이터베이스 연결 정보
    String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe"; // DB URL
    String username = "campus_24IS_CLOUD1_p2_6"; // DB 사용자명
    String password = "smhrd6"; // DB 비밀번호

    Connection conn = null;
    PreparedStatement pstmt = null;
    
    // 회원 탈퇴 SQL 쿼리
    String sql = "delete from player where id=? and pw=? ";

    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, username, password);
        
        // SQL문 준비 및 파라미터 설정
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        
        // SQL 실행
        int result = pstmt.executeUpdate();
        
        if (result > 0) { // 탈퇴 성공
            session.invalidate(); // 세션 무효화
            response.sendRedirect("login.jsp"); // 로그인 페이지로 이동
        } else { // 탈퇴 실패 (ID가 존재하지 않는 경우)
            request.setAttribute("errorMessage", "회원 정보를 찾을 수 없습니다.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace(); // 오류 로그 출력
        request.setAttribute("errorMessage", "회원 탈퇴 중 오류가 발생했습니다.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    } finally {
        // 리소스 해제
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>