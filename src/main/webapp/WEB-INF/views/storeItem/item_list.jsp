<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.table>tbody>tr>td{
	padding-left: 5px;
	padding-right: 5px;
}

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
						<button class="dropdown-btn">재고관리<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/storeItem/itemList">재고현황</a>
						</div>
					</li>
					<li>
						<button class="dropdown-btn">판매관리<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/storeItem/sale_list">판매조회</a><br /><br />
							<a href="${pageContext.request.contextPath}/storeItem/sale_record">판매등록</a>
						</div>
					</li>
				</ul>
			</div>

			<div id="popup_mask"></div>
			<div id="popupBox">
				<div class="innerMessage"></div>
				<div><button type='button' class='a-button green inner-button' onclick="closeModal()">확인</button></div>
			</div>
			

		<div id="updateItemDiv" class="windowBox">
			<div class="mainBoxDiv">
			<h3>품목수정</h3>
			<hr />
				<table class="table">
					<tbody class="modalTbody">
						<tr>
							<th>품목그룹1</th>
							<td>
								<span id="itemNum1"></span>
								<input type="hidden" id="updateNum" class="update" >
							</td>
							<th>품목그룹2</th>
							<td>
								<span id="itemNum2"></span>
							</td>
						</tr>
						<tr>
							<th>품목명</th>
							<td colspan="3"><span id="updateName" class="update" ></span></td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="search" id="updateQty" class="update" /></td>
							<th>최소 수량</th>
							<td><input type="search" id="minQty" class="update" /></td>
						</tr>
						<tr>
							<th>취급여부</th>
							<td colspan="3">
								<label class="gLabel"><input type="radio" class="fChk updateUsage val1" name="updateUsage" value="1" checked="checked">취급</label>
								<label class="gLabel"><input type="radio" class="fChk updateUsage val9" name="updateUsage" value="9" >미취급</label>
							</td>
						</tr>
					</tbody>
				</table>
				<button type="button" class="a-button medium green" id="itemupdateBtn" onclick="itemBtn('update')">수정</button>
				<button type="button" class="a-button medium black" onclick="closeBox('updateItemDiv')">닫기</button>
			</div>
		</div>

			<div class="main">
				<h3>재고 현황</h3>
				<div class="right"><button type="button" class="a-button big" onclick="itemList()"><i class="fas fa-search"></i>&nbsp;검색</button></div>
				<hr />
				<table class="table">
					<thead>
						<tr>
							<th width="50%">품목코드</th>
							<td><input type="search" id="itemNum">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							<th  width="50%" >품목명</th>
							<td><input type="search" id="itemName"/></td>
					</tr>
						<tr>
							<th>단가</th>
							<td><input type="search" id="itemPrice">&nbsp;&nbsp;~&nbsp;&nbsp;<input type="search" id="itemPricePair" ></td>
							<th>재고보유수량</th>
							<td><input type="search" id="itemQty">&nbsp;~&nbsp;<input type="search" id="itemQtyPair" ></td>
						</tr>
						<tr>
							<th >취급여부</th>
							<td>
								<label class="gLabel"><input type="radio" class="fChk condition" name="itemUsage" value="0" checked="checked">전체</label>&nbsp;&nbsp;|
								<label class="gLabel"><input type="radio" class="fChk condition" name="itemUsage" value="1">취급</label>
								<label class="gLabel"><input type="radio" class="fChk condition" name="itemUsage" value="9">중단</label>
							</td>
							<th>대분류</th>
							<td>
								<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="A">원재료</label>
								<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="B" >푸드</label>
								<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="C" >MD상품</label>
								<label class="gLabel"><input type="checkbox" name="kind" class="fChk kind" value="D" >기타</label>
							</td>
						</tr>
						<tr>
							<th>상세분류</th>
							<td colspan="3">
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
								<input type="hidden" id="storeId" value="1021" />
							</td>
						</tr>
					</thead>
				</table>
				
				
				<hr>
				<div class="right"  id="countDiv"></div>
				<br />
				<div class="information">
					<button type="button" class="a-button gray medium" onclick="update(0)"><i class="fas fa-edit"></i>&nbsp;재고 수정</button>
					<button type="button" class="a-button red medium" onclick="remove()"><i class="fas fa-times"></i>&nbsp;품절 처리</button>
					<table class="table">
						<thead>
							<tr>
								<th style="width:0.5px"><input type="checkbox" class="allChk"></th>
								<th style="width:0.5px">번호</th>
								<th >품목코드</th>
								<th >폼목명(단위)</th>
								<th >단가</th>
								<th >총 재고 수량</th>
								<th >최소 유지 수량</th>
								<th >총 재고액</th>
								<th style="width:0.5px">취급여부</th>
							</tr>
						</thead>
						<tbody id="resultItem"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
	$(".details").hide();
	itemList();
	

	function itemList() {
		// 검색유효성검사추가 : 가격과수량 큰거작은거/ 숫자만 문자만 등등
		var storeId=$("#storeId").val();
		var itemNum=$("#itemNum").val();
		var itemName=$("#itemName").val();
		var itemUsage=$(".condition:checked").val(); 
		var itemPrice=$("#itemPrice").val();
		var itemPricePair=$("#itemPricePair").val();
		if (itemPrice=='' && itemPricePair!='') {
			itemPrice=itemPricePair;
		} else if (itemPricePair=='' && itemPrice!='') {
			itemPricePair=itemPrice;
		} 
		var itemQty=$("#itemQty").val();
		var itemQtyPair=$("#itemQtyPair").val();
		if (itemQty=='' && itemQtyPair!='') {
			itemQty=itemQtyPair;
		} else if (itemQtyPair=='' && itemQty!='') {
			itemQtyPair=itemQty;
		} 
		var categorys=[];
		$(".kind:checked").each(function(i) {
			categorys.push($(this).val());
		});
		 // json편집으로 추후수정
		if(categorys.length==0){
			categorys.push('-');
		}
		$.ajax({
			type: "POST",
			url: "itemList",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"storeId":storeId, "itemNum":itemNum,"itemName":itemName,"itemPrice":itemPrice,"itemPricePair":itemPricePair,"itemQty":itemQty,"itemQtyPair":itemQtyPair,"categorys":categorys,"itemUsage":itemUsage}),
			dataType: "json",
			success: function(json) {
				$("#resultItem").empty();
				$("#countDiv").html("총 검색결과 : "+json.length+"건");
				
				if(json.length==0) {
					var html="<tr><td colspan='8'>검색된 재고정보가 존재하지않습니다.</td><tr>";
					$("#resultItem").html(html);
					return;
				}
			
				var html="";
				var number=0;
	       		$(json).each(function() {
	       			var total=Number(this.itemQty*this.itemPrice);
	       			number++;
	       			html+="<tr><td><input type='checkbox' class='rowChk' value='"+this.itemNum+"'></td><td>"+number
		       			+"</td><td>"+this.itemNum+"</td>"
						+"<td>"+this.itemName.split("_")[0]+" ("+this.itemName.split("_")[1]+")</td>"
						+"<td>"+this.itemPrice+"</td>"
					if (this.itemQty==0) {
						html+="<td class='red-font'>"+"품절"+"</td>";
					} else {
						html+="<td>"+this.itemQty+"</td>";
					}
					html+="<td>"+this.minQty+"</td>" // DB정리후 출력
						+"<td>"+total+"</td>";
					if(this.itemUsage==1) {
						html+="<td class='green-font'>O</td></tr>";
					} else if(this.itemUsage==9) {
						html+="<td class='red-font'>X</td></tr>";
					} 
				});    
	       		
				$("#resultItem").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
		
	}	
	
	
	
	
	function update(itemNum) {
		var storeId=$("#storeId").val();
		var itemNum=itemNum;
		if(itemNum==0){
			if($('.rowChk:checked').length==0) {
				openModal("선택된 품목이 존재하지않습니다.<br>수정을 원하시는 품목을 선택해주세요.<br><br>");
				$("#popupBox").show(300);  
				return;
			} else if ($('.rowChk:checked').length==1) {
				itemNum=$('.rowChk:checked').val();
			} else {
				openModal("한가지 품목만 수정할 수 있습니다.<br>하나의 품목만 선택해주세요.<br><br>");
				$("#popupBox").show(300);  
				return;
			}
		}
		
		openBox("updateItemDiv");
		$.ajax({
			type: "Post",
			url: "getItem",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"storeId":storeId, "itemNum":itemNum}),
			dataType: "json",
			success: function(json) {
				if (json.itemNum.substring(0,1) == 'A') {
					$("#itemNum1").text('원재료');
       				if(json.itemNum.substring(1,3) == '01') {
       					$("#itemNum2").text('원두');
       				} else if(json.itemNum.substring(1,3) == '02') {
       					$("#itemNum2").text('티');
       				} else if(json.itemNum.substring(1,3) == '03') {
       					$("#itemNum2").text('부재료');
       				} else if(json.itemNum.substring(1,3) == '04') {
       					$("#itemNum2").text('기타');
       				}
       			} else if (json.itemNum.substring(0,1) == 'B') {
       				$("#itemNum1").text('푸드');
       				if(json.itemNum.substring(1,3) == '05') {
       					$("#itemNum2").text('베이커리');
       				} else if(json.itemNum.substring(1,3) == '06') {
       					$("#itemNum2").text('케이크');
       				} else if(json.itemNum.substring(1,3) == '07') {
       					$("#itemNum2").text('샌드위치');
       				} else if(json.itemNum.substring(1,3) == '08') {
       					$("#itemNum2").text('디저트');
       				} else if(json.itemNum.substring(1,3) == '09') {
       					$("#itemNum2").text('아이스크림');
       				} else if(json.itemNum.substring(1,3) == '10') {
       					$("#itemNum2").text('병음료');
       				} else if(json.itemNum.substring(1,3) == '11') {
       					$("#itemNum2").text('기타');
       				}
       			} else if (json.itemNum.substring(0,1) == 'C') { 
       				$("#itemNum1").text('상품');
       				if(json.itemNum.substring(1,3) == '12') {
       					$("#itemNum2").text('머그컵');
       				} else if(json.itemNum.substring(1,3) == '13') {
       					$("#itemNum2").text('글래스컵');
       				} else if(json.itemNum.substring(1,3) == '14') {
       					$("#itemNum2").text('텀블러');
       				} else if(json.itemNum.substring(1,3) == '15') {
       					$("#itemNum2").text('콜드컵');
       				} else if(json.itemNum.substring(1,3) == '16') {
       					$("#itemNum2").text('악세사리');
       				} else if(json.itemNum.substring(1,3) == '17') {
       					$("#itemNum2").text('커피용품');
       				} else if(json.itemNum.substring(1,3) == '18') {
       					$("#itemNum2").text('기타');
       				}
       			} else if (json.itemNum.substring(0,1) == 'D') { 
       				$("#itemNum1").text('기타');
       				$("#itemNum2").text('*');
       			}
				$("#updateNum").val(json.itemNum);
				$("#updateName").text(json.itemName);
				$("#updateQty").val(json.itemQty);
				$("#minQty").val(json.minQty);
				$(".updateUsage:checked").val(1);
				
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
	
	function itemBtn(btn) {
		var storeId=$("#storeId").val();
		var btn=btn;
		var itemNum=$("#"+btn+"Num").val();
		var itemQty=$("#"+btn+"Qty").val();
		var minQty=$("#minQty").val();
		var itemUsage=$(".updateUsage:checked").val();
		
		if(itemNum=="") {
			alert("반드시 카테고리를 선택하여 품목을 지정해주세요.");
			return;
		}
		if(itemQty=="") {
			alert("수량을 입력해주세요.");
			return;
		}
		$.ajax({
			type: "PUT",
			url: "itemModify",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"storeId":storeId, "itemNum":itemNum,"itemQty":itemQty,"minQty":minQty,"itemUsage":itemUsage}),
			dataType: "text", 
			success: function(text) {
				if(text=="success") {
					closeBox("updateItemDiv");
					itemList();
				}
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
	
	
	function remove() {
		var items=[];
		var storeId=$("#storeId").val();
		if($('.rowChk:checked').length==0) {
			openModal("선택된 품목이 존재하지않습니다.<br>품절 상품을 선택해주세요.<br><br>");
			$("#popupBox").show(300);  
			return;
		} else {
			$(".message").empty();
			$(".rowChk:checked").each(function(i) {
				items.push($(this).val());
			});
		}
		
		$.ajax({
			type: "PUT",
			url: "itemDelete",
			headers: {"content-type":"application/json","X-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"storeId":storeId,"items":items}),
			dataType: "text", 
			success: function(text) {
				if(text=="success") {
					$(".rowChk").prop("checked", false); 
					openModal("선택된 품목이 품절처리 완료되었습니다.<br><br><br>");
					itemList();
				}
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
		$(".update").val(""); 
	}
	 
	function closeBox(box) {
		$(".update").val(""); 
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