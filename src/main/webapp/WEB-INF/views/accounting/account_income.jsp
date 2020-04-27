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
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>손익분석 - 본사</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>기준일자</th>
						<td>
							<select id="month">
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</td>
					</tr>
				</thead>
			</table>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th style="min-width: 70px;">과목</th>
							<th>1월</th>
							<th>2월</th>
							<th>3월</th>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>


<script type="text/javascript">
/* var today = new Date();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();



var historyDate=[];

histroyDate.put(yyyy+'-'+mm) */

	accountIncome(); 
	
	var month = new Date().getMonth()+1;

	function accountIncome() {
		if($("#month").val()!=''){
			month=$("#month").val();
		}
		
		$.ajax({
			type: "POST",
			url: "accountIncome2",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"histroyDate":month}),
			dateType: "json",
			success: function(json) {
				var pPriceSum=0;
				var sPriceSum=0;;
				
				$(json.mainPurchase).each(function(i) {
					var pPrice = $(json.mainPurchase[i].ih).itemQty
					pPriceSum+=pPrice;
				});
				/* $(json.mainSell).each(function(i) {
					var sPrice = Number(($(this.item).itemSprice)*($(this.ih).itemQty));
					sPriceSum+=sPrice;
				});  */
				
				/* console.log($(json.mainPurchase[0].i.itemPprice));
				console.log($(json.mainPurchase[0].ih.itemQty));
				console.log(typeof(Number($(json.mainPurchase[0].ih.itemQty))));
				console.log(typeof(Number($(json.mainPurchase[0].i.itemPprice))));
				console.log(parseInt(($(json.mainPurchase[0].i.itemPprice))*($(json.mainPurchase[0].ih.itemQty)))); */
				console.log(pPriceSum);
				//console.log(sPriceSum);
				
				
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
	    
		});
		
	} 




</script>
