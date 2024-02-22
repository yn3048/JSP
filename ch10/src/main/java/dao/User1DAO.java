package dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import dto.User1DTO;

public class User1DAO extends DBHelper {

	private static User1DAO instance = new User1DAO();
	public static User1DAO getInstance() {
		return instance;
	}
	private User1DAO() {}
	
	// 기본 CRUD
	public void insertUser1(User1DTO user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `User1` VALUES (?,?,?,?)");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getHp());
			psmt.setInt(4, user.getAge());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public User1DTO selectUser1(String uid) {
		
		User1DTO user = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `User1` WHERE `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				user = new User1DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAge(rs.getInt(4));
			}
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User1DTO> selectUser1s() {
		
		List<User1DTO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `User1`");
			
			while(rs.next()) {
				User1DTO user = new User1DTO();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAge(rs.getInt(4));
				users.add(user);
			}
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	public void updateUser1(User1DTO user) {
		try {
			conn = getConnection();
			PreparedStatement psmt = conn.prepareStatement("UPDATE `User1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getHp());
			psmt.setInt(3, user.getAge());
			psmt.setString(4, user.getUid());
			psmt.executeUpdate();
			
			closeAll();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser1(String uid) {
		try {
			conn = getConnection();
			PreparedStatement psmt = conn.prepareStatement("DELETE FROM `User1` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			closeAll();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}





























