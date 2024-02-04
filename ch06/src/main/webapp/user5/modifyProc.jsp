<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String seq    = request.getParameter("seq");
	String name   = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age 	  = request.getParameter("age");
	String addr   = request.getParameter("addr");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";
	
	try {
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - 데이터베이스 연결
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계 - SQL 실행 객체 생성
		String sql = "UPDATE `User5` SET ";
			   sql += "`name` =?,";
			   sql += "`gender` =?,";
			   sql += "`age` =?,";
			   sql += "`addr` =? ";
			   sql += "WHERE `seq` =?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		psmt.setString(5, seq);
		
		// 4단계 - SQL 실행
		psmt.executeUpdate();
		
		// 5단계 - 결과 처리(SELECT 경우)
		
		// 6단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	// 리스트 전송
	response.sendRedirect("./list.jsp");
%>






