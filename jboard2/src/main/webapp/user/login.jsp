<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="_header.jsp" %>

<script>
	// URL에서 regSuccess 파라미터 값을 가져옴
	var urlParams = new URLSearchParams(window.location.search);
	var regSuccess = urlParams.get('regSuccess');
	
	// 만약 regSuccess가 'true'이면 알림창 표시
	if (regSuccess === 'true') {
	    alert("회원가입이 성공적으로 완료되었습니다!.🥳🥳");
	}// 회원가입 성공 시 알림

</script>
<script>
	// JSTL 문법인데 JSP 자바스크립트 내에서 라이브러리 없이 사용할 수 있다
	const success = ${success};
	// 로그인 실패나 세션이 만료된 경우를 체크하는 코드
	if(success == 100) {
	    alert("로그인 실패했습니다. 다시 한번 아이디, 비밀번호를 확인하십시오.");
	} else if(success == 101) {
	    alert("먼저 로그인을 하셔야 합니다.");
	}

</script>

        <main id="user">
            <section class="login">
                <form action="/jboard2/user/login.do" method="post">
                    <table border="0">
                        <tr>
                            <td><img src="/jboard2/img/login_ico_id.png" alt="아이디"/></td>
                            <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
                        </tr>
                        <tr>
                            <td><img src="/jboard2/img/login_ico_pw.png" alt="비밀번호"/></td>
                            <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인" class="btnLogin"/>
                    
                </form>
                <div>
                    <h3>회원 로그인 안내</h3>
                    <p>
                        아직 회원이 아니시면 회원으로 가입하세요.
                    </p>
                    <div style="text-align: right;">
                        <a href="#">아이디 |</a>
                        <a href="#">비밀번호찾기 |</a>
                        <a href="/jboard2/user/terms.do">회원가입</a>
                    </div>                    
                </div>
            </section>
        </main>
<%@ include file="_footer.jsp" %>



