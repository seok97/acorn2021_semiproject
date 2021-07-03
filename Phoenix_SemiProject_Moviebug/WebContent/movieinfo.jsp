<%@page import="moviebug.movieinfo.dto.MovieDto"%>
<%@page import="moviebug.movieinfo.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//임의의 영화번호
	int testNum=321;

	MovieDto dto=MovieDao.getInstance().getData(testNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieinfo.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>

	.genre-container{
		text-align: center;
	}
	
	.title-container{
		text-align: center;
	}
	
	.movieInfo-container{
		width: 1000px;
		height: 600px;
		margin: 0 auto;
		overflow: hidden; /* 부모 높이를 잊어벼리기때문에 다시 높이를 생기게끔해주는 float 해제 기법 */
	}
	
	.movieInfo_item{
		float: left; /* 가로 정렬을 하기 위한 float */
	}
	
	.movieInfo_item.trailer{
		width:500px;
		height:600px;
	}
	.movieInfo_item>img{
		width: 100%;
		height: 100%;
	}
	
	.movieInfo_item.detail{
		width:500px;
		height:600px;
		border-style: solid;
		border-width: 2px;
	}
	
	.btn-group{
		width:100%;
		height: 10%;
	}
	
	
	
</style>
</head>
<body>
	<div class="container">
	
	
	
		<div class="genre-container mb-3">
			<p><%=dto.getMovie_genre() %></p>
		</div>
		
		
		<div class="title-container mb-3">
			<h1><%=dto.getMovie_title_kr() %></h1>
			<h5><%=dto.getMovie_title_eng() %></h5>
		</div>
		
		
		<div class="movieInfo-container row align-items-center">
			<div class="movieInfo_item trailer">
				<img src="<%=dto.getMovie_image() %>"/>
			</div>
			<div class="movieInfo_item detail">
				<div class="btn-group mt-1" role="group" aria-label="Basic outlined example">
	  				<button type="button" class="btn btn-outline-primary">기본 정보</button>
	  				<button type="button" class="btn btn-outline-primary">감독 / 출연진</button>
	  				<button type="button" class="btn btn-outline-primary">유저 평점</button>
				</div>
			</div>			
		</div>
		
		
		
	</div>
</body>
</html>