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
	/* margin-left: -120px; */
	padding: 5px;
	z-index: 100;
	display: none;
}
.innerMessage {
	width:80%;
	margin:0 auto;
	padding-top: 35px;
	text-align: center;
	z-index: 101;
	color: #4C4C4C;
	font-size: 15px;
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
</style>

<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
		               <button class="dropdown-btn">발주관리<i class="fa fa-caret-down"></i></button>
		               <div class="dropdown-container">
		                  <a href="${pageContext.request.contextPath}/sic/storeOrderRequestList">발주요청조회</a><br /><br />
		                  <a href="${pageContext.request.contextPath}/sic/storeOrderStateList">발주현황조회</a><br /><br />
		                  <a href="${pageContext.request.contextPath}/sic/storeOrderInput">발주입력</a>
		               </div>
		            </li>
		            <li>
		               <button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
		               <div class="dropdown-container">
		                  <a href="${pageContext.request.contextPath}/sic/storeReceipt">입출하조회</a>
		                  <a href="${pageContext.request.contextPath}/delivery/deliveryList">배송조회</a>
		               </div>
	          	 	 </li>
				</ul>
			</div>

		<div class="main">
		
			<h3>발주요청조회</h3>
			<div class="right"><button type="button" class="a-button big" onclick="orderReqList(1)">검색</button></div>
			<hr />
			<div class="information" id="searchBoxDiv">
				<table class="table" >
					<thead>
						<tr>
							<th width="10%">발주요청일</th>
							<td width="40%"><label class="gLabel"><input type="date" id="requestDate" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" id="requestDatePair" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th width="10%">발주요청번호</th>
							<td width="40%"><input type="search" id="requestNum"/></td>
						</tr>
						<tr>
							<th>지점명 / 지점코드</th>
							<td><input type="text" id="storeId" value="1021"/></td>
							<th>품목</th>
							<td><input type="text" id="itemNum">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th>진행상태</th>
							<td colspan="3">
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="10" >발주요청</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="20">발주완료</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="70">입고완료</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="99">발주취소</label>
							</td> 
						</tr>
					</thead>
				</table>
			</div>
			<div id="popup_mask"></div>
				<div id="popupBox">
					<div class="innerMessage"></div>
					<div><button type='button' class='a-button green inner-button' onclick="closeBox()">확인</button></div>
				</div>
			
			
			<br />
			<hr  style="margin-top: 14px;"/>
			<br />
			
			<div class="date-output right"  id="periodDiv"></div>
			<div class="right"  id="countDiv"></div>
			<br />
			
			<div>
				<button type="button" class="a-button green padding-button" onclick="orderReqConfirm(0)">발주확인</button>
			</div>
			
			<div class="information" >
				<table class="table">
					<thead style="line-height: 20px;">
						<tr>
							<th width="5%"><input type="checkbox" class="allChk"></th>
							<th width="10%">발주요청일</th>
							<th width="10%">발주번호</th>
							<th width="10%">지점명(코드)</th>
							<th width="10%">품목</th>
							<th width="10%">수량</th>
							<th width="10%">총 금액</th>
							<th width="25%">옵션</th>
						</tr>
					</thead>
					<tbody id="resultOrder"></tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var today=new Date();
	var period=new Date();
	period.setDate(today.getDate()-14);
	
	var storeId=$("#storeId").val();
	
	orderReqList(0);
	
	// 발주요청목록 출력 함수 : sort기능추가
	function orderReqList(welcome) {
		if (welcome==0) {
			var requestDate=period;
			var requestDatePair=today;
			
		} else {
			var requestDate=$("#requestDate").val();
			var requestDatePair=$("#requestDatePair").val();
			if (requestDate=="" && requestDatePair!="") {
				requestDate=requestDatePair;
			} else if (requestDatePair=="" && requestDate!="") {
				requestDatePair=requestDate;
			} 
		}
		
		var requestNum=$("#requestNum").val();
		var itemNum=$("#itemNum").val();
		
		var states=[];
		$(".choice:checked").each(function(i) {
			states.push($(this).val());
		});
		 // json편집으로 추후수정
		if(states.length==0){
			states.push(10);
			states.push(20);
			states.push(70);
			states.push(99);
		}
		
		$.ajax({
			type: "POST",
			url: "storeOrderRequestList",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"requestDate":requestDate,"requestDatePair":requestDatePair,"requestNum":requestNum,"itemNum":itemNum,"storeId":storeId,"states":states}),
			dataType: "json",
			success: function(json) {
				$("#resultOrder").empty();
				//$("#periodDiv").html("[ "+requestDate+" ~ "+requestDatePair+" ]"); // 맨처음, 날짜없는 경우 null
				$("#countDiv").html("총 검색결과 : "+json.length+"건");
				
				if(json.length==0) {
					var html="<tr><td colspan='8'>검색된 발주요청정보가 존재하지않습니다.</td><tr>";
					$("#resultOrder").html(html);
					return;
				}
				
				var html="";
	       		$(json).each(function() {
	       			var total=Number(this.orderQty)*Number(this.itemPprice);
	       			
	       			html+="<tr><td><input type='checkbox' class='rowChk' value='"+this.requestNum+"'></td>";
	       			
	        		html+="<td>"+this.requestDate+"</td>"
					+"<td>"+this.requestNum+"</td>"
					+"<td>"+this.storeId+"</td>"
					+"<td>"+this.itemNum+"</td>"
					+"<td>"+this.orderQty+"</td>"
					+"<td>"+total+"</td>";
					if(this.requestState==10) {
						html+="<td class='green-font'><button type='button' class='a-button blackgray inner-button' onclick='orderReqConfirm("+this.requestNum+")'>취소요청</button></td></tr>";
					} else if(this.requestState==70){
						html+="<td class='blue-font'>입고완료</td></tr>";
					} else if(this.requestState>10 && this.requestState<99) {
						html+="<td class='green-font'>발주완료</td></tr>";
					} else if(this.requestState==99) {
						html+="<td class='red-font'>취소완료</td></tr>";
					} 
					
				});    
	       		
	       		
				$("#resultOrder").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
	
	
	
	function orderReqConfirm(reqNum) {
		var reqNums=[];
		
		if (reqNum!=0) {
			// 취소
			reqNums.push(reqNum);
			
			$.ajax({
				type: "PUT",
				url: "storeOrderModify",
				headers: {"content-type":"application/json","X-HTTP-Method-override":"PUT"},
				data: JSON.stringify({"requestState":99, "reqNums":reqNums,"storeId":storeId}),
				dataType: "text", 
				success: function(text) {
					if(text=="success") {
						$(".rowChk").prop("checked", false); // 체크박스초기화
						//$(".innerMessage").html("선택된 발주가 완료되었습니다.<br><br><br>");
						//$("#popupBox").show(300); 
						openModal("선택된 발주가 취소처리되었습니다.<br><br><br>");
						orderReqList(1);
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
			
			return;
			
		} else {
			if($('.rowChk:checked').length==0) {
				openModal("선택된 발주가 존재하지않습니다.<br>입고처리할 발주를 선택해주세요.<br><br>");
				//$(".innerMessage").html("선택된 발주가 존재하지않습니다.<br>발주요청을 처리할 발주를 선택해주세요.<br><br>");
				$("#popupBox").show(300);  
				return;
			} else {
				$(".message").empty();
				$(".rowChk:checked").each(function(i) {
					alert($(this).val());
					reqNums.push($(this).val());
				});
			}
		}
		
		
		$.ajax({
			type: "PUT",
			url: "storeOrderModify",
			headers: {"content-type":"application/json","X-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"requestState":70, "reqNums":reqNums,"storeId":storeId}),
			dataType: "text", 
			success: function(text) {
				if(text=="success") {
					$(".rowChk").prop("checked", false); // 체크박스초기화
					//$(".innerMessage").html("선택된 발주가 완료되었습니다.<br><br><br>");
					//$("#popupBox").show(300); 
					openModal("선택된 발주가 입고처리되었습니다.<br><br><br>");
					orderReqList(1);
				}
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	
		 
	}

	
	

	function openModal(message) {
		var message=message;
		$("#popupBox").css({
			"top": (($(window).height()-$("#popupBox").outerHeight())/2+$(window).scrollTop())+"px",
			"left": (($(window).width()-$("#popupBox").outerWidth())/2+$(window).scrollLeft())+"px"
		});
		
		//$("#popup_mask").css("display","block"); //팝업 뒷배경 display block
       // $("#popupBox").css("display","block"); //팝업창 display block
        $(".innerMessage").html(message);
		$("#popup_mask").show();
		$("#popupBox").show(300);  
		$("body").css("overflow","hidden");//body 스크롤바 없애기
		
	}
	
	
	function closeBox() {
		$(".innerMessage").val("");    
		$("#popupBox").hide();
		$("#popup_mask").hide(300); 
		//$("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
        //$("#popupDiv").css("display","none"); //팝업창 display none
        $("body").css("overflow","auto");//body 스크롤바 생성
	}
	
</script>