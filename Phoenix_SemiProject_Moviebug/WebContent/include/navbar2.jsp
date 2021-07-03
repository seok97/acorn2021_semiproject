<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// thisPage 라는 파라미터명으로 전달되는 문자열을 얻어와 본다.
    	// null or member or todo
    	String thisPage=request.getParameter("thisPage");
    	// thisPage 가 null 이면 index.jsp 페이지에 포함된 것이다.
    	System.out.println("thisPage");
    	if(thisPage==null){
    		// 빈 문자열 대입한다.
    		thisPage="";
    	}
    	String id=(String)session.getAttribute("id");

    %>
	<nav class="navbar navbar-dark bg-dark navbar-expand-lg" >
  		<div class="container-fluid">
    		<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">
      		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#ffffff" viewBox="0 0 256 256"><rect width="256" height="256" fill="none"></rect><path d="M88,148a68,68,0,1,1,68,68H76a44,44,0,1,1,14.30583-85.62208" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></path><line x1="79.6638" y1="56.73022" x2="75.49625" y2="33.09483" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></line><line x1="48.68557" y1="76.45789" x2="29.02592" y2="62.69205" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></line><line x1="40.73022" y1="112.31237" x2="17.09483" y2="116.47993" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></line><line x1="115.51829" y1="64.68557" x2="129.28412" y2="45.02592" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></line><path d="M51.64386,135.35374A48.008,48.008,0,1,1,131.83232,84.4235" fill="none" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"></path></svg>
     		 Index
    		</a>
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    			data-bs-target="#navbarNav">
      			<span class="navbar-toggler-icon"></span>
    		</button>
   	 		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
          				<a class="nav-link <%=thisPage.equals("cafe") ? "active" : "" %>" href="<%=request.getContextPath()%>/cafe/list.jsp">Cafe</a>
        			</li>
        			<li class="nav-item">
          				<a class="nav-link <%=thisPage.equals("game") ? "active" : "" %>" href="<%=request.getContextPath()%>/game/list.jsp">Game</a>
        			</li>
        			<li class="nav-item">
          				<a class="nav-link <%=thisPage.equals("file") ? "active" : "" %>" href="<%=request.getContextPath()%>/file/list.jsp">File</a>
        			</li>
      			</ul>     		
				<%if(id==null){ %>
                  <a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
                  <a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
               <%}else{ %>
                  <span class="navbar-text me-2">
                     <a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a> 로그인중...
                  </span>
                  <a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
               <%} %>
          </div>
      </div>
   </nav>

