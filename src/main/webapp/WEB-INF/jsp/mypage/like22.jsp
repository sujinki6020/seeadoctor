<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/like.css" />
<%-- <script src="${pageContext.request.contextPath}/js/mypage/like.js"></script> --%>
</head>
<body>

<!-- Hero Unit -->
<section class="hero-unit">

  <div class="row">
    <div class="large-12 columns">

      <ul class="small-block-grid-2 medium-block-grid-3 flip-cards">

        <li ontouchstart="this.classList.toggle('hover');">
          <div class="large button card-front">
            <a href="#">즐겨찾기1</a>
            <i class="fa fa-code card-icon "></i>
          </div>
          <div class="panel card-back">
          ${like.name}
          </div>
        </li>

        <li ontouchstart="this.classList.toggle('hover');">
          <div class="large button card-front">
            <a href="#">즐겨찾기2</a>
            <i class="fa fa-pencil-square-o card-icon"></i>
          </div>

          <div class="panel card-back">
          </div>
        </li>

        <li ontouchstart="this.classList.toggle('hover');">
          <div class="large button card-front">
            <a href="#">즐겨찾기3</a>
            <i class="fa fa-paper-plane-o card-icon"></i>
          </div>

          <div class="panel card-back">
          </div>
        </li>

        <li ontouchstart="this.classList.toggle('hover');">
          <div class="large button card-front">
            <a href="#">즐겨찾기4</a>
            <i class="fa fa-map-o card-icon"></i>
          </div>

          <div class="panel card-back">
          </div>
        </li>

        <li ontouchstart="this.classList.toggle('hover');">
          <div class="large button card-front">
            <a href="#">즐겨찾기5</a>
            <i class="fa fa-language card-icon"></i>
          </div>

          <div class="panel card-back">
          </div>
        </li>

        <li ontouchstart="this.classList.toggle('hover');">
          <div class="large button card-front">
            <a href="#">즐겨찾기6</a>
            <i class="fa fa-users card-icon"></i>
          </div>

          <div class="panel card-back">
          </div>
        </li>

      </ul>
    </div>
    </div>
</section>
	
</body>
</html>