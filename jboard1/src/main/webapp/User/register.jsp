<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="./_header.jsp" %>
      <main>
        <section class="register">
          <form action="/jboard1/User/Proc/registerProc.jsp" method="post">
            <table border="0">
              <caption>
                사이트 이용정보 입력
              </caption>
              <tr>
                <td>아이디</td>
                <td>
                  <input type="text" name="uid" required placeholder="아이디 입력" />
                  <button>
                    <img src="../images/chk_id.gif" alt="아이디 중복체크" />
                  </button>
                  <span class="result_uid"></span>
                </td>
              </tr>
              <tr>
                <td>비밀번호</td>
                <td>
                  <input
                    type="password"
                    name="pass1"
                    placeholder="비밀번호 입력"
                    required
                  />
                </td>
              </tr>
              <tr>
                <td>비밀번호 확인</td>
                <td>
                  <input
                    type="password"
                    name="pass2"
                    placeholder="비밀번호 입력 확인"
                  />
                  <span class="result_pass"></span>
                </td>
              </tr>
            </table>
            <table border="0">
              <caption>
                개인정보 입력
              </caption>
              <tr>
                <td>이름</td>
                <td>
                  <input type="text" name="name" placeholder="이름 입력" required/>
                </td>
              </tr>
              <tr>
                <td>별명</td>
                <td>
                  <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                  <input type="text" name="nick" placeholder="별명 입력"  required/>
                  <span class="result_nick"></span>
                </td>
              </tr>
              <tr>
                <td>Email</td>
                <td>
                  <input type="email" name="email" placeholder="이메일 입력" />
                </td>
              </tr>
              <tr>
                <td>휴대폰</td>
                <td>
                  <input
                    type="text"
                    name="hp"
                    placeholder="- 포함 13자리 입력"
                    minlength="13"
                    maxlength="13"
                    required
                  />
                </td>
              </tr>
              <tr>
                <td>주소</td>
                <td>
                  <div>
                    <input
                      type="text"
                      name="zip"
                      placeholder="우편번호"
                      readonly
                    />
                    <button>
                      <img src="../images/chk_post.gif" alt="우편번호 검색" />
                    </button>
                  </div>
                  <div>
                    <input
                      type="text"
                      name="addr1"
                      placeholder="주소를 검색하세요."
                      readonly
                    />
                  </div>
                  <div>
                    <input
                      type="text"
                      name="addr2"
                      placeholder="상세주소를 입력하세요."
                    />
                  </div>
                </td>
              </tr>
            </table>
            <div>
              <a href="#" class="btnCancel">취소</a>
              <input type="submit" class="btnSubmit" value="회원가입"/>
            </div>
          </form>
        </section>
      </main>
<%@ include file="./_footer.jsp" %>