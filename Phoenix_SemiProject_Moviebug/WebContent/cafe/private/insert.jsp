<%@page import="moviebug.users.dao.UsersDao"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email=(String)session.getAttribute("email");
	String name=UsersDao.getInstance().getData(email).getName();

	String qna_title=request.getParameter("qna_title");
	String qna_content=request.getParameter("qna_content");
	String qna_file=request.getParameter("qna_file");
	
	CafeDto dto=new CafeDto();
	dto.setQna_writer(name);
	dto.setQna_title(qna_title);
	dto.setQna_content(qna_content);
	dto.setQna_file(qna_file);
	boolean isSuccess=CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
	   <script>
	      alert("새글이 추가 되었습니다.");
	      location.href="${pageContext.request.contextPath}/cafe/list.jsp";
	   </script>
   <%}else{ %>
	   <script>
	      alert("글 저장 실패!");
	      location.href="insertform.jsp";
	   </script>
   <%} %>
</body>
</html>