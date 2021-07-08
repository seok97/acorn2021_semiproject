<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="moviebug.users.dao.UsersDao"%>
<%@page import="moviebug.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	// 로그인 상태 가져오기	
	String email = request.getParameter("email");
	boolean isLogin = false;
	if(!email.equals("null")) isLogin = true;
	// 유저객체
	UsersDto dto = new UsersDto();
	// 로그인 되어었으면 유저 정보 가져오기
	if(isLogin){
		System.out.println(email);
		dto = UsersDao.getInstance().getUser(email);
	}
	
	
	
%>
<header>
  <div class="header_nav_wrapper container">
    <nav class="bg-white">
     
        <div class="container bg-white nav_wrapper">
        
        <div class="nav_header_menu flex_box">
       
       <div class="nav_header_menu01 flex_box">
          <div class="nav_w_menu">
          	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
			</svg>
          </div>
       </div> 
          
          <div class="nav_header_menu02 flex_box">
          <div class="nav_w_brand">
          	 <a href="<%=request.getContextPath()%>/index.jsp"> MovieBug </a>
          </div>
          </div>
          
          <div class="nav_header_menu03 flex_box">
          
          
          <%System.out.println("url : "+ request.getServletPath()); %>
          <%if(request.getServletPath().equals("/users/login.jsp")) {}%>
          <div class="nav_w_right flex_box">
            <div class="nav_search flex_box">
            <!-- 검색 바 -->
      
				
    		<!-- Button trigger modal -->
				<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
				</button>
            
            
            <!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-xl">
				    <div class="modal-content">
				      <div class="modal-header search_bar">
				        <div class="modal-title flex_box search_bar_wrapper" id="exampleModalLabel">
        
        		            <form action="<%=request.getContextPath() %>/index.jsp" id="search_form" class="search_bar_form" method="get">
					            	<button type="submit" class="search_form_btn">
						            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
										</svg>
									</button>
					            	<input id="nav_search_input" class="" type="text" id="keyword" name="keyword" placeholder="검색어를 입력해 주세요" />
					           	</form>
			            		<div class="flex_box keyword_resetBtn">
			            			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  										<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
									</svg>
			            		</div>
					        </div>
					        <button type="button" class="btn-close search_closeBtn" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
						      <div class="row search_btns justify-content-around">
								
						      </div>
						      <div class="row">
						      	인기 검색어
						      </div>
						      <div class="row">
						      	1위
						      </div>
						      <div class="row">
						      	2위
						      </div>
						      <div class="row">
						      	3위
						      </div>
						      
					      </div>
					    </div>
					  </div>
					</div>
            <!-- ---------------------------------------------- -->
            	
            </div>
            <div class="nav_user flex_box">
              <div class="nav_login">
              
              
              <%if(!isLogin) {%>
              	<a href="<%= request.getContextPath()%>/users/loginform.jsp">로그인</a>/
              	<a href="<%= request.getContextPath()%>/users/loginform.jsp">회원가입</a>
              	<%}else{ %>
              	<a href="<%=request.getContextPath()%>/users/private/info.jsp"><%=dto.getName() %></a>
              	<%} %>
              </div>
              
              
              <div class="profile">
              
              	<%if(isLogin){ %>
              	<div class="btn-group">
				  <button type="button" class="profile_btn" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
				  	<!-- 프로필사진없을때 분기 추가해야됨 -->
				  	<% if(dto.getProfile() != null){%>
		            	<img src="<%=request.getContextPath() %>/<%=dto.getProfile()%>" />
					<%}else{ %>
						<img src="<%=request.getContextPath()%>/images/bigdata.jpg"/>
					<%} %>
				  </button>
              	
				  <ul class="dropdown-menu dropdown-menu-lg-end">
				    <li><a href="<%=request.getContextPath()%>/users/private/info.jsp"><button class="dropdown-item" type="button">내정보</button></a></li>
				    <li><a href="<%=request.getContextPath()%>/users/logout.jsp"><button class="dropdown-item" type="button">로그아웃</button></a></li>
				  </ul>
				 
				</div>
              	<%}else{ %>
	              	<a href="<%=request.getContextPath() %>/users/loginform.jsp">
    	          	<div class="profile_btn">
		              	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
							<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
						</svg>
	              	</div>
	              	</a>
              	<%} %>

		  		 </div>
		   
            </div>
          </div>
          
          
          
          </div>
         </div>
        </div>
    </nav>
  </div>
</header>