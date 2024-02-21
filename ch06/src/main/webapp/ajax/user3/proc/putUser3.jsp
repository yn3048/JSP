<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid 	 = request.getParameter("uid");
	String name  = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp 	 = request.getParameter("hp");
	String addr  = request.getParameter("addr");
	
	System.out.println("uid : " + uid);
	System.out.println("name : " + name);
	System.out.println("birth : " + birth);
	System.out.println("hp : " + hp);
	System.out.println("addr : " + addr);
	
	int result = 0;
	
	try {
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn =  ds.getConnection();
		
		
		PreparedStatement psmt = conn.prepareStatement("UPDATE `User3` SET `name`=?, `birth`=?, `hp`=?, `addr`=? WHERE `uid`=?");
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, hp);
		psmt.setString(4, addr);
		psmt.setString(5, uid);
		
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




