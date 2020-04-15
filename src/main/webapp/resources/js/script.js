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
	 
	 
	 
	 
	 