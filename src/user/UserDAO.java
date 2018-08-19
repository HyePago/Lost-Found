package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	// 로그인
	public int login(String userName, String password) {
		String SQL = "SELECT password FROM user WHERE username = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 로그인 실패, 비밀번호 불일치
				}
			}
			
			return -1; // 아이디 존재X
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB 오류
	}
	
	// 닉네임이 존재하는 지
	public int selectNickname(String nickname) {
		String SQL = "SELECT * FROM user WHERE nickname = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1; // 닉네임 존재
			} else {
				return 0; // 닉네임 존재 X
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 데이터베이스 오류
	}
	
	// 회원가입
	public int join(User user) {
		// 아이디 중복 확인
		if(login(user.getUsername(), user.getPassword()) != -1) {
			return -2;
		} else if(selectNickname(user.getNickname()) == 1) {
			return -3;
		}
		
		String SQL = "INSERT INTO user (name, username, password, nickname, phone) VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getNickname());
			pstmt.setString(5, user.getPhone());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 오류
	}
	
	public String getNickname(String username) {
		String SQL = "SELECT nickname FROM user WHERE username = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1); // 닉네임 존재
			} else {
				return null; // 닉네임 존재 X
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null; // 데이터베이스 오류
	}
}
