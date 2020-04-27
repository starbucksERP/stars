<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.details{
	display: none;
}
</style>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">재고관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/storeItem/itemList">재고현황</a>
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
							<th>발주요청일</th>
							<td style="width: 38%"><input type="hidden" id="storeId" value="${loginHewon.hewonStId}"/><label class="gLabel"><input type="date" readonly="readonly"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							<th>대분류</th>
							<td>
								<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="P" id="repMain">음료</label>
								<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="B" >푸드</label>
								<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="C" >MD상품</label>
								<label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="D" >기타</label>
							</td>
						</tr>
						<tr>
							<th>소분류</th>
							<td colspan="3">
								<span class="ddd">대분류를 선택해주세요.</span>
								<span id="detailP" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="71-" id="repP">커피</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="72-" >라떼/모카/초콜릿</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="73-" >프라프치노</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="74-" >블랜디드</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="75-" >피지오</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="76-" >티</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryP" name="category2" value="77-" >기타</label>
								</span>
								<span id="detailB" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="05-" id="repB">베이커리</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="06-" >케이크</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="07-" >샌드위치</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="08-" >디저트</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="09-" >아이스크림</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="10-" >병음료</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="11-" >기타</label>
								</span>
								<span id="detailC" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="12-" id="repC">머그컵</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="13-" >글라스컵</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="14-" >텀블러</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="15-" >콜드컵</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="16-" >악세서리</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="17-" >커피용품</label>
									<label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="18-" >기타</label>
								</span>
								<span id="detailD" class="details">
									<label class="gLabel"><input type="radio" class="fChk category2 categoryD" name="category2" value="00-" id="repD">선택사항없음</label>
								</span>
							</td>
							</tr>
							<tr>
							<th>판매상품 정보</th>
							<td>
								<select name="" id="CategoryListOption" style="width: 300px;">
									<option value="">소분류를 선택해주세요.</option>
								</select>
								</td>
								<th>판매상품명</th>
								<td><span id="saleProduct">판매상품 정보를 선택해주세요</span>&nbsp;</td>
							</tr>
							<tr>
								<th>판매단가</th>
								<td>￦<span id="salePrice"></span></td>
								<th>수량</th>
								<td colspan="3"><input type="number" id="saleQty"/>  &nbsp;개 </td>
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
	
	function reset(){
		$(".storeId").parents('tr').remove();
	}
	
	$("input[type='date']").val(today);
	
	$(".addTr").click(function() {
		$(".message").text(" ");
		
		if($('#salePrice').text()=='' || $('#salePrice').text()=="상품정보를 선택해주세요."){
			alert("상품정보를 선택하지 않았습니다.");
			return false;
		}
		if($('#salePrice').text()==''){
			alert("상품정보를 선택하지 않았습니다.");		
			return false;
		}
		if($('#saleQty').val()=='' ){
			alert("판매등록 개수를 선택하지 않았습니다.");
			return false;
		}else if(Number($('#saleQty').val())<=0){
			alert("음수 또는 0개는 등록할 수 없습니다.");
			return false;
		}
		
		
		var salePriceSum=$('#saleQty').val()*$('#salePrice').text();
		
		var html="<tr>"+
			"<td><input type='checkbox' class='rowChk'/></td>"+
			"<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='saleDate' value='"+$("input[type='date']").val()+"'/></td>"+
			"<td><span style='text-align:center;' class='storeId'>"+$('#storeId').val()+"</span></td>"+
			"<td><span style='text-align:center;' class='saleProducts'>"+$('#saleProduct').text()+"</span></td>"+
			"<td><span style='text-align:center; ' class='saleQty'>"+$('#saleQty').val()+"</span> 개</td>"+
			"<td>￦<span style='text-align:center; ' class='salePrice'>"+$('#salePrice').text()+"</span></td>"+
			"<td>￦<span style='text-align:center; ' class='salePriceSum'>"+salePriceSum+"</span></td>"+
		"</tr>";
		
		$(".table>tbody").append(html);
		
	});
	
	
	$("#storeSaleInput").click(function(){
	    
	    var param = [];
	 	var storeSale=[];
	 	
	 	if($('.rowChk:checked').length==0){
			$(".message").text("판매등록 리스트를 체크해주세요")
		}else{
		    $(".rowChk:checked").each(function(i) {
		    	storeSale = {
		        	storeId			: $("#storeId").val(),
        	   		saleProduct    : $(this).parents('tr').find(".saleProducts").text(),
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
						location.href="${pageContext.request.contextPath }/storeItem/saleList";
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}
	});
	
	
	// 가격 등록
	/* $("#saleProduct").change(function() {
		
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
		
	});  */
	
	
	$("input[name='category1']").change(function() {
		$(".ddd").hide();
		var category=$(".category1:checked").val();
		$(".details").hide();
		$('.category2').removeAttr('checked');
		if(category == 'P') {
			$('#detailP').show();
			$("#repP").prop("checked", true);
		} else if(category == 'B') {
			$('#detailB').show();
			$("#repB").prop("checked", true);
		} else if(category == 'C') {
			$('#detailC').show();
			$("#repC").prop("checked", true);
		} else {
			$('#detailD').show();
			$("#repD").prop("checked", true);
		}
		
	});
	
	
	$("input[name='category2']").change(function() {
		var category1=$(".category1:checked").val();
		var category2=$(".category2:checked").val();
		var itemNum=category1+category2;
		
		if(category1=='P'){
			$.ajax({
				type: "GET",
				url: "saleProduct/"+itemNum,
				headers: {"content-type":"application/json"},
				dataType: "json",
				success: function(json) {
					$("#CategoryListOption").empty();
					if(json.length==0) {
						$("#CategoryListOption").append("<option value=''>해당품목이 존재하지 않습니다. </option>"); 
						return;
					}
				
		       		$(json).each(function() {
		       			$("#CategoryListOption").append("<option value="+this.category+">"+this.product+"</option>"); 
					});    
		       		
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
			
			
			
		}else{
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath }/item/product",
				headers: {"content-type":"application/json"},
				data: JSON.stringify({"itemNum":itemNum,"itemUsage":1}),
				dataType: "json",
				success: function(json) {
					$("#CategoryListOption").empty();
					if(json.length==0) {
						$("#CategoryListOption").append("<option value=''>해당품목이 존재하지 않습니다. </option>"); 
						return;
					}
				
		       		$(json).each(function() {
		       			$("#CategoryListOption").append("<option value="+this.itemNum+">"+this.itemName+"</option>"); 
					});    
		       		
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
			
		}
		
		
	});
	
	
	
	
	$("#CategoryListOption").change(function() {
		var itemNum = $(this).val();
		var category1=$(".category1:checked").val();	
		console.log(itemNum);
		if(category1=='P'){
			
			$.ajax({
				type: "GET",
				url: "saleProductName/"+itemNum,
				dataType: "json",
				success: function(json) {
					$("#saleProduct").text(json.product);
					$("#salePrice").text(Number(json.productPrice)*1.5);
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
			
			
		}else{
			
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath }/item/getItem/"+itemNum,
				dataType: "json",
				success: function(json) {
					$("#saleProduct").text(json.itemName);
					$("#salePrice").text(Number(json.itemSprice)*1.5);
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
			
		}
		
		
		
	});
	
	
	
	
	
	
</script>