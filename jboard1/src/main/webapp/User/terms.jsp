<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="kr.co.jboard1.dto.TermsDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//String host ="jdbc.mysql://127.0.0.1:3306/jboard";
	//String user ="dpsk3048";
	//String pass ="abc1234";
	
	//여기서 선언해야 html에서 출력가능
	TermsDTO dto = UserDAO.getInstance().selectTerms();

%>


<%@ include file="./_header.jsp" %>

        <main>
            <section class="terms">
                <table>
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= dto.getTerms() %></textarea>
                            <p>
                                <label><input type="checkbox" name="agree1">동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= dto.getPrivacy() %></textarea>
                            <p>
                                <label><input type="checkbox" name="agree2">동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/jboard1/User/login.jsp" class="btnCancel">취소</a>
                    <a href="/jboard1/User/register.jsp" class="btnNext">다음</a>
                </div>

            </section>
        </main>
        <footer>
            <p>copyrigit ⓒ이예나</p>
        </footer>
<%@ include file="./_footer.jsp" %>



