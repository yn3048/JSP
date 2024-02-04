<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp 	 = request.getParameter("hp");
	String addr  = request.getParameter("addr");

	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "UPDATE `User3` SET ";
			   sql += "`name` =?,";
			   sql += "`birth` =?,";
			   sql += "`hp` =?,";
			   sql += "`addr` =? ";
			   sql += "WHERE `uid`=?";
	    
	    PreparedStatement psmt = conn.prepareStatement(sql);
	    psmt.setString(1, name);
	    psmt.setString(2, birth);
	    psmt.setString(3, hp);
	    psmt.setString(4, addr);
	    psmt.setString(5, uid);
	    
	    psmt.executeUpdate();
	    
	    psmt.close();
	    conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");
%>






