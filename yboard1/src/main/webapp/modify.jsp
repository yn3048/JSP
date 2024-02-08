<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
      <header>
        <h3>Jboard v1.0</h3>
        <p>
          <span id="nick">홍길동</span>님 반갑습니다.
          <a href="#">로그아웃</a>
        </p>
      </header>
      <main>
        <section class="modify">
          <h3>글수정</h3>
          <article>
            <form action="#">
              <table>
                <tr>
                  <td>제목</td>
                  <td>제목</td>
                  <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                  <td>내용</td>
                  <td>
                    <textarea name="content"></textarea>                                
                  </td>
                </tr>
                <tr>
                  <td>첨부</td>
                  <td><input type="file" name="file"/></td>
                </tr>
              </table>
              <div>
                <a href="#" class="btnCancel">취소</a>
                <a href="#" class="btnWrite">수정완료</a>
              </div>
            </form>
          </article>
        </section>
      </main>
