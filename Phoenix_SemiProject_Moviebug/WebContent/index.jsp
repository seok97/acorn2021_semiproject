<%@page import="moviebug.movieinfo.dao.MovieDao"%>
<%@page import="moviebug.movieinfo.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	// 최신 영화 3개 리스트 가져오기
	List<MovieDto> NewMovieList = MovieDao.getInstance().getNewMovies();
	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>index.jsp</title>
    <jsp:include page="include/resource.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="css/navbar.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/index.css" />
  </head>
  <body>
    <jsp:include page="include/navbar.jsp"></jsp:include>

    <div class="container index_content">
      <div class="row index_content01">
        <div
          id="carouselExampleCaptions"
          class="carousel slide"
          data-bs-ride="carousel" >
          <div class="carousel-indicators">
            <button
              type="button"
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide-to="0"
              class="active"
              aria-current="true"
              aria-label="Slide 1"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide-to="1"
              aria-label="Slide 2"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleCaptions"
              data-bs-slide-to="2"
              aria-label="Slide 3"
            ></button>
          </div>
          
          <div class="carousel-inner">
          
          <%for(int i = 0; i < NewMovieList.size(); i++) {
          	MovieDto dto = NewMovieList.get(i);
          %>
            <div class="carousel-item <%= i == 0 ?  "active" : ""%>">
              <img src="images/bigdata.jpg" class="d-block w-100" alt="..." />
              <div class="carousel-caption d-none d-md-block">
                <h5><%=dto.getMovie_title_kr() %></h5>
                <p>
                  <%= dto.getMovie_title_eng()%>
                </p>
              </div>
            </div>
            <%} %>
            
            
          </div>
          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleCaptions"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>

      <div class="row index_content02">
        <div class="row">
          <div class="col">
            <div class="row">
        <!-- ****************************************** -->
        <%for(int i = 0 ; i<4; i++){ %>
              <div class="col">
                <div class="card border-0">
                  <img
                    src="images/bigdata.jpg"
                    class="card-img-top"
                    alt="..."
                  />
                  <div class="card-body">
                    <h5 class="card-title">Card title 0<%=i %></h5>
                    <p class="card-text">
                      This is a longer card with supporting text below as a
                      natural lead-in to additional c
                    </p>
                  </div>
                </div>
              </div>
              <%} %>
      <!-- ********************************************* -->
             
            </div>
          </div>
        </div>
        <div class="row">
          <span>더보기</span>
        </div>
      </div>

      <div class="row index_content03">
        <div class="row">
          <div class="col">
            <div class="row">
              
         <!-- ****************************************** -->
		        <%for(int i = 0 ; i<4; i++){ %>
		              <div class="col">
		                <div class="card border-0">
		                  <img
		                    src="images/bigdata.jpg"
		                    class="card-img-top"
		                    alt="..."
		                  />
		                  <div class="card-body">
		                    <h5 class="card-title">Card title 0<%=i %></h5>
		                    <p class="card-text">
		                      This is a longer card with supporting text below as a
		                      natural lead-in to additional c
		                    </p>
		                  </div>
		                </div>
		              </div>
		              <%} %>
		      <!-- ********************************************* -->
             
            </div>
          </div>
        </div>
        <div class="row">
          <span>더보기</span>
        </div>
      </div>

      <div class="row index_content04">
        <div class="col">
          <div class="card mb-3">
            <div class="row g-0">
              <div class="col-md-8">
                <div
                  id="carouselExampleControls02"
                  class="carousel slide"
                  data-bs-ride="carousel"
                >
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="images/bigdata.jpg" class="d-block" alt="..." />
                    </div>
                    <div class="carousel-item">
                      <img src="images/bigdata.jpg" class="d-block" alt="..." />
                    </div>
                    <div class="carousel-item">
                      <img src="images/bigdata.jpg" class="d-block" alt="..." />
                    </div>
                  </div>
                  <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#carouselExampleControls02"
                    data-bs-slide="prev"
                  >
                    <span
                      class="carousel-control-prev-icon"
                      aria-hidden="true"
                    ></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#carouselExampleControls02"
                    data-bs-slide="next"
                  >
                    <span
                      class="carousel-control-next-icon"
                      aria-hidden="true"
                    ></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
              <div class="col-md-4">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">
                    This is a wider card with supporting text below as a natural
                    lead-in to additional content. This content is a little bit
                    longer.
                  </p>
                  <p class="card-text">
                    <small class="text-muted">Last updated 3 mins ago</small>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <jsp:include page="include/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
