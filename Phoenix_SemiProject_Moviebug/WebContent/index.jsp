<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>index.jsp</title>
    <jsp:include page="include/resource.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="css/navbar.css" />
    <link rel="stylesheet" type="text/css" href="css/index.css" />
  </head>
  <body>
    <jsp:include page="include/navbar.jsp"></jsp:include>
    <div class="container">
      <div class="row">
        <div class="col">
        
        
        <div class="card mb-3">
  <div class="row g-0">
    <div class="col-md-8">
    
    
      <div
            id="carouselExampleControls"
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
              data-bs-target="#carouselExampleControls"
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
              data-bs-target="#carouselExampleControls"
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
        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
      </div>
    </div>
  </div>
</div>
        
        
          
          
          
          
          
        </div>
      </div>
      <div class="row"></div>
      <div class="row"></div>
      <div class="row"></div>
    </div>
  </body>
</html>
