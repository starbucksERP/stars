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
						<button class="dropdown-btn">재고관리<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/item/productList">품목현황</a><br /><br />
							<a href="${pageContext.request.contextPath}/item/itemList">재고현황</a>
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
			<div id="insertItemDiv" class="windowBox">
				<div class="mainBoxDiv">
				<h3>재고등록</h3>
				<hr />
					<table class="table">
						<thead>
							<tr>
								<th width="40%">품목그룹1</th>
								<td width="60%">
									<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="A" id="repMain">원재료</label>
									<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="B" >푸드</label>
									<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="C" >MD상품</label>
									<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="D" >기타</label>
								</td>
							</tr>
							<tr>
								<th>품목그룹2</th>
								<td>
									<span id="detailA" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="01-" id="repA">원두</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="02-" >티백</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="03-" >부재료</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="04-" >기타</label>
									</span>
									<span id="detailB" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="05-" id="repB">베이커리</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="06-" >케이크</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="07-" >샌드위치</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="08-" >디저트</label><br>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="09-" >아이스크림</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="10-" >병음료</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="11-" >기타</label>
									</span>
									<span id="detailC" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="12-" id="repC">머그컵</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="13-" >글라스컵</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="14-" >텀블러</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="15-" >콜드컵</label><br>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="16-" >악세서리</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="17-" >커피용품</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="18-" >기타</label>
									</span>
									<span id="detailD" class="details">
										<label class="gLabel"><input type="radio" class="fChk category2 categoryD" name="category2" value="00-" id="repD">선택사항없음</label>
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
							<tr>
								<th>품목코드</th><th>품명</th>
							<tr>
						</thead>
						<tbody id="CategoryListDiv">
							<tr><td colspan="2">품목그룹을 반드시 선택해주세요</td></tr>
						</tbody>
					</table>
					<label class="gLabel">품    명 : <input type="search" id="insertName" class="insert" readonly="readonly" placeholder="검색결과 클릭입력만 가능"></label><br/><br/>
					<label class="gLabel">재고수량 : <input type="search" id="insertQty" class="insert"></label>
					<!-- <input type="search" id="insertQty" class="insert"/> -->
					<br/><br/>
					<button type="button" class="a-button medium green" id="iteminsertBtn" onclick="itemBtn('insert')">저장</button>
					<button type="button" class="a-button medium brown" onclick="resetBtn()">초기화</button>
					<button type="button" class="a-button medium black" onclick="closeBox('insertItemDiv')">닫기</button>
				</div>
			</div>

		<div id="updateItemDiv" class="windowBox">
			<div class="mainBoxDiv">
			<h3>품목수정</h3>
			<hr />
				<table class="table">
					<tbody>
						<tr>
							<th>품목그룹1</th>
							<td>
								<span id="itemNum1"></span>
								<input type="hidden" id="updateNum" class="update" >
							</td>
						</tr>
						<tr>
							<th>품목그룹2</th>
							<td>
								<span id="itemNum2"></span>
							</td>
						</tr>
						<tr>
							<th>품목명</th>
							<td><span id="updateName" class="update" ></span></td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="search" id="updateQty" class="update" /></td>
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
							<th>매입단가</th>
							<td><input type="search" id="itemPprice">&nbsp;&nbsp;~&nbsp;&nbsp;<input type="search" id="itemPpricePair" ></td>
							<th>공급단가</th>
							<td><input type="search" id="itemSprice">&nbsp;~&nbsp;<input type="search" id="itemSpricePair" ></td>
						</tr>
						<tr>
							<th width="50%">거래처</th>
							<td><input type="search" id="itemVendor">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							<th  width="50%">재고보유수량</th>
							<td><input type="search" id="itemQty">&nbsp;~&nbsp;<input type="search" id="itemQtyPair" ></td>
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
				
				<div class="right">
					<button type="button" class="a-button brown big" onclick="openBox('insertItemDiv')"><i class="fas fa-plus-circle"></i>&nbsp;재고 등록</button>
				</div>
				<br />
				
				<hr>
				<div class="right darkgreen-font"  id="countDiv"></div>
				<br />
				<div class="information">
					<button type="button" class="a-button gray medium" onclick="update(0)"><i class="fas fa-edit"></i>&nbsp;재고 수정</button>
					<button type="button" class="a-button red medium" onclick="remove()"><i class="fas fa-times"></i>&nbsp;품절 처리</button>
					<table class="table">
						<thead>
							<tr>
								<th width="5%"><input type="checkbox" class="allChk"></th>
								<th width="5%">번호</th>
								<th width="10%" >품목코드</th>
								<th width="15%" >폼목명(단위)</th>
								<th width="10%">거래처</th>
								<th width="8%">매입단가</th>
								<th width="8%">공급가</th>
								<th width="10%">총 재고 수량</th>
								<th width="14%">최소 유지 수량</th>
								<th width="15%">총 재고액</th>
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
	
	$("input[name='category1']").change(function() {
		var category=$(".category1:checked").val();
		$(".details").hide();
		$('.category2').removeAttr('checked');
		if(category == 'A') {
			$('#detailA').show();
			$("#repA").prop("checked", true);
		} else if(category == 'B') {
			$('#detailB').show();
			$("#repB").prop("checked", true);
		} else if(category == 'C') {
			$('#detailC').show();
			$("#repC").prop("checked", true);
		} else {
			$('#detailD').show();
			$("#repD").prop("checked", true);
		}
		
	});
	
	
	$("input[name='category2']").change(function() {
		var category1=$(".category1:checked").val();
		var category2=$(".category2:checked").val();
		var itemNum=category1+category2;

		$.ajax({
			type: "POST",
			url: "product",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"itemNum":itemNum,"itemUsage":1}),
			dataType: "json",
			success: function(json) {
				$("#CategoryListDiv").empty();
				if(json.length==0) {
					var html="<tr><td colspan='2'>해당품목이 존재하지 않습니다.</td></tr>";
					$("#CategoryListDiv").html(html);
					return;
				}
			
				var html="";
	       		$(json).each(function() {
	       			html="<tr><td>"+this.itemNum+"</td><td><a onclick=\"pressName('"+this.itemName+"');\">"+this.itemName+"</a></td></tr>";
				});    
	       		
				$("#CategoryListDiv").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
		
	});
	
	function pressName(name) {
		var name =name;
		$("#insertName").val(name);
	}
	
	

	function itemList() {
		// 검색유효성검사추가 : 가격과수량 큰거작은거/ 숫자만 문자만 등등
		var itemNum=$("#itemNum").val();
		var itemName=$("#itemName").val();
		var itemPprice=$("#itemPprice").val();
		var itemPpricePair=$("#itemPpricePair").val();
		if (itemPprice=='' && itemPpricePair!='') {
			itemPprice=itemPpricePair;
		} else if (itemPpricePair=='' && itemPprice!='') {
			itemPpricePair=itemPprice;
		} 
		var itemSprice=$("#itemSprice").val();
		var itemSpricePair=$("#itemSpricePair").val();
		if (itemSprice=='' && itemSpricePair!='') {
			itemSprice=itemSpricePair;
		} else if (itemSpricePair=='' && itemSprice!='') {
			itemSpricePair=itemSprice;
		} 
		var itemVendor=$("#itemVendor").val();
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
			data: JSON.stringify({"itemNum":itemNum,"itemName":itemName,"itemPprice":itemPprice,"itemPpricePair":itemPpricePair,"itemSprice":itemSprice,"itemSpricePair":itemSpricePair,"itemVendor":itemVendor,"itemQty":itemQty,"itemQtyPair":itemQtyPair,"categorys":categorys}),
			dataType: "json",
			success: function(json) {
				$("#resultItem").empty();
				$("#countDiv").html("총 검색결과 : "+json.length+"건");
				
				if(json.length==0) {
					var html="<tr><td colspan='10'>검색된 재고정보가 존재하지않습니다.</td><tr>";
					$("#resultItem").html(html);
					return;
				}
			
				var html="";
				var number=0;
	       		$(json).each(function() {
	       			var total=Number(this.itemQty*this.itemPprice);
	       			number++;
	       			html+="<tr><td><input type='checkbox' class='rowChk' value='"+this.itemNum+"'></td><td>"+number
		       			+"</td><td>"+this.itemNum+"</td>"
						+"<td>"+this.itemName.split("_")[0]+" ("+this.itemName.split("_")[1]+")</td>"
						+"<td>"+this.itemVendor+"</td>"
						+"<td>"+this.itemPprice+"</td>"
						+"<td>"+this.itemSprice+"</td>";
					if (this.itemQty==0) {
						html+="<td class='red-font'>"+"품절"+"</td>";
					} else {
						html+="<td>"+this.itemQty+"</td>";
					}
					html+="<td>"+this.minQty+"</td>" 
						+"<td>"+total+"</td>";
				});    
	       		
				$("#resultItem").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
		
	}	
	
	function update(itemNum) {
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
			type: "GET",
			url: "getItem/"+itemNum,
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
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
	
	function itemBtn(btn) {
		var btn=btn;
		var itemNum=$("#"+btn+"Num").val();
		var itemQty=$("#"+btn+"Qty").val();
		
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
			url: "productModify",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"itemNum":itemNum,"itemQty":itemQty}),
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
			data: JSON.stringify({"items":items}),
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