<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq 	  =request.getParameter("seq");
	String name   =request.getParameter("name");
	String gender =request.getParameter("gender");
	String age    =request.getParameter("age");
	String addr   =request.getParameter("adr");
	
	int result = 0;
	
	try {
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn =  ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("UPDATE `User5` SET `name`=?, `gender`=?, `age`=?, `addr`=? WHERE `seq`=?");
		psmt.setString(1, name);
		psmt.setString(2, gender);
		psmt.setString(3, age);
		psmt.setString(4, addr);
		psmt.setString(5, seq);
		
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
