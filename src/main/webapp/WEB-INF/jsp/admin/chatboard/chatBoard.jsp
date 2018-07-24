<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/chat/chatBoard.css">
<script  src="${pageContext.request.contextPath}/js/admin/chat/chatBoard.js"></script>
</head>
<body>
 <section>
  <!--for demo wrap-->
  <h1 id="chatH1">1:1 채팅</h1>
  <div>
  	<button type="button" id="deleteBtn" class="btn btn-default">채팅 목록에서 제거</button>
<!--   	<button type="button" class="btn btn-danger">스팸</button> -->

  </div>
  <div class="tbl-header">
    <table id="tb1" cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th id="th1">check</th>
          <th id="th2">고객ID - 고객명</th>
          <th id="th3">채팅 날짜</th>
          <th id="th4">메모</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table id="tb2" cellpadding="0" cellspacing="0" border="0">
      <tbody>
      
      <c:forEach var="chatBoard" items="${cbList}">
        <tr>
          <td id="td1"><input type="checkbox" name="check" class="deleteChatBoard" /></td>
          <td id="td2"><a href="#" class="userId">${chatBoard.userId}</a> - ${chatBoard.userName}</td>
          <td id="td3">${chatBoard.date}</td>
          <td id="td4">
	          <input type="hidden" name="chatBoardSeq" class="chatBoardSeq" value="${chatBoard.chatBoardSeq}" />
	          <textarea id="memo" name="memo" rows="2" cols="75" style="resize:none; color:black; font-size:14px;">${chatBoard.memo}
	          </textarea>
          </td>
        </tr>
      </c:forEach>
 
      </tbody>
    </table>
  </div>
</section>

<script>

$("#td4").on("keyup", function () {
// 	alert("keyup");
	var memo = $("#memo").val();
	var chatBoardSeq = $(".chatBoardSeq").val();
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/chatboard/addMemo.do",
		type: "post",
		data: {"chatBoardSeq":chatBoardSeq,"memo":memo},
	});
});

$("#tb2").on("click",".userId",function(){
	window.open('http://localhost/seeadoctor/chat/chatWindow.do?receiverId=' + $(this).text(), 'popup01', 'width=400, height=550, toolbar=0, menubar=no');
});

$(".deleteChatBoard").click(function () {
	$(".deleteChatBoard").prop("checked", true);
	var n = $( "input:checked" ).length;
	$("#deleteBtn").click(function () {
		var chatBoardSeq = $(".chatBoardSeq");
		var chatSeqs = "";
		for(i=1; i<=n, i++) {
			chatBoardSeq[i].val();
			chatSeqs += chatBoardSeq[i].val();
			console.log(chatBoardSeq[i].val());
		}
	});
});
</script>
</body>
</html>