<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">재고관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/item/productList">품목현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/item/itemList">재고현황</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">판매관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/storeItem/saleList">판매조회</a><br /><br />
						<a href="${pageContext.request.contextPath}/storeItem/sale_record">판매등록</a>
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>판매기록</h3>
			<br />
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th>판매등록일</th>
							<td style="width: 38%"><label class="gLabel"><input type="date" readonly="readonly"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							<th>판매등록 매장</th>
							<td><input type="search" value="1021" readonly="readonly" id="storeId" class="storeId"/></td>
						</tr>
						<tr>
							<th>분류</th>
							<td>
								<select class="saleCategory">
	                            	<option value="">전체</option>
	                            	<option value="A">제조음료</option>
	                            	<option value="B">푸드</option>
	                            	<option value="C">상품</option>
	                            </select>
                            </td>
                            <th>소분류</th>
                            <td>
								<select class="saleSubCategory">
								</select>
							</td>
						</tr>
						<tr>
							<th>품목</th>
							<td>
								<select class="saleProduct" id="saleProduct">
								</select>
							</td>
							<th>수량</th>
							<td><input type="number" id="saleQty"/>  &nbsp;개 <input type="hidden" id="salePrice" /></td>
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
							<th style="width:7%;">판매등록매장</th>
							<th style="width:18%;">판매상품</th>
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
					<button type="button" class="a-button big" id="storeSaleInput" >판매 등록</button>
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
		
		var salePriceSum=$('#saleQty').val()*$('#salePrice').val();
		
		var html="<tr>"+
			"<td><input type='checkbox' class='rowChk'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='saleDate' value='"+$("input[type='date']").val()+"'/></td>"+
			"<td><span style='text-align:center;' class='storeId'>"+$('#storeId').val()+"</span></td>"+
			"<td><span style='text-align:center;' class='saleProducts'>"+$('#saleProduct').val()+"</span></td>"+
			"<td><span style='text-align:center; ' class='saleQty'>"+$('#saleQty').val()+"</span> 개</td>"+
			"<td>￦<span style='text-align:center; ' class='salePrice'>"+$('#salePrice').val()+"</span></td>"+
			"<td>￦<span style='text-align:center; ' class='salePriceSum'>"+salePriceSum+"</span></td>"+
		"</tr>";
		
		$(".table>tbody").append(html);
		
	});
	
	
	$("#storeSaleInput").click(function(){
	    
	    var param = [];
	 	var storeSale=[];
	 	
	 	if($('.rowChk:checked').length==0){
			$(".message").text("발주할 물품 리스트를 체크해주세요")
		}else{
		    $(".rowChk:checked").each(function(i) {
		    	storeSale = {
		        	storeId			: $("#storeId").val(),
        	   		saleProduct     : $(this).parents('tr').find(".saleProducts").text(),
        	   		salePrice		: $(this).parents('tr').find(".salePrice").text(),
	        		saleQty         : $(this).parents('tr').find(".saleQty").text()
		        };
		    	
		        
		 	// param 배열에 storeOrder 오브젝트를 담는다.
		        param.push(storeSale);
		    });
		    
	
		    $.ajax({
				type: "POST",
				url: "sale_record",
				headers: {"content-type":"application/json"},
				data: JSON.stringify(param),
				dateType: "text",
				success: function(text) {
					if(text=="success") {
						alert("판매등록이 성공적으로 이루어졌습니다.")
						location.href="${pageContext.request.contextPath }/storeItem/sale_list";
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}
	});
	
	
	// 가격 등록
	$("#saleProduct").change(function() {
		
		var saleProduct = $(this).val();
		
		$.ajax({
			type: "GET",
			url: "searchProduct/"+saleProduct,
			dateType: "json",
			success: function(json) {
				if(json.sale2!=null){
					$("#salePrice").val(json.sale2.productPrice);
				}else if(json.sale1!=null){
					$("#salePrice").val(json.sale1.itemSprice);
				}
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status) 
			}
	    
		});
		
	}); 
	
	
	
</script>