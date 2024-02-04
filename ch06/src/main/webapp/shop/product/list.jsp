<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProductDTO> products = new ArrayList<>();

	// DBCP를 이용한 데이터베이스 작업
	try {
		//1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름
		
		//2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행 객체 생성
		Statement stmt = conn.createStatement();
		
		//4단계 - SQL 실행
		ResultSet rs = stmt.executeQuery("SELECT * FROM `product`");
		
		//5단계 - 결과처리(SELECT)
		while(rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setProdNo(rs.getInt(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getInt(3));
			dto.setPrice(rs.getInt(4));
			dto.setCompany(rs.getString(5));
			
			products.add(dto);
		}
		
		//6단계 - 데이터베이스 종료
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
		<title>Product::list</title>
		<link rel="stylesheet" href="../css/shopStyle.css">
	</head>
	<body>
		<h3>Product 목록</h3>
		
		<a href="../../2.DBCP.jsp" class="nav">처음으로</a>
		<a href="./register.jsp" class="nav">등록하기</a>
		
		<table border="1">
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>재고량</th>
				<th>가격</th>
				<th>제조회사</th>
				<th>관리</th>
			</tr>
			<% for(ProductDTO dto : products) { %>
			<tr>
				<td><%= dto.getProdNo() %></td>
				<td><%= dto.getProdName() %></td>
				<td><%= dto.getStock() %></td>
				<td><%= dto.getPrice() %></td>
				<td><%= dto.getCompany() %></td>
				<td>
					<a href="./modify.jsp?prodNo=<%= dto.getProdNo() %>" class="btn_m">수정</a>
					<a href="./delete.jsp?prodNo=<%= dto.getProdNo() %>" class="btn_d">삭제</a>
				</td>
			</tr>
			
			<% } %>
			
		</table>
	</body>
</html>



