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
<link rel="stylesheet" href="/seeadoctor/css/board/review.css">
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>

body { 
   font-family: 'NanumSquare', sans-serif; 
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
				
				<div id="review_row">
					<span id="review">리뷰 ${result.count}개의 글</span>
					<span id="review1">다녀온 후기를 남겨주세요!</span>
					<hr id="review_hr">
				</div>
				
				<div id="content_review">
					<table summary="This table shows how to create responsive tables using Datatables' extended functionality" 
	     					 class="table table-bordered table-hover dt-responsive gy">
<!-- 						<tbody id="pageTable"></tbody> -->
						<c:forEach var="board" items="${result.list}">
							<tr>
								<td><a href='detail.do?no=${board.no}'>${board.title}</a></td>
								<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
								<td>${board.name}</td>
							</tr>	
						</c:forEach>
					</table>
				</div>
					
				<nav>	
					<ul class="pagination"></ul>
				</nav>	
					
			   		<div id= search_area>
						<form action="">
			   				<input type="hidden" name="boardNo" value="">
					   			<select name="selectBox" class="btn btn-default search-bar1" style="width:100px;">
					   				<option value="title" name="title">제목</option>
					   				<option value="nickName">닉네임</option>
					   				<option value="content">내용</option>
					   			</select>
						   	<input type="text" name="search" class="search" placeholder="검색어를 입력하세요" style="height: 30px;"/>
								<button type="submit" class="btn btn-default search-bar1">검색</button> 
						<button type="button" id="writeid" class="btn btn-default pull-right"  
								onclick='location.href="${pageContext.request.contextPath}/board/writeForm.do"'>글쓰기</button>
						</form>
					</div>
			</div>
		</div>
		
	</div>
</div>

<script>





/*
	//페이지 목록
// 			html += '	<td><a href="detail.do?no=${board.no}">'+ board.title + '</a></td>';
	function makePageList(result) {
		$("#count").text(result.pageResult.count);
		var html = "";
		for (var i = 0; i < result.list.length; i++) {
			var board = result.list[i];
			html += '<tr>';
			html += '	<td>' + board.title + '</td>';
			var date = new Date(board.regDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate();
			html += '	<td>' + time + '</td>';  
			html += '	<td>' + board.name + '</td>';
			html += '</tr>';
		}
		if (!result.list.length) {
			html += '<tr><td colspan="4">게시물이 존재하지 않습니다.</td></tr>';
		}
		$("#pageTable").html(html);
		
		makePageLink(result.pageResult);
	}

	var html = "";
	if (data.count != 0) {
		var clz = "";
		if (data.prev == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		
		var fn = "";
		
		if (data.prev == true) {
			fn = "javascript:pageList(" + (data.beginPage - 1) + ");";
		}
		html += '<a href="' + fn + '" aria-label="Previous">';
		html += '    <span aria-hidden="true">&laquo;</span>';
		html += '</a>';
	    html += '</li>';
		
	    for (var i = data.beginPage; i <= data.endPage; i++) {
	    	if (i == data.pageNo) {
			    html += '<li class="active"><a href="#1">' + i + '</a></li>';
	    	}
	    	else {
	    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
	    	}
	    }
	    
		clz = "";
		if (data.next == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		
		fn = "";
		
		if (data.next == true) {
			fn = "javascript:pageList(" + (data.endPage + 1) + ");";
		}
		html += '<a href="' + fn + '" aria-label="Next">';
		html += '    <span aria-hidden="true">&raquo;</span>';
		html += '</a>';
	    html += '</li>';
	}
	
	$("nav > ul.pagination").html(html);
}
	
	function pageList(pageNo) {
		if (pageNo === undefined) {
			pageNo = 1;
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/board/detail.do",
			data: {pageNo: pageNo},
			dataType: "json",
			success: makePageList
		});
	}
	
	// 페이지 로딩시 목록 조회 ajax 호출
	pageList();
*/
</script>
	

</body>
</html>