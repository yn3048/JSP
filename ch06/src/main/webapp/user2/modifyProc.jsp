<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	// 데이터 수신
	String uid 	 = request.getParameter("uid");
	String name  = request.getParameter("name");
	String birth = request.getParameter("birth");
	String addr  = request.getParameter("addr");
	
	// 데이터베이스 작업
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "UPDATE `User2` SET";
			   sql += "`name` =?,";
			   sql += "`birth`=?,";
			   sql += "`addr` =? ";
			   sql += "WHERE `uid`=?";
			   
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, addr);
		psmt.setString(4, uid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");


%>