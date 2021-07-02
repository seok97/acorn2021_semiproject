package test.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.movie.dto.MovieDto;
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
	
	//영화 목록을 리턴하는 메소드
	 public List<MovieDto> getList(MovieDto dto){
		 List<MovieDto> list=new ArrayList<MovieDto>();
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 try {
		 	 //Connection 객체의 참조값 얻어오기 
			 conn = new DbcpBean().getConn();
			 //실행할 sql 문 작성
			 String sql = "SELECT *" + 
		               "      FROM" + 
		               "          (SELECT result1.*, ROWNUM AS rnum" + 
		               "          FROM" + 
		               "              (SELECT movie_num, movie_image" + 
		               "              FROM movie_info" + 
		               "              ORDER BY num DESC) result1)" + 
		               "      WHERE rnum BETWEEN ? AND ?";
			 //PreparedStatement 객체의 참조값 얻어오기
			 pstmt = conn.prepareStatement(sql);
			 //? 에 바인딩할 내용이 있으면 여기서 바인딩
			 pstmt.setInt(1, dto.getStartRowNum());
			 pstmt.setInt(2, dto.getEndRowNum());
			 //select 문 수행하고 결과를 ResultSet 으로 받아오기
			 rs = pstmt.executeQuery();
			 //반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
			 while (rs.next()) {
				 MovieDto dto2=new MovieDto();
				 dto2.setMovie_num(rs.getInt("movie_num"));
				 dto2.setMovie_image(rs.getString("movie_image"));
				 list.add(dto2);
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
		 return list;
	 }
	
	//새로운 영화 정보를 저장하는 메소드
	public boolean insert(MovieDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "INSERT INTO movie_info"
					+ " (movie_num, movie_title_kr, movie_title_eng, movie_story, movie_character, movie_year, movie_genre, movie_company, movie_image, movie_trailer, movie_time, movie_rating"
					+ " VALUES(movie_info_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1,dto.getMovie_title_kr());
			pstmt.setString(2,dto.getMovie_title_eng());
			pstmt.setString(3,dto.getMovie_story());
			pstmt.setString(4,dto.getMovie_character());
			pstmt.setString(5,dto.getMovie_year());
			pstmt.setString(6,dto.getMovie_genre());
			pstmt.setString(7,dto.getMovie_company());
			pstmt.setString(8,dto.getMovie_image());
			pstmt.setString(9,dto.getMovie_trailer());
			pstmt.setString(10,dto.getMovie_time());
			pstmt.setString(11,dto.getMovie_rating());
			// insert of update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
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
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
