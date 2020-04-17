// 상단 메뉴바 마우스 엔터시 메뉴 보임 및 숨김
	$(".nav-item").mouseenter(function(){
		$(".drop-menu").hide();
		$(".tri").hide();
		for(var i=0; i<$(".nav-item").length; i++){
			if($(this).text()==$(".nav-left-list").children($(".nav-item")).eq(i).text()){
				$(".nav-left-list").children($(".nav-item")).eq(i).find($(".tri")).toggle();
				$(".drop-menu").eq(i).toggle();
			}
		}
	});
	
	// 날짜 스크립트
	$(function() {
	    $( ".datepicker" ).datepicker({
	         changeMonth: true, 
	         buttonImage: "<i class='far fa-calendar-alt'></i>",
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         nextText: '다음 달',
	         prevText: '이전 달',
	         dateFormat: "yy-mm-dd"
	  });
	});
	
	// 상단 메뉴바 마우스 클릭시 메뉴 보임 및 숨김
	$(".nav-item").click(function(){
		$(".drop-menu").hide();
		$(".tri").hide();
		for(var i=0; i<$(".nav-item").length; i++){
			if($(this).text()==$(".nav-left-list").children($(".nav-item")).eq(i).text()){
				$(".nav-left-list").children($(".nav-item")).eq(i).find($(".tri")).toggle();
				$(".drop-menu").eq(i).toggle();
			}
		}
	});
	
	// 사이드 메뉴 클릭시 하단 메뉴 보임 및 숨김
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
		  this.classList.toggle("active-side");
		  var dropdownContent = this.nextElementSibling;
		  if (dropdownContent.style.display === "block") {
		 	 dropdownContent.style.display = "none";
		  } else {
			  dropdownContent.style.display = "block";
		  }
	  });
	}
	
	 // 검색결과 체크박스 
	 $(".allChk").change(function() {
	 	if($(this).is(":checked")){
	 		$(".rowChk").prop("checked", true)
	 	}else{
			$(".rowChk").prop("checked", false)
	 	}
	 });
	 
	// 전체선택 버튼 클릭시 체크박스 
	 $("#chk").click(function() {
		 if($(".allChk").is(":checked") || $(".rowChk").is(":checked")){
			 $(".allChk").prop("checked", false);
			 $(".rowChk").prop("checked", false);
		 }else{
			 $(".allChk").prop("checked", true);
			 $(".rowChk").prop("checked", true);
		 }
	 });
	 
	 
	 // 발주에서 발주상태에 따른 버튼 누를시 배경색 변화
	 $(".order-sta>li").click(function(){
		 $(".order-sta>li").removeClass();
		 $(this).addClass("blackgray");
	 });
	 
	 
	 // 행 추가 및 삭제
	 $('.addTr').click(function(){
			$(".message").text(" ");
			var newitem = $(".table>tbody tr:eq(1)").clone();
			$(".table>tbody").append(newitem);
		});
			
			
		$(".delTr").click(function() {
			$(".message").text(" ");
		    
		    //체크된 행이 없을 경우.
		    if($('.rowChk:checked').length == 0){  
		   	 $(".message").text("삭제할 행을 선택하여 주십시오.");
		    } else {                  
		       $('.rowChk:checked').each(function(index){   
		       	
		            if($('.rowChk').length == 1){  
		           	 $(".message").text("모든 행을 삭제할 수 없습니다.")
		            } else {        
		               var clickedRow = $(this).parent().parent();   
		               clickedRow.remove();
		            }                         
		      	});                    
		    }            
		});
	 
	 
	 
	 
	 