<%@page import="moviebug.movieinfo.dao.MovieDao"%>
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


for(int i = 0 ; i < jsonarr.length(); i++){
	MovieDto dto = new MovieDto();	
	JSONObject jsobj = jsonarr.getJSONObject(i);
	
	// 객체안의 배열 파싱 제작사
	JSONArray parse_jsobj = (JSONArray)jsobj.get("companys");
	JSONObject ppobj = (JSONObject)parse_jsobj.get(0);
	System.out.println(ppobj.getString("companyNm"));
	dto.setMovie_company(ppobj.getString("companyNm"));
	// 객체 배열 파싱 감독
	parse_jsobj = (JSONArray)jsobj.get("directors");
	ppobj = (JSONObject)parse_jsobj.get(0);
	System.out.println(ppobj.getString("peopleNm"));
	dto.setMovie_company(ppobj.getString("peopleNm"));
	
	
	// 값 저장
	dto.setMovie_title_kr(jsobj.getString("movieNm"));
	dto.setMovie_title_eng(jsobj.getString("movieNmEn"));
	dto.setMovie_year(jsobj.getString("openDt"));
	dto.setMovie_genre(jsobj.getString("genreAlt"));
	dto.setMovie_nation(jsobj.getString("nationAlt"));
	
	// db insert
}


	
	%>

{"done":<%=isS%>}