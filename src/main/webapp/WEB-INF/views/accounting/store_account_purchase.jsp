<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

#accountTable {
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

#accountTable thead>tr>th, #accountTable tbody>tr>th, #accountTable tfoot>tr>th, #accountTable>thead>tr>td,
   #accountTable tbody>tr>td, #accountTable tfoot>tr>td {
   padding: 9px;
   line-height: 1.4;
   border-top: 1px solid #ddd;
   border-bottom-width: 2px;
   vertical-align: middle !important;   
}

#accountTable thead>tr>th {
	width: 9%;
}

#accountTable thead>tr>td {
	padding-left: 20px;
}

#accountTable tbody+tbody {
   border-top: 2px solid #ddd;
}

#accountTable th {
     background: #D4C9C2;
      text-align: center;
}

#accountTable>thead>tr>td {
   text-align: left;
}

#accountTable>tbody>tr>td{
	padding: 8px 20px;
	text-align: center;
}

</style>

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
			<button type="button" class="a-button darkgreen big" id="searchBtn" ><i class="fas fa-search" ></i>&nbsp;검색</button>
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
							&nbsp;-&nbsp;&nbsp;<label class="gLabel"><input type="date" class="item historyDate1" id="historyDate1" name="historyDate1"/>&nbsp;<i class="far fa-calendar-alt"></i></label>    
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
						<td><button type="button" class="a-button darkgreen" style="width: 100px; text-align: center" >본  사</button></td>
					</tr>
					<tr>
						<th>
							총 매입금액<br /><br />
							<input type="search" class=" item money Total" id="total" readonly="readonly" style="text-align: center; border:none; background: #D4C9C2;"/>
						</th>
						<td>
							매입금액&nbsp;&nbsp;<input type="search" class="item money Tot" readonly="readonly" id="totPrice" style="text-align: center; border:none;"/>
							<br /><br />
							&nbsp;&nbsp;&nbsp;세액 &nbsp;&nbsp;&nbsp;&nbsp;<input type="search" class="item momey Vat" readonly="readonly" id="totVat" style="text-align: center; border:none;"/>
						</td>
					</tr>
				</thead>
			</table>
			
			<br />
			<hr>
			<br />
			<div class="information">
				<div id="resultLength" class="right"></div>
				<table id="accountTable" >
					<thead>
						<tr style="height: 20px; background-color:#D4C9C2; font:bold;">
							<th>일자</th>
							<th>거래처명</th>
							<th>품목코드</th>
							<th>품목명</th>
							<th>수량</th>
							<th>단가</th>
							<th>매입금액</th>
							<th>세액</th>
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
				data: JSON.stringify({"itemNum":itemNum,"itemName":itemName,"itemState":70 ,"historyDate":historyDate,"historyDate1":historyDate1}),
				dataType: "json",
				success: function(json) {
					$("#resultLength").html("총 검색결과 : "+json.length+"건");
					 if(json.length==0) {
						var html="<tr><td colspan='9'>검색된 결과가 없습니다.</td></tr>";
						$("#listDiv").html(html);
				   	    $("#totPrice").val("");
				   	    $("#totVat").val("");
				   	    $("#total").val("");
					} else { 
						var html="";
						var sumPprice=0;
						var sumVat=0;
						var sumTot=0;
					
						$(json).each(function() {
							 var qty=this.sih.itemQty;
							 var price=this.oi.itemSprice;
							 var pPrice=qty*price;
							 var vat=parseInt((pPrice)*(0.1));
							 var tot=parseInt((pPrice)*(1.1));
						
						  html+="<tr>"+
						 			 "<td>"+(this.sih.historyDate).substring(0,10)+"</td>"+							
								 	 "<td>본사</td>"+							
								     "<td>"+this.sih.itemNum+"</td>"+							
									 "<td>"+this.sih.itemName+"</td>"+							
									 "<td>"+qty+"</td>"+							
									 "<td>￦"+numeral(price).format('0,0')+"</td>"+							
								 	 "<td>￦"+numeral(pPrice).format('0,0')+"</td>"+							
								 	 "<td>￦"+numeral(vat).format('0,0')+"</td>"+							
								 	 "<td>￦"+numeral(tot).format('0,0')+"</td>"+
								 	 "</tr>";
							 	 
							 		sumPprice+=pPrice;
							 		sumVat+=vat;
							 		sumTot+=tot;
						});
					
							 html+="<tr style='height: 20px; background-color:#D4C9C2; font:bold; '>"+
							 	   "<td colspan='6'>합계</td>"+
							 	   "<td>￦"+numeral(sumPprice).format('0,0')+"</td>"+
							 	   "<td>￦"+numeral(sumVat).format('0,0')+"</td>"+
							 	   "<td>￦"+numeral(sumTot).format('0,0')+"</td>"+
							 	   "</tr>";
							   	   $("#listDiv").html(html);
							   	   $("#totPrice").val('￦'+numeral(sumPprice).format('0,0'));
							   	   $("#totVat").val('￦'+numeral(sumVat).format('0,0')); 
							   	   $("#total").val('￦'+numeral(sumTot).format('0,0'));
						}
						
					},
					error: function(xhr) {
						alert("에러코드 ="+xhr.status);
					}
					
				});
			}
</script>





























