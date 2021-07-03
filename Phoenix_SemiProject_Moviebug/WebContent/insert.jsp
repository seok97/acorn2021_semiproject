<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="test.moviedao.mmdao"%>
<%@page import="moviebug.movieinfo.dao.MovieDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="moviebug.movieinfo.dto.MovieDto"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Collections"%>
<%@page import="org.json.JSONObject"%>
<%@page import="jdk.nashorn.internal.parser.JSONParser"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	boolean isS = false;
	
	String parameter ="";
	
	for (String name : Collections.<String>list(request.getParameterNames())) {
	    String value = request.getParameter(name); 
	    parameter += name + "=" + value + "&";
	}
	
	System.out.println(parameter);
	
	JSONArray jsonarr = new JSONArray(parameter);
	
	
	List<MovieDto> list = new ArrayList<>();
	
	for(int i = 0 ; i < jsonarr.length(); i++){
		MovieDto dto = new MovieDto();	
		JSONObject jsobj = jsonarr.getJSONObject(i);
		
/* 		// 객체안의 배열 파싱 제작사
		JSONArray parse_jsobj = (JSONArray)jsobj.get("companys");
		JSONObject ppobj = (JSONObject)parse_jsobj.get(0);
		System.out.println(ppobj.getString("companyNm"));
		dto.setMovie_company(ppobj.getString("companyNm"));
		// 객체 배열 파싱 감독
		JSONArray parse_jsobj02 = (JSONArray)jsobj.get("directors");
		JSONObject ppobj02 = (JSONObject)parse_jsobj02.get(0);
		System.out.println(ppobj02.getString("peopleNm"));
		dto.setMovie_company(ppobj02.getString("peopleNm")); */
		
		// 성인 영화 제거
		if(!jsobj.getString("genreAlt").equals("성인물(에로)") && !jsobj.getString("genreAlt").equals("멜로/로맨스,드라마")){
			
		// 값 저장
		dto.setMovie_title_kr(jsobj.getString("movieNm"));
		dto.setMovie_title_eng(jsobj.getString("movieNmEn"));
		dto.setMovie_year(jsobj.getString("openDt"));
		dto.setMovie_genre(jsobj.getString("genreAlt"));
		dto.setMovie_nation(jsobj.getString("nationAlt"));
		
		list.add(dto);
		}
	}
	

	
	for(MovieDto dto:list){
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
			isS = true;
		} else {
			isS = false;	
		}
		
	}
	
	
	%>
{"done":<%=isS%>}