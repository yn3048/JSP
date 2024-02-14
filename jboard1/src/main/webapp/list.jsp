<%@page import="java.awt.print.PageFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
											<!-- jsp 페이지 내부 인코딩 -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 넘어오는 데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	String pg 		  = request.getParameter("pg");
	String searchType =	request.getParameter("searchType");
	String keyword 	  =	request.getParameter("keyword");
	
	
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	

	// 전체 글 갯수(5120)
	int total = dao.selectCountTotal(searchType, keyword);
	
	// 마지막 페이지 번호 계산
	int lastPageNum = 0;
	
	// 한 페이지에 글이 10개씩 있을 경우
	if(total % 10 == 0) {
		lastPageNum = (total / 10);
	}else {
		lastPageNum = (total / 10) + 1;
	}
		
	// 현재 페이지 번호
	int currentPg = 1;
	
	if(pg != null) {
		currentPg = Integer.parseInt(pg);
	}
	
	// limit 시작값 계산
	int start = (currentPg -1) * 10;
	
	// 페이지번호 그룹 계산  // 나눗셈 실수로 하면 결과값 실수로 나옴 // 페이지 번호 1~10 => 1그룹, 2~20 =>2그룹 
	int pageGroupCurrent = (int)Math.ceil(currentPg / 10.0);
	int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
	int pageGroupEnd   = pageGroupCurrent * 10;
	
	if(pageGroupEnd > lastPageNum) {
		pageGroupEnd = lastPageNum;
	}

	// 페이지 시작번호 계산
	int pageStartNum = total - start;
	
	List<ArticleDTO> articles = null;
	String params = "";
	
	if(searchType == null && keyword == null) {
		// 전체 글 조회
		articles = dao.selectArticles(start);
	} else {
		// 검색 조회
		articles = dao.selectArticlesForSearch(searchType, keyword, start);
		params = "&searchType="+searchType+"&keyword="+keyword;
	}
	

%>
<%@ include file="./_header.jsp" %>

<script>
	
	window.onload = function(){
		
		//const searchForm = document.getElementsByClassName('search')[0];
		const btnSearch = document.search.submit;
		btnSearch.onclick = () => {
			alert('검색클릭!');
		}
		
		
	}


</script>


      <main>
        <section class="list">
          <h3>글목록</h3>
          <article>
          
            <!-- 검색 -->
             <form action="/jboard1/list.jsp" class="search" name="search">
             	<select name="searchType">
             		<option value="title">제목</option>
             		<option value="content">내용</option>
             		<option value="title_content">제목+내용</option>
             		<option value="writer">작성자</option>
             	</select>
             	
             	<input type="text" name="keyword" placeholder="검색 키워드 입력">
             	<input type="submit" name="submit" value="검색">
             </form>
            
            <table>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
              </tr>
              <% for(ArticleDTO article : articles ){%>
              
              <tr>
                <td><%= pageStartNum-- %></td>
                <td><a href="/jboard1/view.jsp?no=<%= article.getNo() + params %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2,10) %></td>
                 <td><%= article.getHit() %></td>
                
              </tr>
              <% } %>
            </table>
          </article>

          <!-- 페이지 네비게이션 -->
          <div class="paging">
          	<% if(pageGroupStart > 1){ %>
            <a href="/jboard1/list.jsp?pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
            <% } %>
            
            <% for(int n=pageGroupStart ; n<=pageGroupEnd ; n++) { %>
            <a href="/jboard1/list.jsp?pg=<%= n %>" class="num <%= (currentPg == n) ? "current" : "" %>"><%= n %></a>
            <% } %>
            
            <% if(pageGroupEnd < lastPageNum ) { %>
            <a href="/jboard1/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
            <% } %>
          </div>

          <div>
            <a href="/jboard1/write.jsp" class="btnWrite">글쓰기</a>
          </div>
        </section>
      </main>

<%@ include file="./_footer.jsp" %>




