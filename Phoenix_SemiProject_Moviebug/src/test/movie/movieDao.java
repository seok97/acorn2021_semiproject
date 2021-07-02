package test.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;

import test.util.DbcpBean;

public class movieDao {
	private movieDao dao;
	private movieDao() {}
	private movieDao getdao() {
		if(this.dao == null) dao = new movieDao();
		return dao;
	}
	
	
	
	public boolean insert(movieDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성

			String sql = "insert into movie_info ("+
					"movie_num,movie_title_kr ,movie_title_eng ,movie_story,movie_character,movie_year,movie_genre,movie_company,movie_image,movie_trailer,movie_time,movie_rating" 
					+ ") values (movie_info_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			
			flag = pstmt.executeUpdate();
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
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
}
