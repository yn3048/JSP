<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User2::register</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div id="form_wrap">
		<h3>User2 등록</h3>

		<a href="../1.jdbc.jsp" class="nav">처음으로</a>
		<a href="./list.jsp" class="nav">목록보기</a>

		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="uid">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="birth">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="addr">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right" class="btn">
						<input type="submit" value="등록하기" >
					</td>
				</tr>

			</table>

		</form>
	</div>

</body>
</html>