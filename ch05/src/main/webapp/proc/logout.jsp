<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 현재 클라이언트 세션 삭제
	session.invalidate();

	// 자동 로그인 쿠키 삭제
	Cookie cookie = new Cookie("cid", null);
	cookie.setMaxAge(0);   // 쿠키 수명을 0으로 맞춰서 없애버림
	cookie.setPath("/ch05"); // 자동로그인 쿠키 셋팅 경로와 같아야 로그아웃이 잘 동작한다. 
	                         // 자동로그인 경로보다 하위 폴더에 지정할 경우 로그아웃 동작 안함
	response.addCookie(cookie);   // 삭제한 쿠키 클라이언트에 전달

	// 로그인 화면 이동
	response.sendRedirect("../2.Session.jsp?logout=success");
%>