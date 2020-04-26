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
		
			<h3>매출 현황 - 지점</h3>
			<div class="right">
				<button type="button" class="a-button darkgreen big" id="searchBtn" ><i class="fas fa-search" ></i>&nbsp;검색</button>
				<button type="button" class="a-button sea big" id="resetBtn" ><i class="fas fa-search" ></i>&nbsp;초기화</button>
			</div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>기준일자</th>
						<td>
							<label class="gLabel"><input type="date" class="item saleDate" id="saleDate" name="saleDate"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;&nbsp;<label class="gLabel"><input type="date" class="item saleDatePair" id="saleDatePair" name="saleDatePair"/>&nbsp;<i class="far fa-calendar-alt"></i></label>    
						</td>
					</tr>
					<tr>
						<th>판매상품</th>
						<td><input type="search" class="item saleProduct" id="saleProduct" name="saleProduct" ></td>
					</tr>
					<tr>
						<th>판매수량</th>
						<td>
							<label class="gLabel"><input type="text" class="item saleQty" id="saleQty" name="saleQty"/></label>
							&nbsp;&nbsp;-&nbsp;&nbsp;<label class="gLabel"><input type="text" class="item saleQtyPair" id="saleQtyPair" name="saleQtyPair" /></label>
						</td>
					</tr>
					<tr>
						<th>
							총 매출금액<br /><br />
							<input type="search" class="item money Total" id="total" readonly="readonly" style="text-align: center; border:none; background: #D4C9C2;"/>
						</th>
						<td>
							매출금액&nbsp;&nbsp;<input type="search" class="item money Tot" readonly="readonly" id="totSprice" style="text-align: center; border:none;" /><br /><br />
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
				<table id="accountTable">
					<thead>
						<tr>
							<th>일자</th>
							<th>판매상품</th>
							<th>판매가액</th>
							<th>수량</th>
							<th>매출금액</th>
							<th>세액</th>
							<th>총 매출금액</th>
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
	stAccountSales();
	
	var saleDate=$("#saleDate").val();
	var saleDatePair=$("#saleDatePair").val();
	var saleProduct=$("#saleProduct").val();
	var saleQty=$("#saleQty").val();
	var saleQtyPair=$("#saleQtyPair").val();
	
	$("#searchBtn").click(function() {
		
		   saleProduct=$("#saleProduct").val();
		   saleDate=$("#saleDate").val();
		   saleDatePair=$("#saleDatePair").val();
		   saleQty=$("#saleQty").val();
		   saleQtyPair=$("#saleQtyPair").val();
		   
			if (saleDate=="" && saleDatePair!="") {
				saleDate=saleDatePair;
			} else if (saleDatePair=="" && saleDate!="") {
				saleDatePair=saleDate;
			}
			
			if (saleQty=="" && saleQtyPair!="") {
				saleQty=saleQtyPair;
			} else if (saleQtyPair=="" && saleQty!="") {
				saleQtyPair=saleQty;
			} 
			stAccountSales();
		});
	
	$("#resetBtn").click(function() {
		$(".item").val("");
	});
	
	stAccountSales();
	
	function stAccountSales() {
		$.ajax({
			type:"POST",
			url:"st_accountSales",
			headers:{"content-type":"application/json"},
			data: JSON.stringify({"saleProduct":saleProduct,"saleDate":saleDate,"saleDatePair":saleDatePair,"saleQty":saleQty ,"saleQtyPair":saleQtyPair}),
			dataType: "json",
			success: function(json) {
				$("#resultLength").html("총 검색결과 : "+json.length+"건");
				
				if(json.length==0) {
					var html="<tr><td colspan='9'>검색된 결과가 없습니다.</td></tr>";
					$("#listDiv").html(html);
			   	    $("#totSrice").val("");
			   	    $("#totVat").val("");
			   	    $("#total").val("");					
				} else {
					var html="";
					var sumQty=0;
					var sumSprice=0;
					var sumVat=0;
					var sumTot=0;
					
					$(json).each(function () {
						 var qty=(this.s.saleQty);
						 var price=(this.s.salePrice);
						 var sPrice=qty*price;
						 var vat=parseInt((sPrice)*(0.1));
						 var tot=parseInt((sPrice)*(1.1));
					
					  html+="<tr>"+
					 			 "<td>"+(this.s.saleDate).substring(0,10)+"</td>"+							
								 "<td>"+this.s.saleProduct+"</td>"+							
								 "<td>"+price+"</td>"+							
								 "<td>"+qty+"</td>"+							
							 	 "<td>￦"+numeral(sPrice).format('0,0')+"</td>"+							
							 	 "<td>￦"+numeral(vat).format('0,0')+"</td>"+							
							 	 "<td>￦"+numeral(tot).format('0,0')+"</td>"+
							 	 "</tr>";
						 	 
							 	sumQty+=qty;
						 		sumSprice+=sPrice;
						 		sumVat+=vat;
						 		sumTot+=tot;						
					});
					
						 html+="<tr style='height: 20px; background-color:#D4C9C2; font:bold; '>"+
					 	   "<td colspan='3'>합계</td>"+
					 	   "<td>"+sumQty+"</td>"+
					 	   "<td>￦"+numeral(sumSprice).format('0,0')+"</td>"+
					 	   "<td>￦"+numeral(sumVat).format('0,0')+"</td>"+
					 	   "<td>￦"+numeral(sumTot).format('0,0')+"</td>"+
					 	   "</tr>";
					   	   $("#listDiv").html(html);
					   	   $("#totSprice").val('￦'+numeral(sumSprice).format('0,0'));
					   	   $("#totVat").val('￦'+numeral(sumVat).format('0,0')); 
					   	   $("#total").val('￦'+numeral(sumTot).format('0,0'));
				}
				
			},
			error: function (xhr) {
				alert("에러코드 ="+xhr.status);
			}
		});
	}

</script>



















