<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

        <main>
            <section class="login">
                <form action="/jboard1/User/Proc/loginProc.jsp" method="post">
                    <table border="0"> <!-- tbody - tr -->
                        <tr>
                            <td><img src="/jboard1/images/login_ico_id.png" alt="아이디"></td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력">
                            </td>
                        </tr>
                        <tr>
                            <td><img src="/jboard1/images/login_ico_pw.png" alt="비밀번호"></td>
                            <td>
                                <input type="password" name="pass" placeholder="비밀번호 입력">
                            </td>
                        </tr>
                        <input type="submit" value="로그인" class="btnLogin">
                    </table>
                </form><!-- form end -->

                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>아직 회원이 아니시면 회원으로 가입하세요.</p>
                    <!-- 
                    	화면설계(HTML)는 상대경로 지정 : ./ ../
                    	화면구현(JSP)는 절대경로 지정 : /Context root 로 시작
                     -->
                    <a href="/jboard1/User/terms.jsp">회원가입</a>
                </div>
            </section><!-- login end -->


        </main>
<%@ include file="./_footer.jsp" %>


