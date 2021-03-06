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
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>매입 현황 - 본사</h3>
			<div class="right">
			<button type="button" class="a-button darkgreen big" id="searchBtn" ><i class="fas fa-search" ></i>&nbsp;검색</button>
			<button type="button" class="a-button sea big" id="resetBtn" ><i class="fas fa-search" ></i>&nbsp;초기화</button>
			</div>
			<hr />
			<table id="accountTable">
				<thead>
					<tr>
						<th>기준일자</th>
						<td>
							<label class="gLabel"><input type="date" class="item purchaseDate" id="purchaseDate" name="purchaseDate"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" class="item purchaseDateTwo" id="purchaseDateTwo" name="purchaseDateTwo"/>&nbsp;<i class="far fa-calendar-alt"></i></label>    
						</td>
					</tr>
					<tr>
						<th>거래처명</th>
						<td><input type="search" class="item Vendor" id="itemVendor" name="itemVendor" /></td>
					</tr>
					<tr>
						<th>품목코드</th>
						<td><input type="search" class="item Num" id="itemNum" name="itemNum"/></td>
					</tr>
					<tr>
						<th>
							총 매입금액<br /><br />
							<input type="text" class="item money Name" id="total" readonly="readonly" style="text-align: center; border:none; background: #D4C9C2;"/>
						</th>
						<td>
							매입금액&nbsp;&nbsp;<input type="text" class="item money Tot" readonly="readonly" id="totPrice" style="text-align: center; border:none;"/><br /><br />
							&nbsp;&nbsp;&nbsp;세액 &nbsp;&nbsp;&nbsp;&nbsp;<input type="search" class="item momey Tot" id="totVat" readonly="readonly" style="text-align: center; border:none;"/>
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
							<th>번호</th>
							<th>일자</th>
							<th>거래처명</th>
							<th>품목코드</th>
							<th style="width: 100px;">품목명</th>
							<th>단가</th>
							<th>수량</th>
							<th>매입금액</th>
							<th>세액</th>
							<th>총 매입금액</th>
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
	
	accountPurchase();
 
	var purchaseDate=$("#purchaseDate").val();
	var purchaseDateTwo=$("#purchaseDateTwo").val();
	var itemNum=$("#itemNum").val();
	var itemVendor=$("#itemVendor").val();
	
	$("#searchBtn").click(function() {
		
	   itemNum=$("#itemNum").val();
	   itemVendor=$("#itemVendor").val();
	   purchaseDate=$("#purchaseDate").val();
	   purchaseDateTwo=$("#purchaseDateTwo").val();
		if (purchaseDate=="" && purchaseDateTwo!="") {
			purchaseDate=purchaseDateTwo;
		} else if (purchaseDateTwo=="" && purchaseDate!="") {
			purchaseDateTwo=purchaseDate;
		} 
		accountPurchase();		
	});
	
		
	$("#resetBtn").click(function() {
		$(".item").val("");
	});	
	
	accountPurchase();
	
	function accountPurchase() {
		$.ajax({
			type: "POST",
			url:"accountPurchase",
			headers:{"content-type":"application/json"},
			data: JSON.stringify({"itemNum":itemNum,"itemVendor":itemVendor ,"purchaseDate":purchaseDate,"purchaseDateTwo":purchaseDateTwo}),
			dataType: "json",
			success: function(json) {
				$("#resultLength").html("총 검색결과 : "+json.length+"건");
				if(json.length==0) {
					var html="<tr><td colspan='10'>검색된 결과가 없습니다.</td></tr>";
					$("#listDiv").html(html);
			   	    $("#totPrice").val("");
			   	    $("#totVat").val("");
			   	    $("#total").val("");
				} else {
					
					var html="";
					var sumQty=0;
					var sumPprice=0;
					var sumVat=0;
					var sumTot=0;
					var number=0;
				
					$(json).each(function() {
						 var qty=this.p.itemQty;
						 var price=this.p.itemPprice;
						 var pPrice=qty*price;
						 var vat=(pPrice)*(0.1);
						 var tot=parseInt((pPrice)*(1.1));
						 number++;
					
					  html+="<tr>"+
					  			 "<td>"+number+"</td>"+
					 			 "<td>"+(this.p.purchaseDate).substring(0,10)+"</td>"+							
							 	 "<td>"+this.p.itemVendor+"</td>"+							
							     "<td>"+this.p.itemNum+"</td>"+							
								 "<td>"+this.i.itemName+"</td>"+							
								 "<td>￦"+numeral(price).format('0,0')+"</td>"+							
								 "<td>"+numeral(qty).format('0,0')+"</td>"+							
							 	 "<td>￦"+numeral(pPrice).format('0,0')+"</td>"+							
							 	 "<td>￦"+numeral(vat).format('0,0')+"</td>"+							
							 	 "<td>￦"+numeral(tot).format('0,0')+"</td>"+
							 	 "</tr>";
						 	 
							 	sumQty+=qty;
						 		sumPprice+=pPrice;
						 		sumVat+=vat;
						 		sumTot+=tot;					
				});
					 html+="<tr style='height: 20px; background-color:#D4C9C2; font:bold; '>"+
				 	   "<td colspan='6'>합계("+json.length+" 건)</td>"+
				 	   "<td>"+numeral(sumQty).format('0,0')+"</td>"+
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
			error: function (xhr) {
				alert("에러코드 = "+xhr.status);
			}
		
		});
		
	}
	

</script>










