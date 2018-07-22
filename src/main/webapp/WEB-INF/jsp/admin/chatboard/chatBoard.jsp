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
  	<button type="button" class="btn btn-default">채팅 목록에서 제거</button>
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
      <p id="adminId">${chatBoard.adminId}</p>
        <tr>
          <td id="td1"><input type="checkbox" name="check" id="checkedOrNot" /></td>
          <td id="td2"><a href="#" class="userId">${chatBoard.userId}</a> - ${chatBoard.userName}</td>
          <td id="td3">${chatBoard.date}</td>
          <td id="td4"><textarea id="memo" name="memo" rows="2" cols="75" style="resize:none; color:black; font-size:14px;">${chatBoard.memo}</textarea></td>
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
	var adminId = "${sessionScope.user.id}";
	console.log("memo : ", memo);
	console.log("adminId : ", adminId);
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/chatboard/addMemo.do",
		type: "post",
		data: {"adminId":adminId,"memo":memo}
	});
});

// $("#userId").on("click", function(){
// 	console.log("$(this).text",$(this).text());
// 	console.log("#userId).text",$("#userId").text());
// 	window.open('http://localhost:8001/seeadoctor/chat/chatWindow.do?receiverId='+ $(this).text(), 'popup01', 'width=400, height=500, scrollbars= 0, toolbar=0, menubar=no');
// })

$("#tb2").on("click",".userId",function(){
	window.open('http://localhost:8001/seeadoctor/chat/chatWindow.do?receiverId=' + $(this).text(), 'popup01', 'width=400, height=500, scrollbars= 0, toolbar=0, menubar=no');
});
</script>
</body>
</html>