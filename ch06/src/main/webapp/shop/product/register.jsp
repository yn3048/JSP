<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product::register</title>
		<link rel="stylesheet" href="../css/shopStyle.css">
	</head>
	<body>
		<div id="form_wrap">
			<h3>Product 등록</h3>
			<a href="../../2.DBCP.jsp" class="nav">처음으로</a>
			<a href="./list.jsp" class="nav">목록보기</a>
			
			<form action="./registerProc.jsp" method="post">
				<table border="1">
					<tr>
						<td>제품번호</td>
						<td>
							<input type="number" name="prodNo" min="0">
						</td>
					</tr>
					<tr>
						<td>제품명</td>
						<td>
							<input type="text" name="prodName">
						</td>
					</tr>
					<tr>
						<td>재고량</td>
						<td>
							<input type="number" name="stock">
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
							<input type="number" name="price">
						</td>
					</tr>
					<tr>
						<td>제조회사</td>
						<td>
							<input type="text" name="company">
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