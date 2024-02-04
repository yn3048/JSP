<%@page import="javax.swing.SpinnerDateModel"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	
	// DBCP를 이용한 데이터베이스 작업
	try{
		//1단계 -  JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
		
		//2단계 -  커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행객체 생성
		String sql = "UPDATE `Customer` SET ";
			   sql += "`name` =?,";
			   sql += "`hp` =?,";
			   sql += "`addr` =? ";
			   sql += "WHERE `custId` =?";
		
		//4단계 - SQL 실행
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, addr);
		psmt.setString(4, custId);
		
		psmt.executeUpdate();
		//5단계 - 결과처리
		//6단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>


