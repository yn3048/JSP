<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.User2DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// request Body JSON 문자열 스트림 처리
	request.setCharacterEncoding("utf-8");
	
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	String line;
	while((line = reader.readLine()) != null) {
		
		requestBody.append(line);
	}
	reader.close();
	
	// JSON 파싱
		Gson gson = new Gson();
		User2DTO user2 = gson.fromJson(requestBody.toString(), User2DTO.class);
		System.out.println(user2);
		
	// 데이터베이스 처리
	Context ctx = (Context)new InitialContext().lookup("java:comp/env");
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	PreparedStatement psmt = conn.prepareStatement("INSERT INTO `User2` VALUES (?,?,?,?)");
	psmt.setString(1, user2.getUid());
	psmt.setString(2, user2.getName());
	psmt.setString(3, user2.getBirth());
	psmt.setString(4, user2.getAddr());
	
	// row count 반환
	int result = psmt.executeUpdate();
	System.out.println("result : " + result);
	
	psmt.close();
	conn.close();
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
	
%>



















