<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
				<h3>입출하기록</h3>
				<div class="right"><button type="button" class="a-button big" onclick="historyList(1)">검색</button></div>
				<hr />
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<th width="10%">날짜</th>
								<td width="40%"><label class="gLabel"><input type="date" id="historyDate" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								&nbsp;-&nbsp;<label class="gLabel"><input type="date" id="historyDatePair" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
								<th width="10%">발주/구매 요청번호</th>
								<td width="40%"><input type="search" id="requestNum" placeholder="ex)15849846517-20"/></td>
							</tr>
							<tr>
								<th>품목코드</th>
								<td><input type="text" id="itemNum" placeholder="ex)A01-1"></td>
								<th>담당자</th>
								<td><input type="search" id="historyOwner" placeholder="ex)홍길동"/></td>
							</tr>
							<tr>
								<th>발주/구매 상태</th>
								<td>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="20" >발주완료</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="31">입고요청</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="32">입고</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="40">출고요청</label>
									<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="60">출고</label>
								</td> 
								<th>발주/구매 타입</th>
								<td>
									<label class="gLabel"><input type="radio" name="purchaseType" class="fChk pType" checked="checked" value="0">전체</label>&nbsp;&nbsp;&nbsp;|
									<label class="gLabel"><input type="radio" name="purchaseType" class="fChk pType" value="1">지점</label>
									<label class="gLabel"><input type="radio" name="purchaseType" class="fChk pType" value="2">본사(자동)</label>
									<label class="gLabel"><input type="radio" name="purchaseType" class="fChk pType" value="3">본사(수동)</label>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			<hr  style="margin-top: 14px;"/>
			<br />
			
			<div class="date-output right"  id="periodDiv"></div> <br/>
			<div class="right darkgreen-font"  id="countDiv"></div>
			<br />
			
			<div class="information">
				<table class="table">
					<thead style="line-height: 20px;">
						<tr>
							<th style="width: 10%;">번호</th>
							<th style="width: 15%;">날짜</th>
							<th style="width: 15%;">발주/구매 요청번호</th>
							<th style="width: 10%;">품목</th>
							<th style="width: 10%;">수량</th>
							<th style="width: 15%;">주체</th>
							<th style="width: 10%;">담당자</th>
							<th style="width: 15%;">상태</th>
						</tr>
					</thead>
					<tbody id="resultHistory"></tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	var today=new Date();
	var period=new Date();
	period.setDate(today.getDate()-30);
	
	var dd = today.getDate();
	var mm = today.getMonth()+1; 
	var yyyy = today.getFullYear();
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	today = yyyy+'-'+mm+'-'+dd;
	
	dd = period.getDate();
	mm = period.getMonth()+1; 
	yyyy = period.getFullYear();
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	period = yyyy+'-'+mm+'-'+dd;

	historyList(0);
	
	function historyList(welcome) {
		if (welcome==0) {
			var historyDate=period;
			var historyDatePair=today;
		} else {
			var historyDate=$("#historyDate").val();
			var historyDatePair=$("#historyDatePair").val();
			if (historyDate=="" && historyDatePair!="") {
				historyDate=historyDatePair;
			} else if (historyDatePair=="" && historyDate!="") {
				historyDatePair=historyDate;
			} 
		}
		
		var requestNum=$("#requestNum").val();
		var itemNum=$("#itemNum").val();
		var historyOwner=$("#historyOwner").val();
		
		var states=[];
		$(".choice:checked").each(function(i) {
			var state=$(this).val();
			if (state==32) {	
				states.push(33);
			}
			states.push(state);
		});
		 // json편집으로 추후수정
		if(states.length==0){
			states.push(20);
			states.push(31);
			states.push(32);
			states.push(33);
			states.push(40);
			states.push(60);
		}
		
		var purchaseType=$(".pType:checked").val(); 
		
		$.ajax({
			type: "POST",
			url: "history",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"historyDate":historyDate,"historyDatePair":historyDatePair,"requestNum":requestNum,"itemNum":itemNum,"historyOwner":historyOwner,"states":states,"purchaseType":purchaseType}),
			dataType: "json",
			success: function(json) {
				$("#resultHistory").empty();
				if(historyDate=='' || historyDate==null) {
					$("#periodDiv").html("[ 전체기간 ]");
				} else { 
					$("#periodDiv").html("[ "+historyDate+" ~ "+historyDatePair+" ]"); 
				}
				$("#countDiv").html("총 검색결과 : "+json.length+"건   ");
				
				if(json.length==0) {
					var html="<tr><td colspan='8' style='font-weight: bold;' class='red-font'>검색된 입출하정보가 존재하지않습니다.</td><tr>";
					$("#resultHistory").html(html);
					return;
				}
			
				var html="";
				var number=0;
	       		$(json).each(function() {
	       			number++;
	       			
	       			if (this.itemState == 20) {
		       			html+="<tr style='background: #c2deb8;'>";
	       			} else if (this.itemState == 31 || this.itemState == 32 || this.itemState == 33) { 
		       			html+="<tr class='blue'>";
	       			} else if (this.itemState == 40 || this.itemState == 60) { 
		       			html+="<tr class='pink'>";
	       			} 
	       			
	       			html+="<td>"+number+"</td>"
	       				+"<td>"+this.historyDate+"</td>"
	       				+"<td>"+this.requestNum+"</td>"
	       				+"<td>"+this.itemNum+"</td>"
	       				+"<td>"+this.itemQty+"</td><td>";
	       				
	       			if (this.purchaseType == 1) {
	       				html+="대리점";
	       			} else if (this.purchaseType == 2) {
	       				html+="본사(자동)";
	       			} else if (this.purchaseType == 3) { 
	       				html+="본사(수동)";
	       			}
	        		html+="</td><td>"+this.historyOwner+"</td>";
	        		if (this.itemState == 20) {
	       				html+="<td class='green-font'>발주완료</td></tr>";
	       			} else if (this.itemState == 31) {
	       				html+="<td class='blue-font'>입고요청</td></tr>";
	       			} else if (this.itemState == 32 || this.itemState == 33) { 
	       				html+="<td class='blue-font'>입고</td></tr>";
	       			} else if (this.itemState == 40) { 
	       				html+="<td class='red-font'>출고요청</td></tr>";
	       			} else if (this.itemState == 60) { 
	       				html+="<td class='red-font'>출고</td></tr>";
	       			} 
					
				});    
	       		
				$("#resultHistory").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}

</script>

