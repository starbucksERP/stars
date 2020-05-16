<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		                  <a href="${pageContext.request.contextPath}/delivery/deliveryList">배송조회</a>
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
							<td><input type="text" id="storeId" value="${loginHewon.hewonStId} " readonly="readonly"/>&nbsp;</td>
							<th>품목</th>
							<td><input type="text" id="itemNum">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th>진행상태</th>
							<td colspan="3">
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="10" >발주요청</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="20" >발주완료</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="50" >배송준비중</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="60" >배송중</label>
								<label class="gLabel"><input type="checkbox" name="states" class="fChk choice" value="70">입고완료</label>
							</td> 
						</tr>
					</thead>
				</table>
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
							<th>발주요청일</th>
							<th>발주번호</th>
							<th>지점명(코드)</th>
							<th>품목</th>
							<th>진행상태</th>
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
	
	orderReqList(0);
	
	function orderReqList(welcome) {
		var storeId=$("#storeId").val();
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
		
		if(states.length==0){
			states.push(10);
			states.push(20);
			states.push(40);
			states.push(50);
			states.push(60);
			states.push(70);
		}
		
		
		$.ajax({
			type: "POST",
			url: "storeOrderStateList",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"requestDate":requestDate,"requestDatePair":requestDatePair,"requestNum":requestNum,"itemNum":itemNum,"storeId":storeId,"states":states}),
			dataType: "json",
			success: function(json) {
				$("#resultOrder").empty();
				//$("#periodDiv").html("[ "+requestDate+" ~ "+requestDatePair+" ]"); // 맨처음, 날짜없는 경우 null
				$("#countDiv").html("총 검색결과 : "+json.length+"건");
				if(json.length==0) {
					var html="<tr><td colspan='5'>검색된 발주현황정보가 존재하지않습니다.</td><tr>";
					$("#resultOrder").html(html);
					return;
				}
				var html="";
	       		$(json).each(function() {
	       				       			
	       			html+="<tr>";
	        		html+="<td>"+this.requestDate+"</td>"
					+"<td>"+this.requestNum+"</td>"
					+"<td>"+this.storeId+"</td>"
					+"<td>"+this.itemNum+"</td>"
					if(this.requestState==10) {
						html+="<td class='green-font'>발주신청</td></tr>";
					} else if(this.requestState<=20) {
						html+="<td class='darkgreen-font'>발주확인</td></tr>";
					}  else if(this.requestState<60) {
						html+="<td class='red-font'>배송준비중</td></tr>";
					}  else if(this.requestState==60) {
						html+="<td class='darkgreen-font'>배송중</td></tr>";
					} else if(this.requestState==70 ) {
						html+="<td class='blue-font'>입고완료</td></tr>";
					} else if(this.requestState==99 ) {
						html+="<td class='red-font'>발주취소</td></tr>";
					} 
				});    
				$("#resultOrder").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}

</script>