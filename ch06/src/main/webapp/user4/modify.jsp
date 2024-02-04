<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.User4DTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String uid = request.getParameter("uid");
System.out.println();

// 수정 데이터 조회
String host = "jdbc:mysql://127.0.0.1:3306/studydb";
String user = "dpsk3048";
String pass = "abc1234";

User4DTO dto = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(host, user, pass);

	PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User4` WHERE `Uid` =?");
	psmt.setString(1, uid);

	ResultSet rs = psmt.executeQuery();

	if (rs.next()) {
		dto = new User4DTO();
		dto.setUid(rs.getString(1));
		dto.setName(rs.getString(2));
		dto.setGender(rs.getString(3));
		dto.setAge(rs.getString(4));
		dto.setHp(rs.getString(5));
		dto.setAddr(rs.getString(6));
	}

	psmt.close();
	conn.close();

} catch (Exception e) {
	e.printStackTrace();
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user4::수정</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div id="form_wrap">
		<h3>User4 수정</h3>

		<a href="../1.jdbc.jsp" class="nav">처음으로</a>
		<a href="./list.jsp" class="nav">목록보기</a>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="uid" readonly value="<%=dto.getUid()%>">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" value="<%=dto.getName()%>">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="text" name="gender" value="<%=dto.getGender()%>">
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>
						<input type="text" name="age" value="<%=dto.getAge()%>">
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="text" name="hp" value="<%=dto.getHp()%>">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="addr" value="<%=dto.getAddr()%>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" class="btn">
						<input type="submit" value="수정하기" >
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>



</html>







