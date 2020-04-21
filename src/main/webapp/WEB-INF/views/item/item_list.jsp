<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.choice { display: none; }
</style>
<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn">품목 현황<i class="fa fa-caret-down"></i></button>
					</li>
					<li>
						<button class="dropdown-btn">재고 현황<i class="fa fa-caret-down"></i></button>
					</li>
				</ul>
			</div>

			<div class="main">
			
				<h3>재고 현황</h3>
				<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
				<hr />
				<table class="table">
					<thead>
						<tr>
							<th width="10%">상품카테고리</th>
							<td width="40%">
							<select id="category" name="num1">
								<option>대분류</option>
								<option value="A">제조음료</option>
								<option value="B">푸드</option>
								<option value="C">상품</option>
							</select>
							<select id="categoryA" class="choice" name="num2">
								<option>제조음료 소분류</option>
								<option value="01">원두</option>
								<option value="02">티백</option>
								<option value="03">부재료</option>
							</select>
							<select id="categoryB" class="choice" name="num2">
								<option>푸드 소분류</option>
								<option value="01">베이커리</option>
								<option value="02">케이크</option>
								<option value="03">샌드위치</option>
								<option value="04">디저트</option>
								<option value="05">아이스크림</option>
								<option value="06">병음료</option>
							</select>
							<select id="categoryC" class="choice" name="num2">
								<option>상품 소분류</option>
								<option value="01">머그</option>
								<option value="02">글라스</option>
								<option value="03">텀블러</option>
								<option value="04">보온병</option>
								<option value="05">악세서리</option>
								<option value="06">커피용품</option>
							</select>
							</td>
							<th>거래처</th>
							<td><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th>물품코드</th>
							<td><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							<th>품목명</th>
							<td><input type="search" ></td>
						</tr>
						<tr>
							<th>공급가</th>
							<td><input type="search" >&nbsp;~&nbsp;<input type="search" ></td>
							<th>수량</th>
							<td><input type="search" >&nbsp;~&nbsp;<input type="search" ><label class="gLabel"><input type="checkbox" class="fChk" >품절</label></td>
						</tr>
						
					</thead>
				</table>
				
				<div class="right">
					<button type="button" class="a-button sea medium" value="재고등록" onclick="window.open('${pageContext.request.contextPath}/window/itemEnroll','재고등록','width=400px','height=900px')"><i class="fas fa-plus-circle"></i>&nbsp;재고 등록</button>
					<button type="button" class="a-button purple medium"><i class="fas fa-edit"></i>&nbsp;재고 수정</button>
					<button type="button" class="a-button red medium"><i class="fas fa-times"></i>&nbsp;재고 삭제</button>
				</div>
				
				<br />
				<hr>
				<div class="information">
					<table class="table">
						<tbody>
							<tr>
								<th ><input type="checkbox" class="allChk"></th>
								<th >번호</th>
								<th >품목코드</th>
								<th >폼목명(단위)</th>
								<th >거래처</th>
								<th >매입단가</th>
								<th >공급가</th>
								<th >총 재고 수량</th>
								<th >최소 유지 수량</th>
								<th >총 재고액</th>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td >1</td>
								<td >A001-1</td>
								<td>블랙 퍼스트 마일 (1.5kg)</td>
								<td>커피코피커피냠</td>
								<td class="price0">5000</td>
								<td>9000</td>
								<td class="qty0">2000</td>
								<td class="min_q0">100</td>
								<td class="total0"></td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td >2</td>
								<td >A001-1</td>
								<td>블랙 퍼스트 마일 (1.5kg)</td>
								<td>커피코피커피냠</td>
								<td class="price1">10000</td>
								<td>18000</td>
								<td class="qty1">2000</td>
								<td class="min_q1">100</td>
								<td class="total1"></td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td >3</td>
								<td >A001-1</td>
								<td>블랙 퍼스트 마일 (1.5kg)</td>
								<td>커피코피커피냠</td>
								<td class="price3">15000</td>
								<td>19000</td>
								<td class="qty3">50</td>
								<td class="min_q3">1100</td>
								<td class="total3"></td>
							</tr>
							<tr>
								<td colspan="6">합계</td>
								<td id="price_tot"></td>
								<td id="qty_tot"></td>
								<td id="min_q_tot"></td>
								<td id="total_tot"></td>
							</tr>
						</tbody>
					</table>
				</div>
			
			</div>

		</div>
	</div>


<script type="text/javascript">
	$('#category').change(function() {
		var category = jQuery('#category option:selected').val();
		if (category== 'A') {
			$('.choice').hide();
			$('#categoryA').show();
		} else if (category=='B') {
			$('.choice').hide();
			$('#categoryB').show();
		} else if (category=='C') {
			$('.choice').hide();
			$('#categoryC').show();
		} else {
			$('.choice').hide();
		} 
	});

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

	
	 // 총 재고액 계산
	 var price=new Array();
	 var qty=new Array();
	 var min_q=new Array();
	 var total=new Array();
	 
	 var qty_tot=price_tot=min_q_tot=total_tot=0;
	 
	 for(i=0; i<3; i++){
		 $(".min_q"+i).css("color", "green");
		 price.push(parseInt($(".price"+i).text()));
		 qty.push(parseInt($(".qty"+i).text()));
		 min_q.push(parseInt($(".min_q"+i).text()));
		 total.push(qty[i]*price[i]);
		 $(".total"+i).text(addCommas(total[i]));
		 
		 price_tot+=price[i];
		 qty_tot+=qty[i];
		 min_q_tot+=min_q[i];
		 total_tot+=total[i];
	 
		 $("#price_tot").text(addCommas(price_tot));
		 $("#qty_tot").text(addCommas(qty_tot));
		 $("#min_q_tot").text(addCommas(min_q_tot));
		 $("#total_tot").text(addCommas(total_tot));
	 }
	 
	/*  
	var qty=parseInt($(".qty").text());
	var price=parseInt($(".price").text());
	
	$(".total").text(addCommas(qty*price)); 
	
	*/
	
	
	//3자리 단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	
		
	
</script>