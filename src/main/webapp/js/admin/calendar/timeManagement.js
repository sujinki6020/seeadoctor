
$("button:first").addClass("activeDoc");

$(document).on("click", ".timeBnt", function () {	
	$(this).toggleClass('closeTime');
});

function makeTime() {
	$.ajax({
		type : "POST",
		url : "/seeadoctor/admin/calendar/makeTime.json",
		data : {
			hospitalSeq : hospitalSeq,
			doctorSeq : $(".activeDoc").attr("id"),
			dateStr : dateStr
		},
		success : function (data) {
			
			$("#timeList").html("");
			for(var i=0; i<data.length; i++) {
				
				
				var bnt = "";
				bnt += "<button id='"+data[i].time+"' class='timeBnt";
				if(data[i].blockedStatus=='t') {
					bnt += " closeTime";
				}
				bnt += "'>"+data[i].time.substr(0,2)+":"+data[i].time.substr(2,2)+"</button>";
				
				$("#timeList").append(bnt);
			}
			
		}
	});
}


function timeList() {
//var datetime = new Date("${dateStr}");
$("#timeList").html("<img id='loadingImg' src='/seeadoctor/images/admin/calendar/loading-ellipsis.gif'/>");

$.ajax({
	type : "POST",
	url : "/seeadoctor/admin/calendar/timeList.json",
	data : {
		hospitalSeq : hospitalSeq,
		doctorSeq : $(".activeDoc").attr("id"),
		dateStr : dateStr
	},
	success : function (data) {
		
		$("#timeList").html("");
		
		var bnt = "";
		if(data.length == 0) bnt += "<h4>휴무일입니다.</h4>"
		for(var i=0; i<data.length; i++) {
			bnt += "<button id='"+data[i].time+"' class='timeBnt";
			if(data[i].blockedStatus=='t') {
				bnt += " closeTime";
			}
			bnt += "'>"+data[i].time.substr(0,2)+":"+data[i].time.substr(2,2)+"</button>";
		}
			$("#timeList").html(bnt);
		
	}
});
}

timeList();



$(".doctorBnt").click(function () {
	$(".doctorBnt").removeClass("activeDoc");
	$(this).addClass("activeDoc");
	timeList();
});

$(".submitPop").click(function () {
var closeList = $(".closeTime");
var closeArr = new Array();

for(var i = 0; i < closeList.length; i++) {
	closeArr.push($(closeList[i]).attr("id"));
}

console.log(closeArr);
$.ajaxSettings.traditional = true;	
	$.ajax({
		type : "POST",
		url : "/seeadoctor/admin/calendar/closeTime.json",
		data : {
			hospitalSeq : hospitalSeq,
			doctorSeq : $(".activeDoc").attr("id"),
			closeArr : closeArr,
			dateStr : dateStr
		},
		success : function (result) {
			alert("시간설정이 정상적으로 완료되었습니다.");
		}
	});
	
});

$(".closePop").click(function () {
	self.close();
});