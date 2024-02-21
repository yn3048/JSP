<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax::user3</title>
<!-- 
			날짜 : 2024/02/15
			이름 : 이예나
			내용 : JSP AJAX 실습하기
		
		 -->

<script>
		window.onload = function() {
			
			// 사용자 등록
			const btnSubmit = document.getElementsByName('submit')[0];
			const formUser3 = document.getElementsByTagName('form')[0];
			
			btnSubmit.onclick = (e) => {
				e.preventDefault();
				
				const uid	 = document.user3Form.uid.value;
				const name 	 = document.user3Form.name.value;
				const birth  = document.user3Form.birth.value;
				const hp 	 = document.user3Form.hp.value;
				const addr 	 = document.user3Form.addr.value;
				
				// JSON 생성
				const jsonData = {
						"uid" 	: uid,
						"name" 	: name,
						"birth" : birth,
						"hp" 	: hp,
						"addr" 	: addr
										
				};
				
				// JSON 문자열 변환
				const strJson =  JSON.stringify(jsonData);		
				console.log('jsonData : ' + jsonData);
				
				// 서버 전송
				fetch('./proc/postUser3.jsp', {
						method: 'POST',
						headers: {
		 					"Content-Type": "application/json",
		 				},
		 				body: strJson
					})
					.then(response => response.json())
					.then((data)=>{
						console.log(data);
						if(data.result > 0){
							alert('등록 성공!');
							
							// 목록 이동
							location.href = './list.jsp';
							
						}else{
							alert('등록 실패!');
						}
						
					})
					.catch((err) => {
						console.log(err);
					});
		
			}
			
			
		
			}
	</script>
</head>
<body>
	<h3>user3 등록</h3>
	<form action="#" name="user3Form">
		<a  href="./list.jsp">목록보기</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td colspan="2" align="right" class="btn"><input type="submit"
					name="submit" value="등록하기"></td>
			</tr>

		</table>

	</form>
</body>
</html>



















