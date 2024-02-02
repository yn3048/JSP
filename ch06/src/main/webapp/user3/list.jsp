<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.User3DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 데이터 설정
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";
	
	List<User3DTO> users = new ArrayList<>();
	
	try {
		// JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// SQL 실행객체 생성
		Statement stmt = conn.createStatement();
		
		// SQL 실행
		ResultSet rs = stmt.executeQuery("SELECT * FROM `User3`");
		
		// 결과처리 (SELECT경우)
		while(rs.next()){
			User3DTO dto = new User3DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setBirth(rs.getString(3));
			dto.setHp(rs.getString(4));
			dto.setAddr(rs.getString(5));
			
			users.add(dto);
		}
		
		// 데이터베이스 종료
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
		<title>user3::list</title>
	</head>
	<body>
		<h3>user3 목록</h3>
		
		<a href="../1.jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<% for(User3DTO dto : users) { %>
				<tr>
				<td><%= dto.getUid() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getBirth() %></td>
				<td><%= dto.getHp() %></td>
				<td><%= dto.getAddr() %></td>
				<td>
					<a href="./modify.jsp?uid=<%= dto.getUid() %>">수정</a>
					<a href="./delete.jsp?uid=<%= dto.getUid() %>">삭제</a>
				</td>
			</tr>
			
			<% } %>
		
		</table>
	</body>
</html>