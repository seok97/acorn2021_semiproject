package moviebug.movieinfo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import moviebug.movieinfo.dto.MovieDto;
import test.util.DbcpBean;

public class MovieDao {
	private static MovieDao dao;
	
	static {
		dao = new MovieDao();
	}
	
	private MovieDao () {}
	private MovieDao getInstance() {
		return dao;
	}
	
	
	
	public boolean insert(MovieDto dto) {
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
			pstmt.setString(1,dto.getMovie_title_kr());
			pstmt.setString(2, dto.getMovie_title_eng());
			pstmt.setString(3, dto.getMovie_story());
			pstmt.setString(4, dto.getMovie_character());
			pstmt.setString(5, dto.getMovie_year());
			pstmt.setString(6, dto.getMovie_genre());
			pstmt.setString(7, dto.getMovie_company());
			pstmt.setString(8, dto.getMovie_image());
			pstmt.setString(9, dto.getMovie_trailer());
			pstmt.setString(10, dto.getMovie_time());
			pstmt.setString(11, dto.getMovie_rating());
			
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
	
	
	public boolean Testinsert(MovieDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성

			String sql = "insert into movie_info ("+
					"movie_num,movie_title_kr ,movie_year,movie_genre,movie_company" 
					+ ") values (movie_info_seq.nextval,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, dto.getMovie_title_kr());
			pstmt.setString(2, dto.getMovie_year());
			pstmt.setString(3, dto.getMovie_genre());
			pstmt.setString(4, dto.getMovie_company());
			
			
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
	
	
	
	public List<MovieDto> getList(MovieDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MovieDto> list = new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성

			String sql = "";
			pstmt = conn.prepareStatement(sql);
			// 바인딩

			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	
}