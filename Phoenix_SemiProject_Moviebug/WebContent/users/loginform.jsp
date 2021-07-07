<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와 본다.
   String url=request.getParameter("url");
   //만일 넘어오는 값이 없다면
   if(url==null){
      //로그인 후에 index.jsp 페이지로 갈수 있도록 절대 경로를 구성한다.
      String cPath=request.getContextPath();
      url=cPath+"/index.jsp";
   }
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>

	html, body {
		width: 100%;
		height: 100%;
	}
	
	.container {
		width: 100%;
		height: 100%;
		
	}
			
	.container--formborder {
		display: flex;
		border: 1px solid #cecece;
	}
	
	.container--form {
		width: 600px;
		height: auto;	
		margin: auto;
	}
	
	h1 {
		padding: 32px;
	}
	
	button {
		width: 600px;
	}
	
	p {
		color: #6e6e6e;
		text-align: center;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="container--formborder">
			<div class="container--form">
				<form action="login.jsp" method="post">
					<h1>로그인</h1>
					<input type="hidden" name="url" value="<%=url %>" />
					<div>
						<label for="email">이메일</label>
						<input class="form-control m-3" type="text" name="email" id="email" 
								placeholder="이메일을 입력하세요."/>
					</div>
					<div>
						<label for="pwd">비밀번호</label>
						<input class="form-control m-3" type="password" name="pwd" id="pwd"
								placeholder="비밀번호를 입력하세요."  />
					</div>
					<button class="btn btn-primary m-3" type="submit">로그인</button>
					<div class="signup">
						<p>아직 계정이 없으신가요? <a href="<%= request.getContextPath()%>/users/signupform.jsp">가입하기</a></p>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>