<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 데이터 수신
	String uid = request.getParameter("uid");
	
	// 데이터베이스 작업
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";

	try {
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계 - SQL 실행 객체 생성
		PreparedStatement psmt = conn.prepareStatement("DELETE FROM `User2` WHERE `uid` =?");
		psmt.setString(1, uid);
		
		// 4단계 - SQL 실행
		psmt.executeUpdate();
		
		// 5단계 - 결과처리(SELECT 경우)
		// 6단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>



