<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.nio.Buffer"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="ch07.dto.FileDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fno = request.getParameter("fno");
	
	// 다운로드할 파일 정보 조회
	FileDTO fileDTO = null;
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `FileTest` WHERE `fno`=" + fno);
		
		if(rs.next()) {
			fileDTO = new FileDTO();
			fileDTO.setFno(rs.getInt(1));
			fileDTO.setTitle(rs.getString(2));
			fileDTO.setoName(rs.getString(3));
			fileDTO.setsName(rs.getString(4));
			fileDTO.setRdate(rs.getString(5));
			
		}
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	// 다운로드 헤더 설정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileDTO.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// response 파일 스트림 작업
	String uploadsPath = application.getRealPath("/uploads");
	
	File file = new File(uploadsPath + File.separator + fileDTO.getsName());
	out.clear();
	out = pageContext.pushBody();
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true) {
		int data = bis.read();
		if(data == -1) {
			break;
		}
		bos.write(data);
	}
	
	bos.close();
	bis.close();
	
%>





