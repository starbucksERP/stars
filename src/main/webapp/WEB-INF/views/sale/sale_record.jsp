<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">재고관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">품목관리</a><br /><br />
						<a href="">재고관리</a><br /><br />
					</div>
				</li>
				<li>
					<button class="dropdown-btn">판매관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">판매기록</a><br /><br />
						<a href="">판매현황</a>
					</div>
				</li>
				
			</ul>
		</div>

		<div class="main">
		
			<h3>판매 등록</h3>
			<br />
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th>판매등록일</th>
							<td><label class="gLabel"><input type="date" readonly="readonly" id="saleDate"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							<th>판매등록 매장</th>
							<td><input type="text"  value="1594" readonly="readonly" id="storeId"/></td>
						</tr>
					</thead>
				</table>
			</div>
			<hr/>
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
							<th>판매날짜</th>
							<th>지점</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>상품명</th>
							<th>수량</th>
							<th>판매액</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-04-19</td>
							<td>스타벅스 강남점</td>
							<td>
								<select name="saleCategory" class="saleCategory">
	                            	<option value="">전체</option>
	                            	<option value="A">제조음료</option>
	                            	<option value="B">푸드</option>
	                            	<option value="C">상품</option>
	                            </select>
							</td>
                            <td>
                         		<select name="saleSubCategory" class="saleSubCategory">
                         		</select>
                           	</td>
							<td>
                           		<select name="saleProduct" class="saleProduct">
                           		</select>
                           	</td>
							<td>
								<input type="number" name="saleQty" class="saleQty" /> 개
							</td>
							<td>
								<input type="number" name="salePriceSum" class="salePriceSum" readonly="readonly"/> 원
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8"><div class="message center red-font"></div></td>
						</tr>
					</tfoot>
				</table>
				<div class="center">
					<button type="button" class="a-button big" id="saleInput">판매 등록</button>
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

	
	
	$("#saleInput").click(function(){
	    
	    var param = [];
	 	var sales=[];
	 	
	 	if($('.rowChk:checked').length==0){
			$(".message").text("등록할 판매리스트를 체크해주세요")
		}else{
		    $(".rowChk:checked").each(function(i) {
		 
		    	sales = {
		        	storeId			: $("#storeId").val(),
		        	saleProduct   	: $(this).parents('tr').find(".saleProduct").val(),
		        	saleQty         : $(this).parents('tr').find(".saleQty").val()
		        };
		        
		        param.push(sales);
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
						location.href="${pageContext.request.contextPath }/sale_list";
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}
	});
	
	
	function reset() {
		
	};
	
	
	
</script>