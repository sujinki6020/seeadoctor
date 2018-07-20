	$(".messageImg").click(function () {
		var message = $(this).parent().next().next();
		if(message.css("display") == "none"){
			message.show();
		}else{
			message.hide();
		}
	});
	
	var check = $("input[type='checkbox']");
	check.click(function(){
		if($(this).parent().next().css("display") == "inline-block") {
			alert("이미 진료가 끝난 예약입니다.");
			$(this).prop("checked", true);
			return;
		}else if($(this).next().next().val()==3) {
			alert("날짜가 지난 예약은 수정할 수 없습니다.");
			$(this).prop("checked", false);
			return;
		}else {
		  $(this).parent().next().toggle();
		  $(this).parent().prev().toggle();
		  /* 상태 업데이트 ajax하기 */
		  $.ajax({
			  type: "POST",
			  url: "/seeadoctor/admin/calendar/updateReserveStatus.json",
			  data: {
				  reserveSeq : $(this).prev().val()
			  },
			  success: function () {
				alert("정상적으로 완료처리 되었습니다.");
		   	}
		  });
		}
	});