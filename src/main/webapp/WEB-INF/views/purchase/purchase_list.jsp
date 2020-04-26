<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">


#purchaseTable {
   margin-left: -1px;
   border-collapse: collapse !important;
   font-size: 13px;
   width: 100%;
   max-width: 100%;
   margin: 50px 0;
   border: 1px solid #ddd;
   line-height: 1.5;
   border-spacing: 0;
}

#purchaseTable thead>tr>th, #purchaseTable tbody>tr>th, #purchaseTable tfoot>tr>th, #purchaseTable>thead>tr>td,
   #purchaseTable tbody>tr>td, #purchaseTable tfoot>tr>td {
   padding: 9px;
   line-height: 1.4;
   border-top: 1px solid #ddd;
   border-bottom-width: 2px;
   vertical-align: middle !important;   
}

#purchaseTable thead>tr>th {
	width: 9%;
}

#purchaseTable thead>tr>td {
	padding-left: 20px;
}

#purchaseTable tbody+tbody {
   border-top: 2px solid #ddd;
}

#purchaseTable th {
     background: #D4C9C2;
      text-align: center;
}

#purchaseTable>thead>tr>td {
   text-align: left;
}

#purchaseTable>tbody>tr>td{
	padding: 8px 20px;
	text-align: center;
}

</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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

			<div class="main">
			
				<h3>구매현황조회</h3>
				<div class="right">
				<button type="button" class="a-button medium" onclick="location.href='${pageContext.request.contextPath}/purchase/purchaseList'" ><i class="fas fa-search"></i>&nbsp;검색 초기화</button>
				<button type="button" class="a-button medium" onclick="searchPurchaseList(1)" >구매예약현황</button>
				<button type="button" class="a-button medium" id="searchPurchaseListBtn" onclick="searchPurchaseList(2)"><i class="fas fa-search"></i>&nbsp;검색</button>
				</div>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th>구매일</th>
							<td><label class="gLabel"><input type="search" id="purchaseDate" placeholder="yy/mm/dd"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;~&nbsp;<label class="gLabel"><input type="search" id="purchaseDateTwo" placeholder="yy/mm/dd"/>&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th>요청번호</th>
							<td><input type="search" id="requestNum" placeholder="ex)1234567" /></td>
						</tr>
						<tr>
							<th>거래처명</th>
							<td><input type="search" id="itemVendor" placeholder="ex)재료나라"/>&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							<th>구매타입</th>
							<td>
								<label class="gLabel"><input type="radio" name="pType" class="pType" value="0" checked="checked" >전체</label>
								<label class="gLabel"><input type="radio" name="pType" class="pType" value="1" >대리점</label> 
								<label class="gLabel"><input type="radio" name="pType" class="pType" value="2" >본사 자동</label> 
								<label class="gLabel"><input type="radio" name="pType" class="pType" value="3" >본사 수동</label>
							</td>
						</tr>
						<tr>
							<th>물품번호</th>
							<td><input type="search" id="itemNum" placeholder="ex) A01-01">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							<th>가격범위</th>
							<td><input type="number" id="itemPprice" class="number" value="0"/>&nbsp;~&nbsp;
							<input type="number" id="itemPpriceTwo" class="number" value="0"/></td>
						</tr>
					</thead>
				</table>
				
				<div class="right" style="float: right;">
		            <ul class="order-sta">
		               <li id="purchaseTapAll" onclick="searchPurchaseList(0)" >전체</li>
		               <li id="purchaseTapReq"  onclick="searchPurchaseList(3)">구매요청</li>
		               <li id="purchaseTapProcess" onclick="searchPurchaseList(4)">구매진행</li>
		               <li id="purchaseTapComplete" onclick="searchPurchaseList(5)">구매종결</li>
		            </ul>
	        	 </div> 
				<br />
				<hr  style="margin-top: 14px;">  
				<br>
				 <br>
				<div>
					<button type="button" class="a-button green padding-button" id="pReqConfirmBtn" >구매확인</button>&nbsp;
					<button type="button" class="a-button green padding-button" id="pCompleteBtn" >구매종결</button>
				<div class="right"  id="countDiv"></div>
				</div>
				<div class="information">
					<table id="purchaseTable">
					<thead>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>요청번호</th>
							<th>구매방식</th>
							<th>구매일자</th>
							<th>거래처</th>
							<th>물품코드</th>
							<th>물품명</th>
							<th>구매수량</th>
							<th>총 금액</th>
							<th>진행상태</th>
							<th>취소여부</th>
						</tr>
					</thead>
					<tbody id="purTbody"></tbody>
				</table>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
// number 가격 범위에 숫자만 입력 및 콤마 입력

//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}

$(".number").on("focus", function() {
    var x = $(this).val();
    x = removeCommas(x);
    $(this).val(x);
}).on("focusout", function() {
    var x = $(this).val();
    if(x && x.length > 0) {
        if(!$.isNumeric(x)) {
            x = x.replace(/[^0-9]/g,"");
        }
        x = addCommas(x);
        $(this).val(x);
    }
}).on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});



// ================================================================== 여기부터


$(function(){

    $("#purchaseDate").datepicker();
    $("#purchaseDateTwo").datepicker();
    
	$.datepicker.setDefaults({
	    dateFormat: 'y/mm/dd' 
	});


});


searchPurchaseList(0);

function searchPurchaseList(searchType) {
	
	var requestNum=$("#requestNum").val();
	var purchaseType=$("#purchaseType").val();
	var purchaseDate=$("#purchaseDate").val();
	var purchaseDateTwo=$("#purchaseDateTwo").val();
	var itemVendor=$("#itemVendor").val();
	var itemNum=$("#itemNum").val();
	var itemName=$("#itemName").val();
	var itemQty=$("#itemQty").val();
	var itemPprice=$("#itemPprice").val();
	var itemPpriceTwo=$("#itemPpriceTwo").val();
	var purchaseType=$(".pType:checked").val();
	var purchaseState = 0;
	
	if(searchType == 0) { // 오늘까지의 기록만 검색 (기본테이블 출력용) / 0번
		var nowPurchaseState = 0;

	} else if(searchType == 1) { // 예약 기록만 검색 / 1번
		var nowPurchaseState = 1;
	
	} else if(searchType == 3) { // 구매요청 탭 
		purchaseState = 30;
		
	}else if(searchType == 4) { // 구매진행 탭 
		purchaseState = 31;
		
	} else if(searchType == 5) { //구매종결 탭 (상태 32와 33을 둘다 검색하기 위함)
		var nowPurchaseState = 3;
		
	}
		
	
	$.ajax({
		type: "POST",
		url: "purchaseList",
		headers: {"content-type":"application/json"},
		data: JSON.stringify(
				{  "requestNum":requestNum,"purchaseType":purchaseType,"purchaseDate":purchaseDate, "purchaseDateTwo":purchaseDateTwo, 
					"itemVendor":itemVendor,"itemNum":itemNum,"itemName":itemName,"itemQty":itemQty, "itemPprice":itemPprice,
					"itemPpriceTwo":itemPpriceTwo, "purchaseType":purchaseType,"purchaseState":purchaseState, "nowPurchaseState":nowPurchaseState
					}),
		dataType: "json",
		success: function(json) {
			
			$("#countDiv").html("총 검색결과 : "+json.length+"건");
			
			if(json.length==0) {
				var html="<tr><td colspan='11'>검색된 구매기록이 없습니다.</td><tr>";
				$("#purTbody").html(html);
				return;
			}
			
			var html="";
       		$(json).each(function(i) {
       			var totalPrice=Number(this.itemQty)*Number(this.itemPprice);
       			
       			html+="<tr>";
       			html+="<td><input type='checkbox' class='rowChk'></td>";
       			html+="<td hidden='true'>"+this.purchaseSeq+"</td>";
       			html+="<td>"+this.requestNum+"</td>";
       			
       			if (this.purchaseType == 1) {
       				html+="<td class='blue-font'>대리점</td>";
       			} else if (this.purchaseType == 2) {
       				html+="<td style='color:green'>본사 자동</td>";
       			} else if (this.purchaseType == 3) { 
       				html+="<td class='red-font' >본사 수동</td>";
       			}
       			
        		html+="<td>"+this.purchaseDate+"</td>"
				+"<td>"+this.itemVendor+"</td>"
				+"<td>"+this.itemNum+"</td>"
				+"<td>"+this.item.itemName+"</td>"
				+"<td>"+this.itemQty+"</td>"
				+"<td>"+totalPrice+"</td>";
				
				if(this.purchaseState==30) {
					html+="<td style='color:green'>구매 요청</td>";
				} else if(this.purchaseState==31) {
					html+="<td class='blue-font'>구매중</td>";
				} else if(this.purchaseState==32) {
					html+="<td class='red-font'>구매 완료</td>";
				} else if(this.purchaseState==33) {
					html+="<td class='red-font'>본사 입고완료</td>";
				} else if(this.purchaseState==99) {
					html+="<td>구매 취소</td>";
				} 
				if(this.purchaseType==2 && this.purchaseState==30){
					html+="<td><button type='button' class='a-button red inner-button' onclick='purCancel("+this.purchaseSeq+")' >취소</button></td>";
				}else if(this.purchaseType==3 && this.purchaseState==30){
					html+="<td><button type='button' class='a-button red inner-button' onclick='purCancel("+this.purchaseSeq+")' >취소</button></td>";
				}else if(this.purchaseState==99) {
					html+="<td>취소 완료</td>";
				}else {
					html+="<td>취소 불가</td>";
				}
				
				html+="</tr>";
				
			});    
       			$("#purTbody").html(html);
       			
       		
		},
		error: function(xhr) {
			alert("에러코드 = "+xhr.status)
		}
	});
};

// ======================================== 구매요청확인 승인 버튼 
	$("#pReqConfirmBtn").click(function () {
		if($(".rowChk:checked").length==0) {
			alert("선택된 기록이 없습니다.");
			return;
		} else {
			var purchase =[];
			var rowChk = $(".rowChk:checked");
			
			rowChk.each(function(i) {
				var tr = rowChk.parent().parent().eq(i);
				var td = tr.children();
				
				var requestNum = td.eq(2).text(); 
				var purchaseSeq = td.eq(1).text(); 
				var purchaseState = td.eq(10).text();
				
				if(purchaseState=="구매 요청") {
					purchaseState = 30;
				} else if (purchaseState=="구매중") {
					purchaseState = 31;
				} else if (purchaseState=="구매 완료") {
					purchaseState = 32;
				} else if (purchaseState=="본사 입고완료") {
					purchaseState = 33;
				} else if (purchaseState=="구매 취소") {
					purchaseState = 99;
				}
			
				if(purchaseState != 30) {
					alert("요청번호 ["+requestNum+"] : 구매요청 승인 오류 ");
					return;
					
				} else {
						purchase.push(purchaseSeq);
					} 
				
			});
			
			if(purchase.legnth!=0) {
				var param={"list":purchase};
				
				$.ajax({
					type: "POST",
					url: "purchaseReqConfirm",
					data: param,
					dataType: "text", 
					success: function(text) {
						if(text=="success") {
							alert("구매요청이 승인 되었습니다.");
							searchPurchaseList(4);
						}
					},
					error: function(xhr) {
						alert("에러코드 = "+xhr.status)
					}
					
				});
			}
		}
	});
	

	// ======================================== 구매완료 승인 버튼 
 	$("#pCompleteBtn").click(function () {
		if($(".rowChk:checked").length==0) {
			alert("선택된 기록이 없습니다.");
			return;
		} else {
			var purchase =[];
			var purchaseHQ =[];
			var rowChk = $(".rowChk:checked");
			
			rowChk.each(function(i) {
				var tr = rowChk.parent().parent().eq(i);
				var td = tr.children();
				
				var requestNum = td.eq(2).text(); 
				var purchaseSeq = td.eq(1).text(); 
				var purchaseState = td.eq(10).text();
				var purchaseType = td.eq(3).text();
				
				if(purchaseState=="구매 요청") {
					purchaseState = 30;
				} else if (purchaseState=="구매중") {
					purchaseState = 31;
				} else if (purchaseState=="구매 완료") {
					purchaseState = 32;
				} else if (purchaseState=="본사 입고완료") {
					purchaseState = 33;
				} else if (purchaseState=="구매 취소") {
					purchaseState = 99;
				}
			
				if(purchaseState != 31) {
					alert("요청번호 ["+requestNum+"] : 구매완료 승인 오류 ");
					return;
					
				} else if(purchaseState==31 && purchaseType!='본사 수동' && purchaseType!='본사 자동') {
					alert(purchaseType);
					var answer = confirm("요청번호 ["+requestNum+"] : 구매를 완료 하시겠습니까?");
					if(answer) {
						purchase.push(purchaseSeq);
						}
					
				} else if(purchaseState==31 && purchaseType=='본사 수동' || purchaseType=='본사 자동') {
						purchaseHQ.push(purchaseSeq);
				}
				
				
			});
			
			if(purchase.legnth!=0) {
				var param={"list":purchase};
				
				$.ajax({
					type: "POST",
					url: "purchaseComplete",
					data: param,
					dataType: "text", 
					success: function(text) {
						if(text=="success") {
							alert("구매완료가 승인 되었습니다.");
							searchPurchaseList(5);
						}
					},
					error: function(xhr) {
						alert("에러코드 = "+xhr.status);
					}
					
				});
			} if(purchaseHQ.length!=0) {
				var param={"list":purchaseHQ};
				
				$.ajax({
					type: "POST",
					url: "purchaseCompleteHQ",
					data: param,
					dataType: "text", 
					success: function(text) {
						if(text=="success") {
							alert("구매완료가 승인 되었습니다.");
							searchPurchaseList(5);
						}
					},
					error: function(xhr) {
						alert("에러코드 = "+xhr.status);
					}
					
				});
			}
		}
	}); 
	
	//======================================== 주문 취소 버튼 
	
	function purCancel(purchaseSeq) {
		
		var purchase =[];
		var answer = confirm("해당 구매를 취소 하시겠습니까?");
		
		if(answer) {
			purchase.push(purchaseSeq);
		} else {
			return;
		} 
		
		if(purchase.legnth!=0) {
			var param={"list":purchase};
			
			$.ajax({
				type: "POST",
				url: "purchaseCancel",
				data: param,
				dataType: "text", 
				success: function(text) {
					if(text=="success") {
						searchPurchaseList(0);
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
				
			});
		}	
	};


		
</script>

