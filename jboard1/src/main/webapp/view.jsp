<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");

	ArticleDAO dao = ArticleDAO.getInstance();

	// 글 조회	
	ArticleDTO article = dao.selectArticle(no);

	// 글 조회 카운트 업데이트
	dao.updateHitCount(no);

	// 댓글 조회
	List<ArticleDTO> comments = dao.selectComments(no);	
	


%>
<%@ include file="./_header.jsp" %>
<script>
	// 자바 스크립트는 브라우저를 모두 load 후에 실행 => 스크립트를 최하단에 배치하거나 window.onload를 걸어준다.
	window.onload = function(){
		
		// 원글삭제
		const btnDelete = document.querySelector('.btnDelete');
		
		btnDelete.onclick = () => {
			if(confirm('정말 삭제 하시겠습니까?😯')){
				return true;
			}else{
				return false;
			}
		}
		
		// 댓글작성 취소
		const btnCancel = document.getElementsByClassName('btnCancel')[0];
		
		btnCancel.onclick = function(e){
			// a tag href 링크속성 없애기
			e.preventDefault();			
			document.frmComment.reset(); // 폼 초기화
		}
		
		// 댓글삭제
		const del = document.querySelectorAll('.del');
		
		del.forEach((item)=>{
			
			item.onclick = function(){
				
				const result = confirm('정말 삭제 하시겠습니까?😯');
				
				if(result){
					return true;	
				}else{
					// 표준 이벤트 모델(addEventListener)은 작업취소 안됨
					return false;
				}
			}
		});
		
		
	}
</script>

<main>
    <section class="view">
        <h3>글보기</h3>
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
            </tr>
            <% if(article.getFile() > 0){ %>
            <tr>
                <td>첨부파일</td>
                <td>
                    <a href="#">2020년 상반기 매출자료.xls</a>
                    <span>7회 다운로드</span>
                </td>
            </tr>
            <% } %>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" readonly><%= article.getContent() %></textarea>
                </td>
            </tr>
        </table>
        <div>
        	   <% if(article.getWriter().equals(sessUser.getUid()) ){ %>
            <a href="/jboard1/Proc/deleteProc.jsp?no=<%= article.getNo() %>" class="btnDelete">삭제</a>
            <a href="#" class="btnModify">수정</a>
             <%} %>
             
            <a href="/jboard1/list.jsp" class="btnList">목록</a>
        </div>  
        
        <!-- 댓글리스트 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            
            <% for(ArticleDTO comment : comments){ %>
            <article class="comment">
                <span>
                    <span><%= comment.getNick() %></span>
                    <span><%= comment.getRdate().substring(2, 10) %></span>
                </span>
                <textarea name="comment" readonly><%= comment.getContent() %></textarea>
                
                         <!-- 댓글 작성자 == 로그인 아이디 -->
                <% if(comment.getWriter().equals(sessUser.getUid()) ){ %>
                <div>
                    <a href="/jboard1/Proc/commentDelete.jsp?parent=<%= comment.getParent() %>&no=<%= comment.getNo()%>" class="del">삭제</a>
                    <a href="#">수정</a>
                </div>
                <%} %>
                
            </article>
            <% } %>
            
            <% if(comments.isEmpty()) { %>
            <p class="empty">등록된 댓글이 없습니다.</p>
            <% } %>
            
        </section>

        <!-- 댓글입력폼 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="/jboard1/Proc/commentInsert.jsp" name="frmComment" method="post">
            	<input type="hidden" name="parent" value="<%= no %>">
            	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>">
                <textarea name="content"></textarea>
                <div>
                    <a href="#" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="작성완료"/>
                </div>
            </form>
        </section>
    </section>
</main>
<%@ include file="./_footer.jsp" %>


  
  