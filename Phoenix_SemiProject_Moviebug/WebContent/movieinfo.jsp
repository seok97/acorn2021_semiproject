<%@page import="moviebug.movieinfo.dto.MovieDto"%>
<%@page import="moviebug.movieinfo.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//임의의 영화번호
	int testNum=603;
	MovieDto dto=MovieDao.getInstance().getData(testNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieinfo.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="css/navbar.css" />
<style>
	.genre-container{
		text-align: center;
	}
	
	.title-container{
		text-align: center;
	}
	
	.movieInfo-container{
		width: 1200px;
		height: 400px;
		margin: 0 auto;
		overflow: hidden; /* 부모 높이를 잊어벼리기때문에 다시 높이를 생기게끔해주는 float 해제 기법 */
	}
	
	.movieInfo_item{
		float: left; /* 가로 정렬을 하기 위한 float */
	}
	
	.movieInfo_item.trailer{
		width:600px;
		height:400px;
	}
	.movieInfo_item>iframe{
		width: 100%;
		height: 100%;
	}
	
	.movieInfo_item.detail{
		width:600px;
		height:400px;
		border-style: solid;
		border-width: 2px;
	}
	
	.btn-group{
		width:100%;
		height: 10%;
		margin-top: 10px;
	}
	
	li { font-size: 15px; line-height: 30px; }
	
	#rating {
		text-align: center;
		margin-top: 10%;
	}
</style>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
	
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
				<iframe src="<%=dto.getMovie_trailer() %>" 
					title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
				</iframe>
			</div>
			<div class="movieInfo_item detail">
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
	  				<input type="radio" class="btn-check" name="btnradio" id="btnOne" autocomplete="off" checked>
	  				<label class="btn btn-outline-secondary" for="btnOne">기본정보</label>
	
	  				<input type="radio" class="btn-check" name="btnradio" id="btnTwo" autocomplete="off">
	  				<label class="btn btn-outline-secondary" for="btnTwo">감독/출연진</label>
	  				
	  				<input type="radio" class="btn-check" name="btnradio" id="btnThree" autocomplete="off">
	  				<label class="btn btn-outline-secondary" for="btnThree">줄거리</label>
	
	  				<input type="radio" class="btn-check" name="btnradio" id="btnFour" autocomplete="off">
	  				<label class="btn btn-outline-secondary" for="btnFour">유저평점</label>
				</div>
				
				<div class="mt-3" id="movieInfo_wrapper">
					
				</div>
				
				
				
			</div>			
		</div>
		
		
		
	</div>
	
<script>
	
	function infoOne(){
		const div=document.querySelector("#movieInfo_wrapper");
		div.innerHTML="";
		const ul=document.createElement("ul");
		const li1=document.createElement("li");
		const li2=document.createElement("li");
		const li3=document.createElement("li");
		const li4=document.createElement("li");
		const li5=document.createElement("li");
		
		li1.innerText="제작년월 : <%=dto.getMovie_year()%>";
		li2.innerText="장르 : <%=dto.getMovie_genre()%>";
		li3.innerText="국가 : <%=dto.getMovie_nation()%>";
		li4.innerText="러닝타임 : <%=dto.getMovie_time()%>";
		li5.innerText="제작사 : <%=dto.getMovie_company()%>";
		
		ul.append(li1);
		ul.append(li2);
		ul.append(li3);
		ul.append(li4);
		ul.append(li5);
		
		div.append(ul);
	}
	
	function infoTwo(){
		const div=document.querySelector("#movieInfo_wrapper");
		div.innerHTML="";
		const ul=document.createElement("ul");
		const li1=document.createElement("li");
		const li2=document.createElement("li");
		li1.innerText="감독 : <%=dto.getMovie_director()%>";
		li2.innerText="출연진 : <%=dto.getMovie_character()%>";
		
		ul.append(li1);
		ul.append(li2);
		
		div.append(ul);
	}
	
	function infoThree(){
		const div=document.querySelector("#movieInfo_wrapper");
		div.innerHTML="";
		
		const p=document.createElement("p");
		p.setAttribute('class','mt-3');
		p.innerText="<%=dto.getMovie_story()%>";
		div.append(p);
	}
	
	function infoFour(){
		const div=document.querySelector("#movieInfo_wrapper");
		div.innerHTML="";
		
		const h1=document.createElement("h1");
		h1.setAttribute('id','rating');
		h1.innerText="<%=dto.getMovie_rating()%> 점";
		div.append(h1);
	}
	
	infoOne();
	
	document.querySelector("#btnOne").addEventListener("click",function(){
		infoOne();
	});
	document.querySelector("#btnTwo").addEventListener("click",function(){
		infoTwo();
	});
	document.querySelector("#btnThree").addEventListener("click",function(){
		infoThree();
	});
	document.querySelector("#btnFour").addEventListener("click",function(){
		infoFour();
	});
	
	
</script>
</body>
</html>