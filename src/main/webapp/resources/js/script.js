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
	
	
	$(".numnum").mouseenter(function() {
		if($(".nav-counter").text()!=0){
			$(".notifyTri").show();
			$(".notifyList").show();
		}
	});
	
	$(".notifyList").mouseleave(function() {
		$(".notifyTri").hide();
		$(".notifyList").hide();
	});
	
	$(".numnum").click(function() {
		$(".notifyTri").show();
		$(".notifyList").show();
		
		$.ajax({
			type: "GET",
			url: "upupNumDel",
			success: function(json){
				var num=Number($(".nav-counter").text());
				$(json).each(function(i) {
					
					num+=1;
				});
				$(".notifyTri").attr("display", none);
				$(".notifyList").removeChild();
				$(".nav-counter").text(Number(num));
			},
			error: function(xhr){
				alert("에러코드 = "+xhr.status);
			}
		})
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
	/* $('.addTr').click(function(){
			$(".message").text(" ");
			var newitem = $(".table>tbody tr:eq(1)").clone();
			$(".table>tbody").append(newitem);
		});
			
		*/	
		$(".delTr").click(function() {
			$(".message").text(" ");
		    
		    //체크된 행이 없을 경우.
		    if($('.rowChk:checked').length == 0){  
		   	 $(".message").text("삭제할 행을 선택하여 주십시오.");
		    } else {                  
		       $('.rowChk:checked').each(function(i){   
		       	
		            if($('.rowChk').length == 1){  
		           	 $(".message").text("모든 행을 삭제할 수 없습니다.")
		            } else {        
		               var clickedRow = $(this).parent().parent();   
		               clickedRow.remove();
		            }                         
		      	});                    
		    }            
		});
	 
		
		
		/*// 카테고리명에 따라 서브카테고리를 추가
		$(".category").change(function() {
			$(".subCategory").empty();
			$(".itemName").empty();
			
			var category=$(this).val();
			
			$(".subCategory").append($("<option value=''>---------------------------</option>")); 
			$(".itemName").append($("<option value=''>---------------------------</option>")); 
			
			switch (category) {
				case "A": 
					$(".subCategory").append($("<option value='01'>원두종류</option>")); 
					$(".subCategory").append($("<option value='02'>티백</option>")); 
					$(".subCategory").append($("<option value='03'>부재료</option>")); 
				break;
				case "B": 
					$(".subCategory").append($("<option value='01'>베이커리</option>")); 
					$(".subCategory").append($("<option value='02'>케이크</option>")); 
					$(".subCategory").append($("<option value='03'>샌드위치</option>")); 
					$(".subCategory").append($("<option value='04'>디저트</option>")); 
					$(".subCategory").append($("<option value='05'>아이스크림</option>")); 
					$(".subCategory").append($("<option value='06'>병음료</option>")); 
				break;
				case "C":
					$(".subCategory").append($("<option value='01'>머그</option>")); 
					$(".subCategory").append($("<option value='02'>글라스</option>")); 
					$(".subCategory").append($("<option value='03'>텀블러</option>")); 
					$(".subCategory").append($("<option value='04'>보온병</option>")); 
					$(".subCategory").append($("<option value='05'>액세서리</option>")); 
					$(".subCategory").append($("<option value='06'>커피용품</option>")); 
				break;
			}
		});
		
		
		// 아이템 관련 jsp 에서 상품명 출력
		$(".subCategory").change(function() {
			$(".itemName").empty();
			$(".itemName").append($("<option value=''>-------------------------------</option>")); 
			
			var item={
				category	: $(".category").val(),
				subCategory : $(this).val()
			}
			
			$.ajax({
				type: "POST",
				url: "getItem",
				headers: {"content-type":"application/json"},
				data: JSON.stringify(item),
				dataType:"json",
				success: function(json) {
					$(json.items).each(function(i) {
						$(".itemName").append($("<option value='"+json.items[i]+"'>"+json.items[i]+"</option>"));
					});
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
		});
		
		
		//카테고리명에 따라 서브카테고리를 추가
		$(".saleCategory").change(function() {
			$(".saleSubCategory").empty();
			$(".saleProduct").empty();
			
			var saleCategory=$(this).val();
			
			$(".saleSubCategory").append($("<option value=''>---------------------------</option>")); 
			$(".saleProduct").append($("<option value=''>---------------------------</option>")); 
			
			switch (saleCategory) {
				case "A": 
					$(".saleSubCategory").append($("<option value='커피'>커피</option>")); 
					$(".saleSubCategory").append($("<option value='라떼/모카/초콜릿'>라떼/모카/초콜릿</option>")); 
					$(".saleSubCategory").append($("<option value='프라프치노'>프라프치노</option>")); 
					$(".saleSubCategory").append($("<option value='블랜디드'>블랜디드</option>")); 
					$(".saleSubCategory").append($("<option value='피지오'>피지오</option>")); 
					$(".saleSubCategory").append($("<option value='티'>티</option>")); 
					$(".saleSubCategory").append($("<option value='기타'>기타</option>")); 
				break;
				case "B": 
					$(".saleSubCategory").append($("<option value='01'>베이커리</option>")); 
					$(".saleSubCategory").append($("<option value='02'>케이크</option>")); 
					$(".saleSubCategory").append($("<option value='03'>샌드위치</option>")); 
					$(".saleSubCategory").append($("<option value='04'>디저트</option>")); 
					$(".saleSubCategory").append($("<option value='05'>아이스크림</option>")); 
					$(".saleSubCategory").append($("<option value='06'>병음료</option>")); 
				break;
				case "C":
					$(".saleSubCategory").append($("<option value='01'>머그</option>")); 
					$(".saleSubCategory").append($("<option value='02'>글라스</option>")); 
					$(".saleSubCategory").append($("<option value='03'>텀블러</option>")); 
					$(".saleSubCategory").append($("<option value='04'>보온병</option>")); 
					$(".saleSubCategory").append($("<option value='05'>액세서리</option>")); 
					$(".saleSubCategory").append($("<option value='06'>커피용품</option>")); 
				break;
			}
		});
		
		
		// 판매 관련 jsp 에서 상품명 출력
		$(".saleSubCategory").change(function() {
			$(".saleProduct").empty();
			$(".saleProduct").append($("<option value=''>-------------------------------</option>")); 
			
			var sale={
				storeId			: $(".storeId").val(),
				saleCategory	: $(".saleCategory").val(),
				saleSubCategory : $(this).val()
			}
			
			$.ajax({
				type: "POST",
				url: "saleProduct",
				headers: {"content-type":"application/json"},
				data: JSON.stringify(sale),
				dataType:"json",
				success: function(json) {
					if($(".saleCategory").val()=='A'){
						$(json.saleProduct2).each(function(i) {
							$(".saleProduct").append($("<option value='"+json.saleProduct2[i]+"'>"+json.saleProduct2[i]+"</option>"));
						});
					}else {
						$(json.saleProduct1).each(function(i) {
							$(".saleProduct").append($("<option value='"+json.saleProduct1[i]+"'>"+json.saleProduct1[i]+"</option>"));
						});
					}
					
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
		});
	 */
		
		
	 
	 
	 