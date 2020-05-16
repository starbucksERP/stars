<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#popupBox {
	width: 400px;
	height: 160px;
	border: 3px solid #4C4C4C;
	background-color: white;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -40px;
	padding: 5px;
	z-index: 200;
	display: none;
}
.innerMessage {
	width:80%;
	margin:0 auto;
	padding-top: 35px;
	text-align: center;
	z-index: 201;
	color: #4C4C4C;
	font-size: 15px;
}
.windowBox {
	width: 600px;
	height: 660px;
	border: 3px solid #4C4C4C;
	background-color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	padding: 5px;
	z-index: 100;
	display: none;
	border-radius: 50px;
}
#popup_mask { 
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none; 
	background-color:#000;
	z-index: 99;
	opacity: 0.5;
}
.mainBoxDiv {
	width: 85%;
	border: 1px solid #eee;
	margin: 20px auto;
	padding: 20px 10px;	
	border-radius: 50px;
	text-align: center;
}
</style>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/order/orderRequestList">발주요청조회</a><br /><br />
							<a href="${pageContext.request.contextPath}/order/orderStateList">발주현황조회</a></div>
				</li>
				<li>
					<button class="dropdown-btn">구매<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/purchase/purchasePlan">구매계획</a><br /><br />
						<a href="${pageContext.request.contextPath}/purchase/purchaselist">구매현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/purchase/purchaseAdd">구매입력</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/order/history">입출하조회</a>
					</div>
				</li>
				
			</ul>
		</div>
		<div id="popup_mask"></div>
		<div id="popupBox">
			<div class="innerMessage"></div>
			<div><button type='button' class='a-button green inner-button' onclick="closeModal()">확인</button></div>
		</div>

		<div class="main">
		
			<h3>구매계획설정</h3>
			<div class="right"><button type="button" class="a-button big" onclick="itemPlanList()">검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th width="13%">품목코드</th>
						<td width="30%"><input type="search" id="itemNum" placeholder="ex)A01-1"></td>
						<th  width="13%" >품목명</th>
						<td width="44%"><input type="search" id="itemName" placeholder="ex)코코넛칩"/></td>
					</tr>
					<tr>
						<th width="50%">거래처</th>
						<td><input type="search" id="itemVendor" placeholder="ex)HappyBakery"></td>
						<th>최종수정자</th>
						<td><input type="search" id="itemDm" placeholder="ex)홍길동"/></td>
					</tr>
					<tr>
						<th>대분류</th>
						<td>
							<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="A">원재료</label>
							<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="B" >푸드</label>
							<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="C" >MD상품</label>
							<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="D" >기타</label>
						</td>
						<th>상세분류</th>
						<td>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="01-">원두</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="02-" >티백</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="03-" >부재료</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="04-" >기타(원재료)</label><br>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="05-" >베이커리</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="06-" >케이크</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="07-" >샌드위치</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="08-" >디저트</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="09-" >아이스크림</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="10-" >병음료</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="11-" >기타(푸드)</label><br>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="12-" >머그컵</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="13-" >글라스컵</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="14-" >텀블러</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="15-" >콜드컵</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="16-" >악세서리</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="17-" >커피용품</label>
							<label class="gLabel"><input type="checkbox" class="fChk kind" name="kind2" value="18-" >기타(MD상품)</label>
						</td>
					</tr>
				</thead>
			</table>
			
			<br />
			
			<hr>
			<div class="right darkgreen-font"  id="countDiv"></div>
			<br />
			
			<div><button type="button" class="a-button padding-button red" onclick="update(0,'multi')">일괄초기화</button></div>
			<div class="information">
				<table class="table cal">
				<thead>
					<tr>
						<th style="width: 3%;"><input type="checkbox" class="allChk"></th>
						<th style="width: 4%;">번호</th>
						<th style="width: 7%;">거래처명</th>
						<th style="width: 15%;">분류</th>
						<th style="width: 8%;">상품코드</th>
						<th style="width: 25%;">상품명</th>
						<th style="width: 10%;">최소보유량</th>
						<th style="width: 8%;">최종수정자</th>
						<th style="width: 10%;">수정</th>
						<th style="width: 10%;">삭제</th>
					</tr>
				</thead>
				<tbody id="resultItemPlan"></tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	itemPlanList();
	 
	 function itemPlanList() {
		// 검색유효성검사추가 : 가격과수량 큰거작은거/ 숫자만 문자만 등등
		var itemNum=$("#itemNum").val();
		var itemName=$("#itemName").val();
		var itemVendor=$("#itemVendor").val();
		var itemDm=$("#itemDm").val();
		var categorys=[];
		$(".kind:checked").each(function(i) {
			categorys.push($(this).val());
		});
		if(categorys.length==0){
			categorys.push('-');
		}
		
		$.ajax({
			type: "POST",
			url: "productPlan",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"itemNum":itemNum,"itemName":itemName,"itemVendor":itemVendor,"itemDm":itemDm,"categorys":categorys}),
			dataType: "json",
			success: function(json) {
				$("#resultItemPlan").empty();
				$("#countDiv").html("총 검색결과 : "+json.length+"건  ");
				
				if(json.length==0) {
					var html="<tr><td colspan='10' class='red-font' style='font-weight:bold;'>검색된 구매계획 정보가 존재하지않습니다.</td><tr>";
					$("#resultItemPlan").html(html);
					return;
				}
			
				var html="";
				var number=0;
	       		$(json).each(function() {
	       			number++;
	       			html+="<tr><td><input type='checkbox' class='rowChk' value='"+this.itemNum+"'></td><td>"+number
		       			+"</td><td>"+this.itemVendor+"</td><td>";
	       			if (this.itemNum.substring(0,1) == 'A') {
	       				html+="[원재료/";
	       				if(this.itemNum.substring(1,3) == '01') {
	       					html+="원두]</td>";
	       				} else if(this.itemNum.substring(1,3) == '02') {
	       					html+="티]</td>";
	       				} else if(this.itemNum.substring(1,3) == '03') {
	       					html+="부재료]</td>";
	       				} else if(this.itemNum.substring(1,3) == '04') {
	       					html+="기타]</td>";
	       				}
	       			} else if (this.itemNum.substring(0,1) == 'B') {
	       				html+="[푸드/";
	       				if(this.itemNum.substring(1,3) == '05') {
	       					html+="베이커리]</td>";
	       				} else if(this.itemNum.substring(1,3) == '06') {
	       					html+="케이크]</td>";
	       				} else if(this.itemNum.substring(1,3) == '07') {
	       					html+="샌드위치]</td>";
	       				} else if(this.itemNum.substring(1,3) == '08') {
	       					html+="디저트]</td>";
	       				} else if(this.itemNum.substring(1,3) == '09') {
	       					html+="아이스크림]</td>";
	       				} else if(this.itemNum.substring(1,3) == '10') {
	       					html+="병음료]</td>";
	       				} else if(this.itemNum.substring(1,3) == '11') {
	       					html+="기타]</td>";
	       				}
	       			} else if (this.itemNum.substring(0,1) == 'C') { 
	       				html+="[MD상품/";
	       				if(this.itemNum.substring(1,3) == '12') {
	       					html+="머그컵]</td>";
	       				} else if(this.itemNum.substring(1,3) == '13') {
	       					html+="글래스컵]</td>";
	       				} else if(this.itemNum.substring(1,3) == '14') {
	       					html+="텀블러]</td>";
	       				} else if(this.itemNum.substring(1,3) == '15') {
	       					html+="콜드컵]</td>";
	       				} else if(this.itemNum.substring(1,3) == '16') {
	       					html+="악세사리]</td>";
	       				} else if(this.itemNum.substring(1,3) == '17') {
	       					html+="커피용품]</td>";
	       				} else if(this.itemNum.substring(1,3) == '18') {
	       					html+="기타]</td>";
	       				}
	       			} else if (this.itemNum.substring(0,1) == 'D') { 
	       				html+="[기타]</td>";
	       			}	

	       			html+="<td>"+this.itemNum+"<input type='hidden' id='"+this.itemNum+"_now' value='"+this.itemNum+"'></td>"
						+"<td>"+this.itemName.split("_")[0]+" ("+this.itemName.split("_")[1]+")</td>"
						+"<td><input type='number' id='"+this.itemNum+"_nowQty' value='"+this.minQty+"'></td>"
						+"<td>"+this.itemDm+"</td>"
						
						
						+"<td><button type='button' class='a-button green inner-button' onclick=\"update(1,'"+this.itemNum+"');\">수정</button></td>"
						+"<td><button type='button' class='a-button red inner-button' onclick=\"update(0,'"+this.itemNum+"');\">초기화</button></td>";
						
				});   																	
	       		
				$("#resultItemPlan").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
		
	}	
 
	 
	function update(minQty,check) {
		if(minQty==0) {
			var minQty=0;
			var sendType='del';
			
		} else {
			var minQty=Number($("#"+check+"_nowQty").val());
			var sendType='mod';
		}
		var check=check;

		var items=[];
		if (check=='multi'){
			if($('.rowChk:checked').length==0) {
				openModal("선택된 계획이 존재하지않습니다.<br>삭제할 구매계획을 선택해주세요.<br><br>");
				$("#popupBox").show(300);  
				return;
			} else {
				$(".message").empty();
				$(".rowChk:checked").each(function(i) {
					items.push($(this).val());
				});
			}
		} else {
			items.push(check);
		}
		
		$.ajax({
			type: "PUT",
			url: "changeItemPlan",
			headers: {"content-type":"application/json","X-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"items":items,"minQty":minQty, "sendType":sendType}),
			dataType: "text", 
			success: function(text) {
				$(".rowChk").prop("checked", false); 
				if(text=='successDel') {
					openModal("선택된 구매계획이 초기화되었습니다.<br><br><br>");
				} else {
					openModal("해당 구매계획이 변경되었습니다.<br><br><br>");
				}
				itemPlanList();
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
 
	function openBox(box) {
		var box=box;
		$("#"+box).css({
			"top": (($(window).height()-$("#"+box).outerHeight())/2+$(window).scrollTop())+"px",
			"left": (($(window).width()-$("#"+box).outerWidth())/2+$(window).scrollLeft())+"px"
		});
		$("#popup_mask").show();
		$("#"+box).show(300);  
		$("body").css("overflow","hidden");
		$("#repMain").prop("checked", true);
		$("#repA").prop("checked", true);
		$("#repU").prop("checked", true);
		$('#detailA').show();
	}
	
	function resetBtn() {
		$(".insert").val("");      
		$(".update").val(""); 
	}
	 
	function closeBox(box) {
		$(".insert").val("");      
		$(".update").val(""); 
		$('.category1').removeAttr('checked');
		$('.category2').removeAttr('checked');
		$('.usage').removeAttr('checked');
		$("#"+box).hide();
		$("#popup_mask").hide(300); 
        $("body").css("overflow","auto");
	}
	
	function openModal(message) {
		var message=message;
		$("#popupBox").css({
			"top": (($(window).height()-$("#popupBox").outerHeight())/2+$(window).scrollTop())+"px",
			"left": (($(window).width()-$("#popupBox").outerWidth())/2+$(window).scrollLeft())+"px"
		});
        $(".innerMessage").html(message);
		$("#popup_mask").show();
		$("#popupBox").show(300);  
		$("body").css("overflow","hidden");
		
	}
	
	function closeModal() {
		$(".innerMessage").val("");    
		$("#popupBox").hide();
		$("#popup_mask").hide(300); 
        $("body").css("overflow","auto");
	}
	
</script>
