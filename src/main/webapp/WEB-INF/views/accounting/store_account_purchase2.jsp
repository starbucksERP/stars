<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">본사<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/account/accountPurchase">매입현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/account/accountSales">매출현황</a>
						<a href="${pageContext.request.contextPath}/account/accountIncome">손익분석</a>
						<a href="${pageContext.request.contextPath}/account/purchaseMonth">매입 월별현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/account/salesMonth">매출 월별현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/account/incomeMonth">손익분석</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">지점<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/account/st_accountPurchase">매입 현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/account/st_accountSales">매출 현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/account/st_accountIncome">손익분석</a>
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>매입 현황 - 지점</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>기준일자</th>
						<td>
							<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
						</td>
					</tr>
					<tr>
						<th>품목명</th>
						<td><input type="search" /></td>
					</tr>
					<tr>
						<th>거래처</th>
						<td><input type="text" readonly="readonly" disabled="disabled" value="본 사" style="text-align: center;"/></td>
					</tr>
				</thead>
			</table>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody >
						<tr>
							<th>일자</th>
							<th>거래처명</th>
							<th>품목코드</th>
							<th>품목명</th>
							<th>매입금액</th>
							<th>부가세액</th>
							<th>총금액</th>
						</tr>
					 </tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>


<script type="text/javascript">
    stAccountPurchase1();

	function stAccountPurchase1() {
		$.ajax({
			type: "GET",
			URL: "st_accountPurchaseList",
			dataType: "json",
			success: function(json) {
				alert(json);
				/*
				 if(json.storePurchaseList.length==0) {
					$(".table > tbody").append("<tr><td colspan='7'>검색된 결과가 없습니다.</td></tr>");
				} else { 
					    $(json.storePurchaseList).each(function(i) {
						var list=json.storePurchaseList[i]; 
						var listAdd ="<tr>"+
									 "<td>"+list.historyDate+"</td>"+							
									 "<td>본사</td>"+							
									 "<td>"+list.itemNum+"</td>"+							
									 "<td>"+list.itemName+"</td>"+							
									 "<td>"+list.itemSprice+"</td>"+							
									 "<td>부가세</td>"+							
									 "<td>총합계</td>"							
						             +"</tr>";
						$(".table > tbody").append(listAdd);
					}) 
				}
					*/
			},
			
			error: function(xhr) {
				alert("에러코드 ="+xhr.status);
			}
		});
	}
	

</script>





























