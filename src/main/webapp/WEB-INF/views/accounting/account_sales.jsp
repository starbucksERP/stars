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
		
			<h3>매출 현황 - 본사</h3>
			<div class="right">
			<button type="button" class="a-button darkgreen big" id="searchBtn" ><i class="fas fa-search"></i>&nbsp;검색</button>
			<button type="button" class="a-button sea big" id="resetBtn" ><i class="fas fa-search" ></i>&nbsp;초기화</button>
			</div>
			<hr />
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
						<th>지점명</th>
						<td><input type="search" class="item storeName" id="storeName" name="storeName" /></td>
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
						<th>
							총 매출금액<br /><br />
							<input type="search" class="item Name" id="total" readonly="readonly" style="text-align: center; border:none; background: #D4C9C2;"/>
						</th>
						<td>
							매출금액&nbsp;&nbsp;<input type="search" class="item money Tot" readonly="readonly" id="totSrice" style="text-align: center; border:none;" /><br /><br />
							&nbsp;&nbsp;&nbsp;세액 &nbsp;&nbsp;&nbsp;&nbsp;<input type="search" class="item momey Tot" readonly="readonly" id="totVat" style="text-align: center; border:none;"/>
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
							<th>지점명</th>
							<th>품목코드</th>
							<th style="width: 150px;">품목명</th>
							<th>단가</th>
							<th>수량</th>
							<th>매출금액</th>
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

	mainAccountSales();

	var historyDate=$("#historyDate").val();
	var historyDate1=$("#historyDate1").val();
	var storeName=$("#storeName").val();
	var itemNum=$("#itemNum").val();	
	var itemName=$("#itemName").val();
	
	$("#searchBtn").click(function() {
		
	   storeName=$("#storeName").val();
	   itemNum=$("#itemNum").val();
	   itemName=$("#itemName").val();
	   historyDate=$("#historyDate").val();
	   historyDate1=$("#historyDate1").val();
		if (historyDate=="" && historyDate1!="") {
			historyDate=historyDate1;
		} else if (historyDate1=="" && historyDate!="") {
			historyDate1=historyDate;
		} 
		mainAccountSales();
	});
	
	$("#resetBtn").click(function() {
		$(".item").val("");
	});
	
	mainAccountSales();
	
	function mainAccountSales() {
		$.ajax({
			type:"POST",
			url:"accountSales",
			headers:{"content-type":"application/json"},
			data: JSON.stringify({"storeName":storeName,"itemNum":itemNum,"itemName":itemName,"itemState":70 ,"historyDate":historyDate,"historyDate1":historyDate1}),
			dataType: "json",
			success: function(json) {
				$("#resultLength").html("총 검색결과 : "+json.length+"건");	
				if(json.length==0) {
					var html="<tr><td colspan='10'>검색된 결과가 없습니다.</td></tr>";
					$("#listDiv").html(html);
			   	    $("#total").val("");
			   	    $("#totSrice").val("");
			   	    $("#totVat").val("");	
				} else {
					var html="";
					var sumQty=0;
					var sumSprice=0;
					var sumVat=0;
					var sumTot=0;
					var number=0;
					
					$(json).each(function() {
						 var qty=this.sih.itemQty;
						 var price=this.oi.itemSprice;
						 var sPrice=qty*price;
						 var vat=(sPrice)*(0.1);
						 var tot=parseInt((sPrice)*(1.1));
						 number++;
					
					  html+="<tr>"+
					  			 "<td>"+number+"</td>"+
					 			 "<td>"+(this.sih.historyDate).substring(0,10)+"</td>"+							
							 	 "<td>"+this.st.storeName+"</td>"+							
							     "<td>"+this.sih.itemNum+"</td>"+							
								 "<td>"+this.sih.itemName+"</td>"+							
								 "<td>￦"+numeral(price).format('0,0')+"</td>"+							
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
				 	   "<td colspan='6'>합계("+json.length+" 건)</td>"+
				 	   "<td>"+numeral(sumQty).format('0,0')+"</td>"+
				 	   "<td>￦"+numeral(sumSprice).format('0,0')+"</td>"+
				 	   "<td>￦"+numeral(sumVat).format('0,0')+"</td>"+
				 	   "<td>￦"+numeral(sumTot).format('0,0')+"</td>"+
				 	   "</tr>";
				   	   $("#listDiv").html(html);	
				   	   $("#listDiv").html(html);
				   	   $("#total").val('￦'+numeral(sumTot).format('0,0'));
				   	   $("#totSrice").val('￦'+numeral(sumSprice).format('0,0'));
				   	   $("#totVat").val('￦'+numeral(sumVat).format('0,0')); 
				}
			},
			error: function(xhr) {
				alert("에러코드 ="+xhr.status);
			}
		});
	}
	

</script>

















