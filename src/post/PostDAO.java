package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public PostDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/lost";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int post(Post post) {
		String SQL = "INSERT INTO post (division, area, title, content, picture, phone, username, nickname) VALUE (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, post.getDivision());
			pstmt.setString(2, post.getArea());
			pstmt.setString(3, post.getTitle());
			pstmt.setString(4, post.getContent());
			pstmt.setString(5, post.getPicture());
			pstmt.setInt(6, post.getPhone());
			pstmt.setString(7, post.getUsername());
			pstmt.setString(8, post.getNickname());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // ¿À·ù
	}
	
	public int maxPage(String division) {
		int totalPosts = 0;
		int maxPage = 0;
		
		String SQL = "SELECT count(*) count FROM post WHERE division = ?;";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, division);
			rs = pstmt.executeQuery();
			rs.next();
			totalPosts = rs.getInt("count");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		maxPage = (totalPosts / 10) + 1;
		
		return maxPage;
	}
	
	public int searchMaxPage(String division, String select, String text) {
		int totalPosts = 0;
		int maxPage = 0;
		
		String SQL = "SELECT count(*) count FROM post WHERE division = ?;";
		
		if(select.equals("1")) {
			SQL = "SELECT count(*) count FROM post WHERE division = ? and area LIKE '%?%';";
		} else if(select.equals("2")) {
			SQL = "SELECT count(*) count FROM post WHERE division = ? and title LIKE '%?%';";
		} else if(select.equals("3")) {
			SQL = "SELECT count(*) count FROM post WHERE division = ? and content LIKE '%?%';";
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, division);
			pstmt.setString(2, text);
			
			rs = pstmt.executeQuery();
			rs.next();
			totalPosts = rs.getInt("count");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		maxPage = (totalPosts / 10) + 1;
		
		return maxPage;
	}
	
	public ArrayList<Posts> getPosts(int currentPage, String division) {
		ArrayList<Posts> posts = new ArrayList<>();
		
		String SQL = "SELECT * FROM post WHERE division = ? ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((currentPage - 1) * 10);
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, division);
    		
			rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			Posts post = new Posts();
    			post.setId(rs.getInt("id"));
    			post.setArea(rs.getString("area"));
    			post.setTitle(rs.getString("title"));
    			post.setNickname(rs.getString("nickname"));
    			post.setTimestamp(rs.getString("timestamp"));
    			
    			posts.add(post);
    		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return posts;
	}
	
	public ArrayList<Posts> searchGetPosts(int currentPage, String division, String select, String text) {
		ArrayList<Posts> posts = new ArrayList<>();
		
		String SQL = "SELECT * FROM post WHERE division = ? ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((currentPage - 1) * 10);
		
		if(select.equals("1")) {
			SQL = "SELECT * FROM post WHERE division = ? and area LIKE '%?%' ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((currentPage - 1) * 10);
		} else if(select.equals("2")) {
			SQL = "SELECT * FROM post WHERE division = ? and title LIKE '%?%' ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((currentPage - 1) * 10);
		} else if(select.equals("3")) {
			SQL = "SELECT * FROM post WHERE division = ? and content LIKE '%?%' ORDER BY timestamp DESC LIMIT 10 OFFSET " + ((currentPage - 1) * 10);
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, division);
			pstmt.setString(2, text);
    		
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			Posts post = new Posts();
    			post.setId(rs.getInt("id"));
    			post.setArea(rs.getString("area"));
    			post.setTitle(rs.getString("title"));
    			post.setNickname(rs.getString("nickname"));
    			post.setTimestamp(rs.getString("timestamp"));
    			
    			posts.add(post);
    		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return posts;
	}
	
	public Post showPost(int id) {
		Post post = new Post();
		
		String SQL = "SELECT * FROM post WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			post.setArea(rs.getString("area"));
			post.setContent(rs.getString("content"));
			post.setDivision(rs.getString("division"));
			post.setNickname(rs.getString("nickname"));
			post.setPhone(rs.getInt("phone"));
			post.setPicture(rs.getString("picture"));
			post.setTitle(rs.getString("title"));
			
			return post;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}