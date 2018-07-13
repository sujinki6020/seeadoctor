// '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();

function chat() {
	// 팝업을 띄우기, width 300, height 400, 스크롤바, 툴바, 메뉴바를 모두 숨기는 경우
	window.open('chat.jsp', 'popup01', 'width=400, height=600, scrollbars= 0, toolbar=0, menubar=no');
};