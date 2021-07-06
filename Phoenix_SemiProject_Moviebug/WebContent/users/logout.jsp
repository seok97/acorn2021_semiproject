<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("로그아웃 되셨습니다.");
		// javascript 를 활용해서 index.jsp 페이지로 redirect 시키기
		location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
</body>
</html>