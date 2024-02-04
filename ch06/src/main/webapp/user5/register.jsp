<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User5::register</title>
<link rel="stylesheet" href="../css/style.css">
</head>

<body>
	<div id="form_wrap">
		<h3>User5 등록</h3>

		<a href="../1.jdbc.jsp" class="nav">처음으로</a>
		<a href="./list.jsp" class="nav">목록보기</a>
		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>번호</td>
					<td>
						<input type="number" name="seq" placeholder="숫자만 입력하세요.">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="text" name="gender" placeholder="예시) 남자:M 여자:F">
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>
						<input type="text" name="age">
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
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>