<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.User1DTO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// 데이터 설정
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";

	List<User1DTO> users = new ArrayList<>();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM `User1`");
		while(rs.next()) {
			User1DTO dto = new User1DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAge(rs.getInt(4));
			
			users.add(dto);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}

%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>user1 목록</h3>
		
		<a href="../1.jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<% for(User1DTO dto : users) { %>
			<tr>
				<td><%= dto.getUid() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getHp() %></td>
				<td><%= dto.getAge() %></td>
				<td> 
					<a href="./modify.jsp?uid=<%= dto.getUid() %>">수정</a>
					<a href="./delete.jsp?uid=<%= dto.getUid() %>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>








