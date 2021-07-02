<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<header>
  <div class="header_navwrpper container">
    <nav class="bg-white">
      <div class="container bg-white">
        <div class="nav_wrapper">
        
          <div class="nav_w_menu">
          	메뉴
          </div>
          <div class="nav_w_brand">
          	MovieBug
          </div>
          
          <div class="nav_w_right">
            <div class="nav_search">
            	<form action="<%=request.getContextPath() %>/more.jsp">
            		<input type="text" id="keyword" name="keyword" />
            		<button type="submit">검색</button>
            	</form>
            </div>
            <div class="nav_user">
              <div class="nav_login">로그인/회원가입</div>
              <div class="profile">사진</div>
            </div>
          </div>
          
        </div>
      </div>
    </nav>
  </div>
</header>