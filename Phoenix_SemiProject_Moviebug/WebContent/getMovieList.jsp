<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		MovieDao.getInstance().insert(dto);
	}
	
	
	%>
{"done":<%=isS%>}