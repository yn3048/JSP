<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.User2DTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<User2DTO> user2s = new ArrayList<>();
	
	try{
		// 1단계 - JNDI 서비스 객체 생성
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		
		// 2단계 = 커넥션풀 객체 생성
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn =  ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `User1`");
		
		while(rs.next()) {
			
			User2DTO user2 = new User2DTO();
			user2.setUid(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setBirth(rs.getString(3));
			user2.setAddr(rs.getString(4));
			user2s.add(user2);
			
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	// JSON 출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user2s);
	out.print(strJson);

%>