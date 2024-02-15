<%@page import="dto.CustomerDTO"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<CustomerDTO> customers = new ArrayList<>();
	
	// DBCP를 이용한 데이터베이스 작업
	try {
		//1단계- JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); //JNDI 기본 환경이름
	
		//2단계- 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
	
		// 3단계- SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		//4단계- SQL 실행
		ResultSet rs = stmt.executeQuery("SELECT * FROM `customer`");
		
		//5단계- 결과처리(SELECT 경우)
		while(rs.next()) {
			CustomerDTO dto = new CustomerDTO();
			dto.setCustId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddr(rs.getString(4));
			dto.setRdate(rs.getString(5));
			
			customers.add(dto);
		}
		
		//6단계- 데이터베이스 종료(커넥션 반납)
		rs.close();
		stmt.close();
		conn.close();
	
	
	} catch(Exception e) {
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer::list</title>
		<link rel=stylesheet href="../css/shopStyle.css">
	</head>
	<body>
		<h3>Customer 목록</h3>
		
		<a href="../../2.DBCP.jsp" class="nav">처음으로</a>
		<a href="./register.jsp" class="nav">등록하기</a>
		<table border="0">	
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
			<% for(CustomerDTO dto : customers) { %>
			<tr>
				<td><%= dto.getCustId() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getHp() %></td>
				<td><%= dto.getAddr() %></td>
				<td><%= dto.getRdate() %></td>
				<td> 
					<a href="./modify.jsp?custId=<%= dto.getCustId() %>" class="btn_m">수정</a>
					<a href="./delete.jsp?custId=<%= dto.getCustId() %>" class="btn_d">삭제</a>
				</td>
			</tr>
			<% } %>
			
		</table>
	</body>
</html>








