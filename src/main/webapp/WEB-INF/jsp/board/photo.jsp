<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/seeadoctor/css/board/photo.css">
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>

body { 
   font-family: 'NanumSquare', sans-serif; 
}
</style>
</head>
<body>

<div id="boardMain">
	<div id="photo">
		지도 
	</div>
	
	
	<div id="main">
		<div id="head_box">
			
			<hr id="head_top_hr">
			
			<div id="head_name_area">
				<div id="head_name">
					<span class="name">메디스캔의원</span>
					<span class="category">내과</span>
				</div>
			</div>	
			
			<div id="head_btn_area">
				<div id="head_btns">
					<a>
						<img src="${pageContext.request.contextPath}/images/board/search.png" class="pull-right" id="btn_search"/><br>
						<span>길찾기</span>
					</a>
					<a id="2" href="${pageContext.request.contextPath}/reservation/reservationForm.do">
						<img src="${pageContext.request.contextPath}/images/board/booking.png" class="pull-right" id="btn_booking"/><br>
						<span>예약하기</span>
					</a>
						<a>
						<c:if test="${result.cnt ==0}">
							<img src="${pageContext.request.contextPath}/images/board/unstar.png" data-flag="no" class="pull-right" id="btn_unlike"/><br>
						</c:if>
						<c:if test="${result.cnt != 0}">
							<img src="${pageContext.request.contextPath}/images/board/star.png" data-flag="yes" class="pull-right" id="btn_unlike"/><br>
						</c:if>
						<span>즐겨찾기</span>
					</a>	
				</div>
			</div>
			
			<div id="head_btn_tap">
				<hr id="head_tap_hr">
					<div id="head_taps">
						<a href="${pageContext.request.contextPath}/hospital/about.do">
							<span>주요정보</span>
						</a>	
						<a href="${pageContext.request.contextPath}/board/photo.do">
							<span>포토요약</span>
						</a>
						<a href="${pageContext.request.contextPath}/board/review.do">
							<span>리뷰</span>
						</a>
					</div>
				<hr id="head_tap_hr">
			</div>
		</div>
		
		<div id="content_box">
			<div id="content_area_photo">
				<div id="in_out_photo">
					<span>"병원이름"</span> <span>내외부 사진(개수)</span>
					<hr id="review_hr">
				</div>
				<div id="content_photo">
					사진
				</div>
			</div>
		</div>
	</div>
</div>

<script>


</script>

	

</body>
</html>