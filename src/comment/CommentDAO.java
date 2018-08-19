package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import post.Posts;
import user.User;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommentDAO() {
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
	
	// 댓글 올리기
	public int put(Comment comment) {
		String SQL = "INSERT INTO comment (parentid, nickname, comment) VALUES (?, ?, ?)";
			
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, comment.getParentid());
			pstmt.setString(2, comment.getNickname());
			pstmt.setString(3, comment.getComment());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 오류
	}
	
	public ArrayList<Comment> getComments(int id) {
		ArrayList<Comment> comments = new ArrayList<>();
		
		String SQL = "SELECT * FROM comment WHERE parentid=? ORDER BY timestamp DESC";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
    		
			rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			Comment comment = new Comment();
    			comment.setComment(rs.getString("comment"));
    			comment.setNickname(rs.getString("nickname"));
    			comment.setId(rs.getInt("id"));
    			
    			comments.add(comment);
    		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	public int delete(int id) {
		String SQL = "DELETE FROM comment WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, id);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 오류
	}
}
