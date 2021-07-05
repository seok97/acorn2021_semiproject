<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //자세히 보여줄 글번호 가져오기
   int qna_idx=Integer.parseInt(request.getParameter("num"));
   CafeDto dto=CafeDao.getInstance().getData(qna_idx);
   
   String keyword=request.getParameter("keyword");
   String condition=request.getParameter("condition");

   if(keyword==null){
      //키워드와 검색 조건에 빈 문자열을 넣어준다. 
      //클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
      keyword="";
      condition=""; 
   }
   //특수기호를 인코딩한 키워드를 미리 준비한다. 
   String encodedK=URLEncoder.encode(keyword);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
</head>
<body>
<div class="container">
   <a href="detail.jsp?num=<%=dto.getPrevNum() %>&keyword=<%=encodedK %>&condition=<%=condition%>">이전글</a>
   <a href="detail.jsp?num=<%=dto.getNextNum() %>&keyword=<%=encodedK %>&condition=<%=condition%>">다음글</a>
   <table>
      <tr>
         <th>글번호</th>
         <td><%=dto.getQna_idx() %></td>
      </tr>
      <tr>
         <th>작성자</th>
         <td><%=dto.getQna_writer() %></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><%=dto.getQna_title() %></td>
      </tr>
      <tr>
         <th>첨부파일</th>
         <td><%=dto.getQna_file() %></td>
      </tr>
      <tr>
         <th>등록일</th>
         <td><%=dto.getQna_regdate() %></td>
      </tr>
      <tr>
         <td colspan="2"><textarea><%=dto.getQna_content() %></textarea></td>
      </tr>
   </table>
   <ul>
      <li><a href="list.jsp">목록보기</a></li>
      <li><a href="private/updateform.jsp?num=<%=dto.getQna_idx() %>">수정</a></li>
      <li><a href="private/delete.jsp?num=<%=dto.getQna_idx() %>">삭제</a></li>
   </ul>
</div>