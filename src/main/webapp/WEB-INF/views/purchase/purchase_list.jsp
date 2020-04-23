<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/order/orderReq">발주요청조회</a><br /><br />
							<a href="${pageContext.request.contextPath}/order/orderList">발주현황조회</a>
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
			
				<h3>구매현황조회</h3>
				<div class="right"><button type="button" class="a-button big">구매예약현황</button>&nbsp;<button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
				<hr />
				<table class="table">
					<thead>
						<tr>
							<th>구매일</th>
							<td><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th>구매번호</th>
							<td><input type="search" /></td>
						</tr>
						<tr>
							<th>거래처명</th>
							<td><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							<th>구매타입</th>
							<td>
								<label class="gLabel"><input type="radio" class="fChk" >전체</label>
								<label class="gLabel"><input type="radio" class="fChk" >자동</label>
								<label class="gLabel"><input type="radio" class="fChk" >직접</label>
							</td>
						</tr>
						<tr>
							<th>품목</th>
							<td><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							<th>가격범위</th>
							<td><input type="text" id="price-scope1" class="number"/>&nbsp;-&nbsp;<input type="text" id="price-scope2" class="number"/></td>
						</tr>
					</thead>
				</table>
				
				<div class="right" style="float: right;">
		            <ul class="order-sta">
		               <li class="blackgray">전체</li>
		               <li >구매진행</li>
		               <li >구매종결</li>
		            </ul>
	        	 </div>
				<br />
				<hr  style="margin-top: 14px;"/>
				<br />
				<div class="date-output right">2020/02/18 - 2020/03/03</div>
				<br />
				<div>
					<button type="button" class="a-button green padding-button">구매확인</button>&nbsp;<button type="button" class="a-button green padding-button">구매종결</button>
				</div>
				<div class="information">
					<table class="table">
						<tbody>
							<tr>
								<th><input type="checkbox" class="allChk"></th>
								<th>구매타입</th>
								<th>구매일자</th>
								<th>거래처명</th>
								<th>폼목</th>
								<th>총 수량</th>
								<th>총 금액</th>
								<th>진행상태</th>
								<th>취소</th>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>A</td>
								<td>2020-03-03</td>
								<td>STARBUSKCDD</td>
								<td>스타벅스 머그컵 외 1건</td>
								<td>40</td>
								<td>510,000</td>
								<td class="green-font">요청</td>
								<td><button type="button" class="a-button red inner-button">취소</button></td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>H</td>
								<td>2020-03-03</td>
								<td>COJDOOEFJFJ</td>
								<td>리저브_노브크릭위스키배럴과테말라</td>
								<td>100</td>
								<td>1,615,000</td>
								<td class="green-font">종결</td>
								<td>-</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>H</td>
								<td>2020-03-03</td>
								<td>COJDOOEFJFJ</td>
								<td>리저브_노브크릭위스키배럴과테말라</td>
								<td>100</td>
								<td>1,615,000</td>
								<td class="red-font">취소</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
			
			</div>

		</div>
	</div>


<script type="text/javascript">
	// number 가격 범위에 숫자만 입력 및 콤마 입력
	
		//3자리 단위마다 콤마 생성
		function addCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	 
		//모든 콤마 제거
		function removeCommas(x) {
		    if(!x || x.length == 0) return "";
		    else return x.split(",").join("");
		}
		
		$(".number").on("focus", function() {
		    var x = $(this).val();
		    x = removeCommas(x);
		    $(this).val(x);
		}).on("focusout", function() {
		    var x = $(this).val();
		    if(x && x.length > 0) {
		        if(!$.isNumeric(x)) {
		            x = x.replace(/[^0-9]/g,"");
		        }
		        x = addCommas(x);
		        $(this).val(x);
		    }
		}).on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
	
</script>
