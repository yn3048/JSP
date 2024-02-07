<%@page import="sub1.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
					//session getAttribute()메서드는 다양한 형태의 데이터 타입이 올 수 있기 때문에 
					//항상 Object으로 반환한다
					//but 실제로 세션에서 가져온 객체가 UserDTO 타입으로 저장되어 있지 않으면 실행 중에
					//ClassCastException이 발생할 수 있다
					//따라서 Object 타입을 UserDTO로 다운캐스팅 해줌
	 UserDTO user = (UserDTO)session.getAttribute("sessUser");
	 
	 if(user == null) {
		 response.sendRedirect("../2.Session.jsp?login=require");
		 return; // 처리 종료 (여기서 종료를 시켜주지 않으면 아래 코드들이 진행되기 때문에 오류가 발생함)
	 } 

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%= user.getName() %>님 반갑습니다.<br> 
			<a href="./logout.jsp">로그아웃</a>
		</p>
		
	</body>
</html>



