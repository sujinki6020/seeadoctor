$(function() {
  $("#datepicker").datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    minDate: "+1D", 
    maxDate: "+7D"
   });
});

function dayOfTheWeek() {
	var date = new Date($("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' }).val());
	//1월~6토, 0일
	//db는 1월~7일
	if($("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' }).val()=="") return;
	$("#timeList").html("<img id='loadingImg' src='/seeadoctor/images/reservation/loading-rolling.gif'/>");
	$.ajax({
		type : "POST",
		url : "/seeadoctor/reservation/timeList.json",
        data: {
        	hospitalSeq: $("input[name='hospitalSeq']").val(),
        	doctorSeq: $(":radio[name='doctorSeq']:checked").val(),
//         	date: new Date($("input[name='date']").val()),
			date: $("input[name='date']").val(),
        	day : date.getDay()
        },
		success : function(reserveTimeList) {
			var timeBnt = "";
			if(reserveTimeList.length == 0) timeBnt += "<h4>휴무일입니다.</h4>"
			for(var i = 0; i < reserveTimeList.length; i++) {
				timeBnt += '<button type="button" id="'+reserveTimeList[i].time+'" class="timeBnt';
				if(reserveTimeList[i].bookedStatus=="t" || reserveTimeList[i].blockedStatus=="t") {
					timeBnt += ' closeTime';
				}
				timeBnt += '">'+reserveTimeList[i].time.substr(0,2)+':'+reserveTimeList[i].time.substr(2,2)+'</button>';
			}
			$("#timeList").html(timeBnt);
		}
	});
}

