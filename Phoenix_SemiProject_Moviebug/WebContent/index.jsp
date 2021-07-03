<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h1>인덱스 페이지 입니다.</h1>
	
	<a href="${pageContext.request.contextPath}/users/signupform.jsp">회원가입</a>
	<a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
	<a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
</body>
</html>