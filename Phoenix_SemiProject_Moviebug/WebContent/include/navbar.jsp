<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<header>
  <div class="header_navwrpper container">
    <nav class="bg-white">
      <div class="container bg-white">
        <div class="nav_wrapper">
        
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
          	MovieBug
          </div>
          </div>
          
          <div class="nav_header_menu03 flex_box">
          <div class="nav_w_right flex_box">
            <div class="nav_search">
            	<form action="<%=request.getContextPath() %>/more.jsp" class="">
            		<input type="text" id="keyword" name="keyword" />
            		<button type="submit">
            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
					</button>
            	</form>
            </div>
            <div class="nav_user flex_box">
              <div class="nav_login">로그인/회원가입</div>
              <div class="profile ">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
				  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>
				</div>
            </div>
          </div>
          </div>
          
           </div>
          
        </div>
      </div>
    </nav>
  </div>
</header>