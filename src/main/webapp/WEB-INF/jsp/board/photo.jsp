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
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}
#boardMain{
	height: 100%;
}
#photo{
	z-index: 1;
    width: 1100px;
    height: 300px;
    margin: auto;
    border: 1px solid #ccc;
    position: relative;
}	
#main{
	position: relative;
    z-index: 2;
    outline: 1px solid #ccc;
    width: 800px;
    margin: 0 auto;
    margin-top: -150px;
}

#head_box{
/* 	border: 1px solid red; */
	width: 800px;
	height:330px;
	background: white;

}
#head_top_hr{
    margin-top:0px;
	height: 4px;
    background: #529dbc;
    border-top-width: 0px;
}	

#head_name_area{
	margin : 0 auto;
	line-height:40px;
	width: 800px;
    margin-top: 60px;
/* 	border: 1px solid; */
}
#head_name {
	line-height:80px;
	margin : 0 auto;
	width: 220px;
	height: 70px;
/* 	border: 1px solid; */
}

#head_tap_hr{
	background:#fafafa;
	width: 700px;
	margin: auto;
}

.name{
    font-weight: bold;
	font-size:30px;
}

#head_btn_area{
	text-align: center;
 	height:120px; 
    position: relative; 
/* 	border: 1px solid; */
}

#head_btns a{
	float:left;
    padding: 15px 30px 0px 20px;
}

#head_btns {
	width:350px;
	height:110px;
	margin : 0 auto;
/* 	border:1px solid blue; */
}
#head_btn_tap{
	height:45px;
}
#head_taps{
	width:320px;
	height:35px;
	margin : 10px 20px 10px 120px ;
	font-weight: bold;
	line-height: 33px;
}
#head_taps span{
	padding: 0px 20px 0px 0px;
}
#content_box{
 	width: 800px;
	height: 550px;
/*   	border:1px solid blue;  */
}
#content_area{
 	width:100%;
	height: auto;
	margin: 15px 30px 0px 135px;
}
#content_area_photo{
 	width:400px;
	height: auto;
	margin: 16px 30px 0px 100px;
}
#content_area span{
	padding: 0px 25px;
}
#content_area div{
	margin-bottom: 20px;
	font-weight: bold;
	height: auto;
}
#content_photo{
	width: 600px;
    height: 400px;
    border: 1px solid #ccc;
    margin-left: 20px;
}
#review_hr{
	background: #ccc;
    width: 635px;
    margin: auto;
    height: 1px;
}
#in_out_photo{
	height: 60px;
	font-weight: bold;
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
						<img src="${pageContext.request.contextPath}/images/board/unstar.png" class="pull-right" id="btn_unlike"/><br>
						<span>즐겨찾기</span>
					</a>	
				</div>
			</div>
			
			<div id="head_btn_tap">
				<hr id="head_tap_hr">
					<div id="head_taps">
						<a href="${pageContext.request.contextPath}/board/boardInfo.do">
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

	

</body>
</html>