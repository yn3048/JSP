<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid 	  = request.getParameter("uid");
	String name   = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age 	  = request.getParameter("age");
	String hp 	  = request.getParameter("hp");
	String addr   = request.getParameter("addr");
	
	int result = 0;
	
	try {
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn =  ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("UPDATE `User4` SET `name`=?, `gender`=? ,`age`=?, `hp`=?, `addr`=? WHERE `uid`=?");
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, hp);
		psmt.setString(5, addr);
		psmt.setString(6, uid);
		
		result = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	// Json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());

%>















