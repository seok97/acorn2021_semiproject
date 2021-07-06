<%@page import="moviebug.users.dao.UsersDao"%>
<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeCommentDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //자세히 보여줄 글번호 가져오기
   int qna_idx=Integer.parseInt(request.getParameter("num"));

	String keyword=request.getParameter("keyword");
	String condition=request.getParameter("condition");
	//만일 키워드가 넘어오지 않는다면 
	if(keyword==null){
	   //키워드와 검색 조건에 빈 문자열을 넣어준다. 
	   //클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
	   keyword="";
	   condition=""; 
	}
	//CafeDto 객체를 생성해서 
	CafeDto dto=new CafeDto();
	//자세히 보여줄 글번호를 넣어준다. 
	dto.setQna_idx(qna_idx);
	//만일 검색 키워드가 넘어온다면 
	if(!keyword.equals("")){
	   //검색 조건이 무엇이냐에 따라 분기 하기
	   if(condition.equals("qna_title_content")){//제목 + 내용 검색인 경우
	      //검색 키워드를 CafeDto 에 담아서 전달한다.
	      dto.setQna_title(keyword);
	      dto.setQna_content(keyword);
	      dto=CafeDao.getInstance().getDataTC(dto);
	   }else if(condition.equals("qna_title")){ //제목 검색인 경우
	      dto.setQna_title(keyword);
	      dto=CafeDao.getInstance().getDataT(dto);
	   }else if(condition.equals("qna_writer")){ //작성자 검색인 경우
	      dto.setQna_writer(keyword);
	      dto=CafeDao.getInstance().getDataW(dto);
	   } // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
	}else{//검색 키워드가 넘어오지 않는다면
	   dto=CafeDao.getInstance().getData(dto);
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
		<td colspan="2">
			<div class="content"><%=dto.getQna_content() %></div>
		</td>
	</tr>
   </table>
   <ul>
      <li><a href="list.jsp">목록보기</a></li>
      <%
      String email=(String)session.getAttribute("email");
      if(email != null){
  	  String name=UsersDao.getInstance().getData(email).getName();
      %>
      <%if(dto.getQna_writer().equals(name)){ %>
      <li><a href="private/updateform.jsp?num=<%=dto.getQna_idx() %>">수정</a></li>
      <li><a href="private/delete.jsp?num=<%=dto.getQna_idx() %>">삭제</a></li>
      <% } 
      }
      %>
   </ul>
</div>