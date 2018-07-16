<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib tagdir="" prefix="navi" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/seeadoctor/css/board/detail.css">
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>

body { 
   font-family: 'NanumSquare', sans-serif; 
}

.table-bordered {
    border: none;
    width: 630px;
    margin-left: 89px;
}
    
.table-bordered>tbody>tr>td{
	border: none;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
}


</style>
</head>
<body>
${sessionScope.user.userSeq}
${result.board.userSeq}
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
					<div id="rrr">
						<span id="title">${result.board.title}</span>
						<span id="name">${result.board.name}</span>
					</div>
						<hr id="review_hr">
					<span id="view_cnt">${result.board.viewCnt}</span>
					<span id="date"><fmt:formatDate value="${result.board.regDate}" pattern="yyyy-MM-dd"/></span>
						<hr id="review_hr">
				</div>
				
				<div id="filearea">
						<c:forEach var="file" items="${result.files}">
							<img src="${pageContext.request.contextPath}/board/fileOutPut.do?filePath=${file.filePath}&sysName=${file.sysName}" style="width:100%; height:100%; margin:0 auto;"/><br>
							<button type="button" class="btn btn-default" style="margin:5px 0px 20px;"><a href="${pageContext.request.contextPath}/board/fileOutPut.do?filePath=${file.filePath}&sysName=${file.sysName}">다운로드</a></button><br> 
						</c:forEach>
				</div>
				<div id="content_box">${result.board.content}</div>
			</div>
		</div>
			
			<!-- 댓글파트 -->
			<div id="allComment">
			<form action="commentUpdate.json" method="post">
				<input type="hidden" name="no" value="${result.board.no}"/>
				<input type="hidden" name="commentNo" value=""/>
				
				<%-- 댓글 리스트--%>
				<div id="commentList"  class="border-0"></div>
			</form>
			
			<div id="commentComment">
				<%-- 댓글입력파트 --%>
				<form id="rForm" class="clearfix" >
					<div class="comment">
						<div id="commentId">
							<label class="sr-only" for="name" >아이디</label>
							<input type="hidden" name="userSeq" id="id" value="${sessionScope.user.userSeq}" /> 
							<input type="text" id="name" name="name" class="form-control" value="${sessionScope.user.name}" readonly />
						</div>
						<div id="commentWrite" style="height: 140px;">
							<label class="sr-only" for="content">댓글내용입력</label>
							<textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
							<button type="submit" id="btnCommentWrite" class="btn btn-primary btnCommentWrite">댓글쓰기</button>
						</div>
					</div>
				</form>
			</div>
			</div>
			
			<hr id="review_hr1">
			<div id="buttons">
						<div id="btn_s">
						<%-- 목록버튼 --%>
					<button type="button" class="btn btn-default"
						onclick='location.href="${pageContext.request.contextPath}/board/boardInfo.do"'>목록</button>
						<%-- 글쓰기버튼 --%>
					<button type="button" class="btn btn-default" id="writeid"
						onclick='location.href="${pageContext.request.contextPath}/board/writeForm.do"'>글쓰기</button>

					<div id="btn_update_delete">
						<c:if test="${sessionScope.user.userSeq == result.board.userSeq}">
							<%-- 수정버튼 --%>
							<button type="button" class="btn btn-default" id="updateid"
								onclick='location.href="${pageContext.request.contextPath}/board/updateForm.do?no=${result.board.no}"'>수정</button>
							<%-- 삭제버튼 --%>
							<button type="button" class="btn btn-default" id="deleteid"
								onclick='location.href="${pageContext.request.contextPath}/board/delete.do?no=${result.board.no}"'>삭제</button>
						</c:if>
					</div>
			</div>	
	</div>
	
</div>
</div>



<script>

	//댓글 삭제
	function commentDelete(commentNo) {
			$.ajax({
				url : "<c:url value='/board/commentDelete.json'/>",
				data : {
					no : "${result.board.no}",
					commentNo : commentNo
				},
				dataType : "json",
				success : makeCommentList
			});
		}
	
	function commentUpdateForm(commentNo) {

		$("#commentList tr[id^=row]").show();
		$("#commentList tr[id^=modRow]").remove();

		var modId = $("#row" + commentNo + " > td:eq(0)").text();
		var modContent = $("#row" + commentNo + " > td:eq(1)").text();

		var html = '';
		html += '<tr id="modRow' + commentNo + '">';
		html += '	<td>' + modId + '</td>';
		html += '	<td>';
		html += '		<div class="form-group">';
		html += '			<input type="text" name="content" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td colspan="2">';
		html += '		<a href="javascript:commentUpdate(' + commentNo
				+ ');"  class="btn btn-success btn-sm" role="button">수정</a>';
		html += '		<a href="javascript:commentCancel(' + commentNo
				+ ');"  class="btn btn-warning btn-sm" role="button">취소</a>';
		html += '	</td>';
		html += '</tr>';
		$("#row" + commentNo).after(html);
		$("#row" + commentNo).hide();
	}

	function commentUpdate(commentNo) {
		$.ajax({
			url : "<c:url value='/board/commentUpdate.json'/>",
			type : "POST",
			data : {
				no : "${result.board.no}",
				content : $("#modRow" + commentNo + " input[name=content]")
						.val(),
				commentNo : commentNo
			},
			dataType : "json",
			success : function(result) {
				makeCommentList(result);
			}
		});
	}
	
	function commentCancel(commentNo){
		$("#row" + commentNo).show();
		$("#modRow" + commentNo).remove();
	}


	//댓글등록
	$("#rForm").submit(function(e){
// 		alert($("#rForm input[name='name']").val())
		e.preventDefault();
		
		$.ajax({
			url : "<c:url value='/board/commentRegist.json'/>",
			type : "POST",
			data : {
				no: "${result.board.no}",
				content : $("#rForm textarea[name='content']").val(),
				userSeq : $("#rForm input[name='userSeq']").val(),
				name :$("#rForm input[name='name']").val()
			},
			dataType: "json"
		}).done(function(result){
			if(!'${result.board.userSeq}'){
				$("#rForm input[name='userSeq']").val("");
			}
			$("#rForm textarea[name='content']").val("");
			makeCommentList(result);
		});
	});
	
	//댓글목록
	function makeCommentList(result) {
			console.dir(result);
			var html = "";
			html += '<table class="table table-bordered">';
			html += '	<colgroup>';
			html += '		<col width="10%">';
			html += '		<col width="*">';
			html += '		<col width="14%">';
			html += '		<col width="10%">';
			html += '	</colgroup>';
		
			for(var i=0; i<result.length; i++){
				var comment = result[i];
				html+='<tr id="row'+comment.commentNo+'" width="600px">';
				html+='	<td width="150px">' + comment.name+'</td>';
				html+='	<td width="300px">'+comment.content+'</td>';
				var date = new Date(comment.regDate);
				var time = date.getFullYear()+"-"+(date.getMonth()+1)
						+"-"+ date.getDate();
				html += '	<td width="150px">' +time+'</td>';
				html += '	<td width="150px">';
				if('${sessionScope.user.userSeq}'==comment.userSeq){
					html += '	<a href="javascript:commentUpdateForm('
							+comment.commentNo
							+')" class="btn btn-success btn-sm" role="button">수정</a>';
					html += '		<a href="javascript:commentDelete('
						+ comment.commentNo
						+ ')"  class="btn btn-danger btn-sm" role="button">삭제</a>';
				}
				html += '	</td>';
				html += '</tr>';
				}
			if (result.length == 0) {
				html += '<tr><td colspan="4">댓글이 존재하지 않습니다.</td></tr>';
			}
			html += "</title>";
			$("#commentList").html(html);
	}
	
	//댓글목록 조회
	function commentList(){
		$.ajax({
			url : "<c:url value='/board/commentList.json'/>",
			data:{
				no : "${result.board.no}"
			},
			dateType:"json",
			success:makeCommentList
		});
	}
	
	//상세페이지 로딩시 댓글목록 조회 ajax 호출
	commentList();

</script>

</body>
</html>










