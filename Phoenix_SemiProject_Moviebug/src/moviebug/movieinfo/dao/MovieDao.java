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
	private MovieDao() {}
	public static MovieDao getInstance() {
		if(dao==null) {
			dao=new MovieDao();
		}
		return dao;
	}
	
	
	//영화 하나의 정보를 리턴하는 메소드
	public MovieDto getData(int num) {
		MovieDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성
			String sql = "SELECT movie_num,movie_title_kr ,movie_title_eng ,movie_story,movie_character,movie_year,movie_genre,movie_company,movie_image,movie_trailer,movie_time,movie_rating"
					+ " FROM movie_info"
					+ " WHERE movie_num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
			//select 문 수행하고 결과를 ResultSet 으로 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
			if (rs.next()) {
				dto = new MovieDto();
				dto.setMovie_num(num);
				dto.setMovie_title_kr(rs.getString("movie_title_kr"));
				dto.setMovie_title_eng(rs.getString("movie_title_eng"));
				dto.setMovie_story(rs.getString("movie_story"));
				dto.setMovie_character(rs.getString("movie_character"));
				dto.setMovie_year(rs.getString("movie_year"));
				dto.setMovie_genre(rs.getString("movie_genre"));
				dto.setMovie_company(rs.getString("movie_company"));
				dto.setMovie_image(rs.getString("movie_image"));
				dto.setMovie_trailer(rs.getString("movie_trailer"));
				dto.setMovie_time(rs.getString("movie_time"));
				dto.setMovie_rating(rs.getString("movie_rating"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	public boolean insert(MovieDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성

			String sql = "INSERT INTO movie_info"
					+ " (movie_num,movie_title_kr ,movie_title_eng ,movie_story,movie_character,movie_year,movie_genre,movie_company,movie_image,movie_trailer,movie_time,movie_rating,movie_nation,movie_director)"
					+ " VALUES(movie_info_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstmt.setString(11, dto.getMovie_nation());
			pstmt.setString(11, dto.getMovie_director());
			
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
