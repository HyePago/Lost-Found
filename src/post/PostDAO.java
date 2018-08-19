package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}