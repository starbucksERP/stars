<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">발주계획조회</a><br /><br />
						<a href="">발주현황조회</a><br /><br />
						<a href="">발주입력</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">입출하조회</a>
					</div>
				</li>
				
			</ul>
		</div>

		<div class="main">
		
			<h3>발주입력</h3>
			<br />
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th>발주요청일</th>
							<td style="width: 38%"><label class="gLabel"><input type="date" readonly="readonly"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							<th>발주요청매장</th>
							<td><input type="text"  value="1021" readonly="readonly" id="storeId"/></td>
						</tr>
						<tr>
							<th>분류</th>
							<td>
								<select class="category">
	                            	<option value="">전체</option>
	                            	<option value="A">제조음료</option>
	                            	<option value="B">푸드</option>
	                            	<option value="C">상품</option>
	                            </select>
	                            &nbsp;
								<select class="subCategory">
								</select>
							</td>
							<th>품목</th>
							<td>
								<select class="itemName" id="itemName">
								</select>
							</td>
						</tr>
						<tr>
							<th>상품코드</th>
							<td><input type="search" readonly="readonly" id="itemNum" style="border: none;"/></td>
							<th>수량</th>
							<td><input type="number" id="orderQty"/>  &nbsp;개 <input type="hidden" id="itemSprice" /></td>
						</tr>
					</thead>
				</table>
				<div class="right"><button type="button" class="a-button darkgreen large padding-button addTr">항목추가</button>&nbsp;</div>
			</div>
			<hr/>
			<br />
				<button type="button" class="a-button padding-button red delTr">항목삭제</button>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th style="width:3%;"><input type="checkbox" class="allChk"></th>
							<th style="width:9%;">날짜</th>
							<th style="width:7%;">발주요청매장</th>
							<th style="width:7%;">상품코드</th>
							<th style="width:18%;">품목</th>
							<th style="width:8%;">수량</th>
							<th style="width:10%;">단가</th>
							<th style="width:12%;">총합</th>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8"><div class="message center red-font"></div></td>
						</tr>
					</tfoot>
				</table>
				<div class="center">
					<button type="button" class="a-button big" id="storeOrderInput" >판매 등록</button>
					<button type="button" class="a-button sea big" onclick="reset()">다시 작성</button>
				</div>
			</div>
				
			
			
		</div>

	</div>
</div>


<script type="text/javascript">
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var time = today.getTime();
	
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	today = yyyy+'-'+mm+'-'+dd;
	
	
	$("input[type='date']").val(today);
	
	$(".addTr").click(function() {
		$(".message").text(" ");
		
		var html="<tr>"+
			"<td><input type='checkbox' class='rowChk itemNum'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='requestDate' value='"+$("input[type='date']").val()+"'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='storeId' value='"+$('#storeId').val()+"'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='itemNum' value='"+$('#itemNum').val()+"'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='itemNames' value='"+$('#itemName').val()+"'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center; width:50px;' class='orderQty' value='"+$('#orderQty').val()+"'/> 개</td>"+
			"<td>￦<input type='text' readonly='readonly'style='border:none; text-align:center; width:70px;' class='itemSprice' value='"+$('#itemSprice').val()+"'/></td>"+
			"<td>￦<input type='text' readonly='readonly'style='border:none; text-align:center; width:90px;' value='"+($('#orderQty').val()*$('#itemSprice').val())+"'/></td>"+
		"</tr>";
		
		$(".table>tbody").append(html);
		
	});
	
	
	$("#storeOrderInput").click(function(){
	    
	    var param = [];
	 	var storeOrder=[];
	 	
	 	if($('.rowChk:checked').length==0){
			$(".message").text("발주할 물품 리스트를 체크해주세요")
		}else{
		    $(".rowChk:checked").each(function(i) {
			 //	{orderSeq}, {requestNum}, {storeId}, {itemNum},  {orderQty}
		    	storeOrder = {
		        	requestNum		: time+$("#storeId").val().substring(0, 2),
		        	storeId			: $("#storeId").val(),
	        		itemNum        	: $(".itemNum").val(),
	        		itemName      	: $(".itemName").val(),
	        		itemSprice		: $(".itemSprice").val(),
	        		orderQty        : $(".orderQty").val()
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
						location.href="${pageContext.request.contextPath }/storeOrderSta";
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}
	});
	
	
	
	$("#itemName").change(function() {
		
		var itemName = $(this).val();
		
		$.ajax({
			type: "GET",
			url: "searchItem/"+itemName,
			dateType: "json",
			success: function(json) {
				$("#itemNum").val(json.item.itemNum);
				$("#itemSprice").val(json.item.itemSprice);
				
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status) 
			}
	    
		});
		
	}); 
	
	
	/*
		function priceSum(){
		
		$("tbody>tr").each(function(i) {
			if(i==0){
				return;
			}else{
				var priceSum=$(this).find(".itemSprice").val()*$(this).find(".orderQty").val();
				$(this).find(".orderPriceSum").text(priceSum);
			}
		})
	}
	
	*/
	
	
</script>