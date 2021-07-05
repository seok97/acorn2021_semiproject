package moviebug.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import moviebug.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {
		
	}
	
	static {
		dao = new UsersDao();
	}
	
	public static UsersDao getInstance() {
		return dao;
	}
	
	// 사용자 정보 가져오기
	public UsersDto getUser(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto dto = new UsersDto();
		
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성

			String sql = "select name,email,addr,profile,regdate from users where email = ?";
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return dto;
	}

}
