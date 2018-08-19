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
	
	// �α���
	public int login(String userName, String password) {
		String SQL = "SELECT password FROM user WHERE username = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1; // �α��� ����
				} else {
					return 0; // �α��� ����, ��й�ȣ ����ġ
				}
			}
			
			return -1; // ���̵� ����X
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB ����
	}
	
	// �г����� �����ϴ� ��
	public int selectNickname(String nickname) {
		String SQL = "SELECT * FROM user WHERE nickname = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1; // �г��� ����
			} else {
				return 0; // �г��� ���� X
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // �����ͺ��̽� ����
	}
	
	// ȸ������
	public int join(User user) {
		// ���̵� �ߺ� Ȯ��
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
		
		return -1; // ����
	}
	
	public String getNickname(String username) {
		String SQL = "SELECT nickname FROM user WHERE username = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1); // �г��� ����
			} else {
				return null; // �г��� ���� X
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null; // �����ͺ��̽� ����
	}
}
