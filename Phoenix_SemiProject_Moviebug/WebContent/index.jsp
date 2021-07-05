<%@page import="moviebug.users.dao.UsersDao"%>
<%@page import="moviebug.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String email=(String)session.getAttribute("email");
	UsersDto dto = new UsersDto();
	dto.setEmail(email);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h1>인덱스 페이지 입니다.</h1>
	
	<%if(email==null){ %>
                  <a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signupform.jsp">회원가입</a>
                  <a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
    <%}else{ %>
    <span class="navbar-text me-2">
    			  <%
    			  	UsersDto dto2 = UsersDao.getInstance().getData(email);
    			  %>
                     <a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=dto2.getName() %></a> 로그인중...
                  </span>
                  <a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
               <%} %>
               
</body>
</html>