<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatBoard.css">
<script  src="${pageContext.request.contextPath}/js/chatBoard.js"></script>
</head>
<body>
 <section>
  <!--for demo wrap-->
  <h1 id="chatH1">1:1 채팅</h1>
  <div>
  	<button type="button" class="btn btn-default">채팅창 나가기</button>
  	<button type="button" class="btn btn-danger">거부</button>

  </div>
  <div class="tbl-header">
    <table id="tb1" cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th id="th1">check</th>
          <th id="th2">이름</th>
          <th id="th3">시간(?)</th>
          <th id="th4">메모</th>
<!--           <th>Change %</th> -->
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table id="tb2" cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
          <td id="td1"><input type="checkbox" value="" /></td>
          <td id="td2"><a href="#" onclick="chat()")>김혜리</a></td>
          <td id="td3">2018-07-09 13:52:45</td>
          <td id="td4"><textarea rows="2" cols="75" style="resize:none; color:black; font-size:14px;">물리치료 문의</textarea></td>
          <!-- textarea : 무조건 update? || 조건에 따라 빈 textarea 혹은 value값 show 
          		이름 클릭 시 채팅창 이동? popup?
          -->
        </tr>
        <tr>
          <td><input type="checkbox" value="" /></td>
          <td>김기영</td>
          <td>2018-07-09 14:52:45</td>
          <td id="td4"><textarea rows="2" cols="75" style="resize:none; color:black; font-size:14px;"></textarea></td>
        </tr>
        <tr>
          <td><input type="checkbox" value="" /></td>
          <td>성중원</td>
          <td>2018-07-09 17:52:45</td>
          <td id="td4"><textarea rows="2" cols="75" style="resize:none; color:black; font-size:14px;"></textarea></td>
        </tr>
        <tr>
          <td><input type="checkbox" value="" /></td>
          <td>기수진</td>
          <td>2018-07-10 12:52:45</td>
          <td id="td4"><textarea rows="2" cols="75" style="resize:none; color:black; font-size:14px;"></textarea></td>
        </tr>
        <tr>
          <td><input type="checkbox" value="" /></td>
          <td>스팸</td>
          <td>2018-07-09 19:52:45</td>
          <td id="td4"><textarea rows="2" cols="75" style="resize:none; color:black; font-size:14px;"></textarea></td>
        </tr>
      </tbody>
    </table>
  </div>
</section>
</body>
</html>