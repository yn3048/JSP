<%@page import="dto.User5DTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<User5DTO> user5s = new ArrayList<>();
	
	try{
		// 1단계 - JNDI 서비스 객체 생성
		Context ctx = (Context)new InitialContext().lookup("java:comp/env");
		
		// 2단계 = 커넥션풀 객체 생성
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		Connection conn =  ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `User5`");
		
		while(rs.next()) {
			
			User5DTO user5 = new User5DTO();
			user5.setSeq(rs.getString(1));
			user5.setName(rs.getString(2));
			user5.setGender(rs.getString(3));
			user5.setAge(rs.getString(4));
			user5.setAddr(rs.getString(5));
			user5s.add(user5);
			
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	// JSON 출력
	Gson gson = new Gson();
	String strJson = gson.toJson(user5s);
	out.print(strJson);

%>





