<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.get방식 파라미터로 전달되는 삭제할 글 번호를 가지고 오자
	int qna_idx=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=CafeDao.getInstance().delete(qna_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
	   <script>
	      alert("삭제하였습니다.");
	      location.href="${pageContext.request.contextPath}/cafe/list.jsp";
	   </script>
   <%}else{ %>
	   <script>
	      alert("삭제 실패!");
	      location.href="detail.jsp?num=<%=qna_idx%>";
	   </script>
   <%} %>
</body>
</html>