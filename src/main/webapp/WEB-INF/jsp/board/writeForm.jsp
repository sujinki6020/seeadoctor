<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib tagdir="" prefix="navi" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/seeadoctor/css/board/writeForm.css">
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>

body { 
   font-family: 'NanumSquare', sans-serif; 
}

textarea.form-control {
    height: 400px;
}

.table-bordered>tbody>tr>th,.table-bordered>tbody>tr>td,
.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, 
.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
	border: 0px solid;
	border-bottom: 1px solid #ddd;
}
.table>tbody>tr>td{
	padding:10px;
}
.table > tbody {
	border: 1px solid white;
}
.table{
    width: 90%;
    max-width: 100%;
    margin-bottom: 35px;
    margin-left: 35px;
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
		
		<div id="content_start_box">
			
			<div id="content_area">
				
				<div id="form">
					<form enctype="multipart/form-data" method="post" action="write.do">
				
				<div id="review_row">
					<span id="review">리뷰쓰기</span>
					<input type="text" id="name" name="name" value="${sessionScope.user.name}">
					<input type="hidden" name="userSeq" value="${sessionScope.user.userSeq}">
<%-- 					<span id="name" name="name">${sessionScope.user.name}</span> --%>
					<hr id="review_hr">
				</div>
					<c:if test="${!empty board.no}">
						<input type="text" name="no" value="${board.no}" hidden="hidden">
					</c:if>
					<div id="title">
						<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" value="${board.title}">
					</div>
						
					<div id="msg">
						<textarea class="form-control" id="content" name="content" placeholder="내용을 입력해주세요">${board.content}</textarea>
					</div>

					<div id="filearea">
							<span id="file_span" >첨부파일</span>
							<input type="file" multiple="multiple" name="files" id="file"
									accept=".gif, .jpg, .png" placeholder="지원되는 파일 양식: jpg, png, gif">
									
							<div onchange="dropfile();">Drap and Drop here.</div>
					</div>

					<hr id="review_hr">
					<div id="btn_adm">
						<button type="submit" class="btn btn-default" style="margin-bottom: 10px;">등록</button>
						<button type="button" class="btn btn-default" style="margin-bottom: 10px;" 
								onclick='location.href="${pageContext.request.contextPath}/board/review.do"'>취소</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>		
</body>

<script>










var dropFile = function(event) {
	   event.preventDefault();
	}




</script>



</html>
				
				