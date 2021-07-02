<%@page import="test.movie.movieDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	movieDto dto = new movieDto();
	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <a href="index.jsp">인덱스로</a>

    <div class="search">
      <input type="text" id="keyword" />
    </div>

    <div class="result">
      <p>제목 : <span id="title"></span></p>
      <p>영문명 : <span id="title_en"></span></p>
      <p>감독 : <span id="director"></span></p>
      <p>제작국가 : <span id="nation"></span></p>
      <p>장르 : <span id="genre"></span></p>
      <p>개봉일 : <span id="opendt"></span></p>
    </div>
    <script>
      let retitle = document.querySelector("#title")
      let retitle_en = document.querySelector("#title_en")
      let redirec = document.querySelector("#director")
      let renation = document.querySelector("#nation")
      let regenre = document.querySelector("#genre")
      let reopendt = document.querySelector("#opendt")
      let apikey = "2332fdffb0b8e2f723ce1f01999d42e9"
      let keyword = ""
      let moviename = "&movieNm="
      let director = "&directorNm="
      let movieListApi =
        "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=" +
        apikey
      const SearchMovieName = (key) => {
        let ajaxReq = movieListApi + moviename + key
        console.log(ajaxReq)
        fetch(ajaxReq)
          .then((res) => {
            return res.json()
          })
          .then((data) => {
            console.log(data.movieListResult.movieList[0].movieNmEn)
            
            retitle.innerText = data.movieListResult.movieList[0].movieNm
            retitle_en.innerText = data.movieListResult.movieList[0].movieNmEn
            redirec.innerText =
              data.movieListResult.movieList[0].directors[0].peopleNm
            renation.innerText = data.movieListResult.movieList[0].nationAlt
            regenre.innerText = data.movieListResult.movieList[0].genreAlt
            reopendt.innerText = data.movieListResult.movieList[0].openDt
          })
      }
      document
        .querySelector("#keyword")
        .addEventListener("keyup", function (e) {
          if (e.key == "Enter") {
            keyword = e.target.value
            console.log(keyword)
            SearchMovieName(keyword)
          }
        })
    </script>
  </body>
</html>