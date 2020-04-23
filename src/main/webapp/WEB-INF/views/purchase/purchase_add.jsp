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
							<a href="${pageContext.request.contextPath}/order/orderStateList">발주현황조회</a>
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
		
			<h3>구매입력</h3>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>구매요청일</th>
						<td><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
						<th>담당자</th>
						<td>
							<input type="search" readonly="readonly" value="login사용자출력"/>
						</td>
						<th>거래처</th>
						<td><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
					</tr>
				</thead>
			</table>
			
			<hr>
			<br />
			
			<div>
				<button type="button" class="a-button padding-button addTr">항목추가</button>&nbsp;
				<button type="button" class="a-button padding-button red delTr">항목삭제</button>
			</div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>품목코드</th>
							<th>품목</th>
							<th>수량</th>
							<th>구매가</th>
							<th>총액</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>1</td>
							<td>COF_IND283120</td>
							<td>리저브_웨스트자바스몰랏인도네시아</td>
							<td><input type="text" value="200" id="qty" class="number"></td>
							<td><span id="price">39000</span></td>
							<td><span id="total"></span></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" style="font-size: 22px; color: red; text-align: right; margin-right: 8px; height: 26px;">총 구매액 = <span>501,000</span> 원</td>
						</tr>
						<tr>
							<td colspan="7"><div class="message center red-font"></div></td>
						</tr>
					</tfoot>
				</table>
			</div>
			
			<div class="center">
					<button type="button" class="a-button big" id="purchaseAddBtn">판매 등록</button>
					<button type="button" class="a-button gray big" onclick="reset()">다시 작성</button>
			</div>
			
		
		</div>

	</div>
</div>


<script type="text/javascript">
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	
	 
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	today = yyyy+'-'+mm+'-'+dd;
	
	
	$("input[type='date']").val(today);
	
	
	
	/* $("#purchaseAddBtn").click(function(){
	    
	    var param = [];
	 	var storeOrder=[];
	 	
	 	if($('.rowChk:checked').length==0){
			$(".message").text("구매할 물품 리스트를 체크해주세요")
		}else{
		    $(".rowChk:checked").each(function(i) {
		 
		    	storeOrder = {
		        	requestNum		: "P"+dd+mm+$("#storeId").val().substr(0, 1),
		        	storeId			: $("#storeId").val(),
	        		itemNum        	: $(this).parents('tr').find(".itemNum").val(),
	        	//	itemName      	: $(this).parents('tr').find(".itemName").val(),
	        		orderQty        : $(this).parents('tr').find(".orderQty").val()
		        };
		        
		 	// param 배열에 storeOrder 오브젝트를 담는다.
		        param.push(storeOrder);
		    });
		    
	
		    $.ajax({
				type: "POST",
				url: "storeOrderInput",
				headers: {"content-type":"application/json"},
				data: JSON.stringify(param),
				dateType: "text",
				success: function(text) {
					if(text=="success") {
						alert("발주가 성공적으로 이루어졌습니다.")
						location.href="/storeOrderSta"
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}
	});
 */

	// number 가격 범위에 숫자만 입력
	$(".number").on("keyup", function() {
    	$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 총액 계산
	var qty=parseInt($("#qty").val());
	var price=parseInt($("#price").text());
	
	$("#total").text(qty*price);
	 
</script>
