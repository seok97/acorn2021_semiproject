<%@page import="moviebug.users.dao.UsersDao"%>
<%@page import="moviebug.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼으로 전송되는 가입할 회원의 정보 읽어오기
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	// UsersDto 객체의 회원 정보 담기
	UsersDto dto = new UsersDto();
	dto.setName(name);
	dto.setPwd(pwd);
	dto.setEmail(email);
	dto.setAddr(addr);
	// UsersDao 객체를 이용해서 DB 저장
	boolean isSuccess = UsersDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p> <strong><%=name %></strong> 회원님 가입 되었습니다.
			<a href="loginform.jsp">로그인 하러 가기</a>
			</p>
		<%} else { %>
			<p>
				가입 실패!
				<a href="signupform.jsp">다시 가입하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>