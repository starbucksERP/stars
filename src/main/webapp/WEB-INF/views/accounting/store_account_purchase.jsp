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
			<div class="right">
			<button type="button" class="a-button big" id="searchBtn" ><i class="fas fa-search" ></i>&nbsp;검색</button>
			<button type="button" class="a-button sea big" id="resetBtn" ><i class="fas fa-search" ></i>&nbsp;초기화</button>
			</div>
			<hr />
			<input type="hidden" id="hStoreId" name="storeId" />
			<table class="table">
				<thead>
					<tr>
						<th>기준일자</th>
						<td>
							<label class="gLabel"><input type="date" class="item historyDate" id="historyDate" name="historyDate"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" class="item historyDate1" id="historyDate1" name="historyDate1"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
						</td>
					</tr>
					<tr>
						<th>품목코드</th>
						<td><input type="search" class="item Num" id="itemNum" name="itemNum"/></td>
					</tr>
					<tr>
						<th>품목명</th>
						<td><input type="search" class="item Name" id="itemName" name="itemName"/></td>
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
				<table class="table" >
					<thead>
						<tr>
							<th>일자</th>
							<th>거래처명</th>
							<th>품목코드</th>
							<th>품목명</th>
							<th>수량</th>
							<th>단가</th>
							<th>매입금액</th>
							<th>부가세액</th>
							<th>총금액</th>
						</tr>
					 </thead>
					 <tbody id="listDiv">
					 </tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>


<script type="text/javascript">

	stAccountPurchase();
 
		//var today=new Date();
		//var period=new Date();
		//period.setDate(today.getDate()-14);
		var historyDate=$("#historyDate").val();
		var historyDate1=$("#historyDate1").val();
		var itemNum=$("#itemNum").val();
		var itemName=$("#itemName").val();
	
		$("#searchBtn").click(function() {
			
			   itemNum=$("#itemNum").val();
			   itemName=$("#itemName").val();
			   historyDate=$("#historyDate").val();
			   historyDate1=$("#historyDate1").val();
				if (historyDate=="" && historyDate1!="") {
					historyDate=historyDate1;
				} else if (historyDate1=="" && historyDate!="") {
					historyDate1=historyDate;
				} 
				stAccountPurchase();
			});
		
		$("#resetBtn").click(function() {
			$(".item").val("");
		});
		
        stAccountPurchase();
    
		function stAccountPurchase() {
			$.ajax({
				type: "POST",
				url: "st_accountPurchase",
				headers:{"content-type":"application/json"},
				data: JSON.stringify({"itemNum":itemNum,"itemName":itemName,"historyDate":historyDate,"historyDate1":historyDate1}),
				dataType: "json",
				success: function(json) {
					 if(json.length==0) {
						var html="<tr><td colspan='9'>검색된 결과가 없습니다.</td></tr>";
						$("#listDiv").html(html);
					} else { 
						var html="";
						var sumPprice=0;
						var sumVat=0;
						var sumTot=0;
					
						$(json).each(function() {
							 var qty=this.sih.itemQty;
							 var price=this.oi.itemSprice;
							 var pPrice=qty*price;
							 var vat=(pPrice)*(0.1);
							 var tot=parseInt((pPrice)*(1.1));
						
						  html+="<tr>"+
						 			 "<td>"+(this.sih.historyDate).substring(0,10)+"</td>"+							
								 	 "<td>본사</td>"+							
								     "<td>"+this.sih.itemNum+"</td>"+							
									 "<td>"+this.sih.itemName+"</td>"+							
									 "<td>"+qty+"</td>"+							
									 "<td>"+price+"</td>"+							
								 	 "<td>"+pPrice+"</td>"+							
								 	 "<td>"+vat+"</td>"+							
								 	 "<td>"+tot+"</td>"+
								 	 "</tr>";
							 	 
							 		sumPprice+=pPrice;
							 		sumVat+=vat;
							 		sumTot+=tot;
						});
					
							 html+="<tr style='height: 20px; background-color:#D4C9C2; font:bold; '>"+
							 	   "<td colspan='6'>합계</td>"+
							 	   "<td>"+sumPprice+"</td>"+
							 	   "<td>"+sumVat+"</td>"+
							 	   "<td>"+sumTot+"</td>"+
							 	   "</tr>";
							   	   $("#listDiv").html(html);
						}
					},
					error: function(xhr) {
						alert("에러코드 ="+xhr.status);
					}
					
				});
			}
</script>





























