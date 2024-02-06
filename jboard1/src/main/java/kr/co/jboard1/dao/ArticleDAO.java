package kr.co.jboard1.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.ArticleDTO;

public class ArticleDAO extends DBHelper {

	// 싱글톤
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	
	private ArticleDAO() {}

	
	
	
	// 기본 CRUD 메서드
	public void insertArticle(ArticleDTO article) {
		
		try {
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setString(3, article.getWriter());
			psmt.setString(4, article.getRegip());
			
			psmt.executeUpdate();
			closeAll();
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArticleDTO selectArticle(int no) {
		return null;
	}
	
	public List<ArticleDTO> selectArticles() {
		
		List<ArticleDTO> articlesList = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_LIST);
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(10));
				dto.setRdate(rs.getString(11));
				articlesList.add(dto);
				
			}
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return articlesList;
	}
	
	public void updateArticle(ArticleDTO article) {
		
	}
	
	public void deleteArticle(int no) {
		
	}
	
	
}








