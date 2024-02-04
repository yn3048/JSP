<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.User4DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 설정
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "dpsk3048";
	String pass = "abc1234";

	List<User4DTO> users = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계- SQL 객체 생성
		Statement stmt = conn.createStatement();
		
		// 4단계- SQL 실행
		ResultSet rs = stmt.executeQuery("SELECT * FROM `User4`");
		
		// 5단계- 결과처리(SELECT 경우)
		while(rs.next()) {
			User4DTO dto = new User4DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getString(4));
			dto.setHp(rs.getString(5));
			dto.setAddr(rs.getString(6));
			
			users.add(dto);
		}
		
		// 6단계- 데이터베이스 종료
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
		<title>user4::list</title>
		<link rel="stylesheet" href="../css/style.css">
	</head>
	<body>
		<h3>User4 목록</h3>
		
		<a href="../1.jdbc.jsp" class="nav">처음으로</a>
		<a href="./register.jsp" class="nav">등록하기</a>
		<table border="0">
			<tr>
	 			<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>관리</th>
			</tr>
			<% for(User4DTO dto : users) { %>
			<tr>
				<td><%= dto.getUid() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getGender() %></td>
				<td><%= dto.getAge() %></td>
				<td><%= dto.getHp() %></td>
				<td><%= dto.getAddr() %></td>
				<td>
					<a href="./modify.jsp?uid=<%= dto.getUid() %>" class="btn_m">수정</a>
					<a href="./delete.jsp?uid=<%= dto.getUid() %>" class="btn_d">삭제</a>
				</td>
			</tr>
			
			<% } %>
			
		</table>
		
		
		
		
	</body>
</html>




