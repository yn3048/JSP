<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.ProductDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prodNo = request.getParameter("prodNo");
	
	System.out.println();
	
	// 수정데이터 조회
	ProductDTO dto = null;
	
	try{
		//1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름
		
		//2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행 객체 생성
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `product` WHERE `prodNo` =?");
		psmt.setString(1, prodNo);
		
		//4단계 - SQL 실행
		ResultSet rs = psmt.executeQuery();
		
		//5단계 - 결과처리(SELECT 경우)
		if(rs.next()) {
			dto = new ProductDTO();
			dto.setProdNo(rs.getInt(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getInt(3));
			dto.setPrice(rs.getInt(4));
			dto.setCompany(rs.getString(5));
		}
		
		//6단계 - 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}

%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product::modify</title>
		<link rel="stylesheet" href="../css/shopStyle.css">
	</head>
	<body>
		<div id="form_wrap">
			<h3>Product 수정</h3>
			
			<a href="../../2.DBCP.jsp" class="nav">처음으로</a>
			<a href="./list.jsp" class="nav">목록보기</a>
			
			<form action="./modifyProc.jsp" method="post">
				<table border="0">
					<tr>
						<td>제품번호</td>
						<td>
							<input type="number" name="prodNo" readonly value="<%= dto.getProdNo() %>">
						</td>
					</tr>
						<tr>
						<td>제품명</td>
						<td>
							<input type="text" name="prodName" value="<%= dto.getProdName() %>">
						</td>
					</tr>
						<tr>
						<td>재고량</td>
						<td>
							<input type="number" name="stock" value="<%= dto.getStock() %>">
						</td>
					</tr>
						<tr>
						<td>가격</td>
						<td>
							<input type="number" name="price" value="<%= dto.getPrice() %>">
						</td>
					</tr>
					<tr>
						<td>제조회사</td>
						<td>
							<input type="text" name="company" value="<%= dto.getCompany() %>">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right" class="btn">
							<input type="submit" value="수정하기">
						</td>
					</tr>
				</table>
			</form>
		</div>

	</body>
</html>


