<%@page import="moviebug.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// signupform 에서 "inputId" 라는 파라미터로 전달되는 문자열 읽어오기
	String inputEmail = request.getParameter("inputEmail");
	// DB에서 이미 가입된 아이디가 존재하는지 여부를 얻어낸다.
	boolean isExist = UsersDao.getInstance().isExist(inputEmail);
%>
{"isExist": <%=isExist%>}