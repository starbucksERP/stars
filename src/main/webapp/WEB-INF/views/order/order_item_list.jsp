<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#messageBox {
	width: 400px;
	height: 160px;
	border: 3px solid #4C4C4C;
	background-color: white;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -40px;
	margin-left: -120px;
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
</style>

<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/order/orderReq">발주요청조회</a><br /><br />
							<a href="${pageContext.request.contextPath}/order/orderList">발주현황조회</a>
						</div>
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
		
			<h3>발주현황조회</h3>
			<div class="right"><button type="button" class="a-button big" onclick="orderReqList(1)">검색</button></div>
			<hr />
			<div class="information" id="searchBoxDiv">
				<table class="table">
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
								<td><input type="search" id="storeId"/>&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								<th>품목</th>
								<td><input type="text" id="itemNum">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							</tr>
							<tr>
								<th>진행상태</th>
								<td>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="40" >배송요청</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="30">대기(입고중)</label> <!-- 31,32,33도포함  -->
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="50" >배송준비중</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="60">출고</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="70">종결</label>
								</td> 
								<th>발주주체</th>
								<td>
									<label class="gLabel"><input type="radio" name="orderType" class="fChk owner" checked="checked" value="0">전체</label>&nbsp;&nbsp;&nbsp;|
									<label class="gLabel"><input type="radio" name="orderType" class="fChk owner" value="1">지점</label>
									<label class="gLabel"><input type="radio" name="orderType" class="fChk owner" value="2">본사</label>
								</td>
							</tr>
						</thead>
				</table>
			</div>
			
			<div id="messageBox">
				<div class="innerMessage"></div>
				<div><button type='button' class='a-button green inner-button' onclick="closeBox()">확인</button></div>
			</div>
			
		   	<div class="right" style="float: right;">
	            <ul class="order-sta">
	               <li class="blackgray">전체</li>
	               <li >진행중</li> <!-- 20<= x <70 -->
	               <li >미입고</li> <!-- 30<= x <=33 -->
	               <li >종결</li>   <!-- 70 -->
	            </ul>
        	 </div>
			
			<br />
			<hr  style="margin-top: 14px;"/>
			<br />
			
			<div class="date-output right"  id="periodDiv"></div>
			<div class="right"  id="countDiv"></div>
			<br />
			
			<div class="information">
				<table class="table">
						<thead style="line-height: 20px;">
							<tr>
								<th>발주타입</th>
								<th>발주요청일</th>
								<th>발주번호</th>
								<th>지점명(코드)</th>
								<th>품목</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody id="resultOrder"></tbody>
					</table>
				
						<!-- <tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라<br>리저브 노브리틱스와 과테말라<br>리저브 노브리틱스와 과테말라</td>
							<td class="green-font">&nbsp;발주확인</td>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="red-font">취소완료</td>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="gray-font">대기-미입고</td>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="green-font">종결</td>
						</tr>
						<tr>
							<td>A</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td>출고</td>
						</tr> -->
						
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var today=new Date();
	var period=new Date();
	period.setDate(today.getDate()-14);
	
	orderReqList(0);
	
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
		var storeId=$("#storeId").val();
		
		var states=[];
		$(".choice:checked").each(function(i) {
			states.push($(this).val());
		});
		// 
		if(states.length==0){
			states.push(20);
			states.push(30);
			states.push(31);
			states.push(32);
			states.push(33);
			states.push(40);
			states.push(50);
			states.push(60);
			states.push(70);
		}
		
		var orderType=$(".owner:checked").val(); 
		
		$.ajax({
			type: "POST",
			url: "orderStateList",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"requestDate":requestDate,"requestDatePair":requestDatePair,"requestNum":requestNum,"itemNum":itemNum,"storeId":storeId,"states":states,"orderType":orderType}),
			dataType: "json",
			success: function(json) {
				$("#resultOrder").empty();
				//$("#periodDiv").html("[ "+requestDate+" ~ "+requestDatePair+" ]"); // 맨처음, 날짜없는 경우 null
				$("#countDiv").html("총 검색결과 : "+json.length+"건");
				if(json.length==0) {
					var html="<tr><td colspan='6'>검색된 발주현황정보가 존재하지않습니다.</td><tr>";
					$("#resultOrder").html(html);
					return;
				}
				var html="";
	       		$(json).each(function() {
	       				       			
	       			html+="<tr>";
	       			if (this.orderType == 1) {
	       				html+="<td>대리점</td>";
	       			} else if (orderType == 2) {
	       				html+="<td>본사</td>";
	       			} else if (orderType == 0) { // DB정리후 삭제
	       				html+="<td>&nbsp;</td>";
	       			}
	        		html+="<td>"+this.requestDate+"</td>"
					+"<td>"+this.requestNum+"</td>"
					+"<td>"+this.storeId+"</td>"
					+"<td>"+this.itemNum+"</td>"
					if(this.requestState==20) {
						html+="<td class='green-font'>발주완료</td></tr>";
					} else if(this.requestState==30) {
						html+="<td class='green-font'>구매요청</td></tr>";
					} else if(this.requestState>30 && this.requestState<33) {
						html+="<td class='green-font'>대기(입고진행중)</td></tr>";
					} else if(this.requestState==40) {
						html+="<td class='green-font'>배송요청</td></tr>";
					} else if(this.requestState==50) {
						html+="<td class='green-font'>배송준비중</td></tr>";
					}  else if(this.requestState==60) {
						html+="<td class='green-font'>출고</td></tr>";
					} else if(this.requestState==70 || this.requestState==33) {
						html+="<td class='red-font'>종결</td></tr>";
					} 
				});    
				$("#resultOrder").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}

	function closeBox() {
		$(".innerMessage").val("");    
		$("#messageBox").hide(300); 
	}
	
</script>