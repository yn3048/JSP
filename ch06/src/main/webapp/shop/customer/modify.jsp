<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.CustomerDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String custId = request.getParameter("custId");
	
	System.out.println("custId: " + custId);
	
	// 수정 데이터 조회
	
	CustomerDTO dto = null;
	
	try {
		//1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
		
		//2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행 객체 생성
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `Customer` WHERE `custId` =?");
		psmt.setString(1, custId);
		
		//4단계 - SQL 실행
		ResultSet rs = psmt.executeQuery();
		
		
		//5단계 - 결과처리(SELECT경우)
		if(rs.next()) {
			dto = new CustomerDTO();
			dto.setCustId(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddr(rs.getString(4));
		}
		//6단계 - 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
		
		
	} catch(Exception e) {
		e.printStackTrace();
	}

	System.out.println("dto: " + dto);

%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer::modify</title>
		<link rel=stylesheet href="../css/shopStyle.css">
	</head>
	<body>
		<div id="form_wrap">
			<h3>Customer 수정</h3>
			
			<a href="../../2.DBCP.jsp" class="nav">처음으로</a>
			<a href="./list.jsp" class="nav">목록보기</a>
			<form action="./modifyProc.jsp" method="post">
				<table border="0">
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="custId" readonly value="<%= dto.getCustId() %>">
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="name" value="<%= dto.getName() %>">
						</td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td>
							<input type="text" name="hp" value="<%= dto.getHp() %>">
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" name="addr" value="<%= dto.getAddr() %>">
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