<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	
	<div class="nav">
		<a href="${pageContext.request.contextPath}/" class="logo"><img src="${pageContext.request.contextPath }/images/logoF.png" alt="" ></a>
		<c:choose>
			<c:when test="${loginHewon.hewonGrade=='9'}">
				<div class="nav-right-list">
					<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/hewon/login';"><i class="fas fa-book-reader"></i>&nbsp;관리자</a>
					<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/hewon/join';"><i class="fas fa-address-card"></i>&nbsp;회원가입</a>
					<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/hewon/list';"><i class="fas fa-list-alt"></i>&nbsp;회원관리</a>
					<span class="nav-item numnum" onclick="location.href='${pageContext.request.contextPath}/order/orderRequestList'"><i class="fas fa-bell" style="font-size: 20px;"></i><span class="nav-counter" onclick="location.href='${pageContext.request.contextPath}/order/orderStateList'"></span></span>
					<br />
					<span class="notifyTri">▲</span>
					<ul class="notifyList">
					</ul>
				</div>
			</c:when>
			<c:when test="${loginHewon.hewonGrade=='5'}">
				<div class="nav-right-list">
					<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/hewon/login';"><i class="fas fa-list-alt"></i>&nbsp;회원관리</a>
				</div>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${loginHewon.hewonGrade=='9'}">
				<ul class="nav-left-list">
					<li class="nav-item">지점관리<br /><span class="tri">▲</span></li>
					<li class="nav-item">재고관리<br /><span class="tri">▲</span></li>
					<li class="nav-item" style="width: 160px; padding: 0px;">발주/구매관리<br /><span class="tri">▲</span></li>
					<li class="nav-item">배송관리<br /><span class="tri">▲</span></li>
					<li class="nav-item">회계관리<br /><span class="tri">▲</span></li>
				</ul>
				
			</c:when>
			<c:when test="${loginHewon.hewonGrade=='5'}">
				<ul class="nav-left-list">
					<li class="nav-item" style="width: 160px;">지점재고관리<br /><span class="tri">▲</span></li>
					<li class="nav-item" style="width: 160px; padding: 0px;">발주/구매관리<br /><span class="tri">▲</span></li>
					<li class="nav-item" style="width: 160px; padding: 0px;">회계관리<br /><span class="tri">▲</span></li>
				</ul>
			</c:when>
		</c:choose>
	</div>
	
	<div class="drop-list">
		<c:choose>
			<c:when test="${loginHewon.hewonGrade=='9'}">
				<ul class="drop-menu">
					<li onclick="location.href='${pageContext.request.contextPath}/store/storeEnroll'">지점 등록</li>
					<li onclick="location.href='${pageContext.request.contextPath}/store/storeSta'">지점 현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/store/storeStaff'">점주 정보</li>
				</ul>
				<!-- 관리자용 재고 -->
				<ul class="drop-menu" style="padding-left: 5%">
					<li onclick="location.href='${pageContext.request.contextPath}/item/product'">품목현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/item/itemList'">재고현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/storeItem/saleList'">판매조회</li>
				</ul>
				<!-- 관리자용 발주 -->
				<ul class="drop-menu" style="padding-left: 5%">
					<li onclick="location.href='${pageContext.request.contextPath}/order/orderRequestList'">발주요청조회</li>
					<li onclick="location.href='${pageContext.request.contextPath}/order/orderStateList'">발주현황조회</li>
					<li onclick="location.href='${pageContext.request.contextPath}/item/productPlan'">구매계획</li>
					<li onclick="location.href='${pageContext.request.contextPath}/purchase/purchaseList'">구매현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/purchase/purchaseAdd'">구매입력</li>
					<li onclick="location.href='${pageContext.request.contextPath}/order/history'">입출하조회</li>
				</ul>	
				<ul class="drop-menu" style="/* padding-left: 20% */padding-left:25%">
					<li onclick="location.href='${pageContext.request.contextPath}/delivery/deliveryReq'">배송요청조회</li>
					<li onclick="location.href='${pageContext.request.contextPath}/delivery/deliveryList'">배송조회</li>
				</ul>	
				<!-- 관리자용 -->
				<ul class="drop-menu" style="padding-left: 35%">
					<li onclick="location.href='${pageContext.request.contextPath}/account/accountPurchase'">매입 현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/account/accountSales'">매출 현황</li>
				</ul>
			</c:when>
			<c:when test="${loginHewon.hewonGrade=='5'}">
				<ul class="drop-menu" style="padding-left: 5%">
					<li onclick="location.href='${pageContext.request.contextPath}/storeItem/itemList'">재고현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/storeItem/saleList'">판매조회</li>
					<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_record'">판매등록</li>
				</ul>
				<!-- 지점용 발주 -->
				<ul class="drop-menu" style="padding-left: 10%">
					<li onclick="location.href='${pageContext.request.contextPath}/sic/storeOrderInput'">발주입력</li>
					<li onclick="location.href='${pageContext.request.contextPath}/sic/storeOrderRequestList'">발주요청조회</li>
					<li onclick="location.href='${pageContext.request.contextPath}/sic/storeOrderStateList'">발주현황조회</li>
					<li onclick="location.href='${pageContext.request.contextPath}/storeItem/deliveryList'">배송조회</li>
				</ul>	
				<!-- 지점용 -->
				<ul class="drop-menu" style="padding-left: 25%">
					<li onclick="location.href='${pageContext.request.contextPath}/account/st_accountPurchase'">매입 현황</li>
					<li onclick="location.href='${pageContext.request.contextPath}/account/st_accountSales'">매출 현황</li>
				</ul>
			</c:when>
		</c:choose>
	</div>
			
		<%-- <!-- 관리자 용 -->
		<ul class="drop-menu">
			<li onclick="location.href='${pageContext.request.contextPath}/store/storeEnroll'">지점 등록</li>
			<li onclick="location.href='${pageContext.request.contextPath}/store/storeSta'">지점 현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/store/storeStaff'">점주 정보</li>
		</ul>
		<!-- 관리자용 재고 -->
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='${pageContext.request.contextPath}/item/product'">품목현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/item/itemList'">재고현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/saleList'">판매조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_record'">판매등록</li>
		</ul>
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/itemList'">재고현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/saleList'">판매조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_record'">판매등록</li>
		</ul>
		<!-- 관리자용 발주 -->
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='${pageContext.request.contextPath}/order/orderRequestList'">발주요청조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/order/orderStateList'">발주현황조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/item/productPlan'">구매계획</li>
			<li onclick="location.href='${pageContext.request.contextPath}/purchase/purchaseList'">구매현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/purchase/purchaseAdd'">구매입력</li>
			<li onclick="location.href='${pageContext.request.contextPath}/order/history'">입출하조회</li>
		</ul>		
		<!-- 지점용 발주 -->
		<ul class="drop-menu" style="padding-left: 15%">
			<li onclick="location.href='${pageContext.request.contextPath}/sic/storeOrderInput'">발주입력</li>
			<li onclick="location.href='${pageContext.request.contextPath}/sic/storeOrderRequestList'">발주요청조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/sic/storeOrderStateList'">발주현황조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/sic/storeReceipt'">입출하조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/deliveryList'">배송조회</li>
		</ul>		
		<ul class="drop-menu" style="/* padding-left: 20% */padding-left:35%">
			<li onclick="location.href='${pageContext.request.contextPath}/delivery/deliveryReq'">배송요청조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/delivery/deliveryList'">배송조회</li>
		</ul>	
		<!-- 관리자용 -->
		<ul class="drop-menu" style="padding-left: 18%">
			<li onclick="location.href='${pageContext.request.contextPath}/account/accountPurchase'">매입 현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/accountSales'">매출 현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/accountIncome'">손익 분석</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/purchaseMonth'">매입 월별현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/salesMonth'">매출 월별현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/incomeMonth'">월별 손익분석</li>
		</ul>
		<!-- 지점용 -->
		<ul class="drop-menu" style="padding-left: 18%">
			<li onclick="location.href='${pageContext.request.contextPath}/account/st_accountPurchase'">매입 현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/st_accountSales'">매출 현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/account/st_accountIncome'">손익 분석</li>
		</ul>				 
	</div>
	--%>	
	
	
	
	
		
</div>

<script type="text/javascript">
updateOrder();

function updateOrder(){
	$.ajax({
		type: "GET",
		url: "upupNum",
		success: function(json){
			var num=Number($(".nav-counter").text());
			$(json).each(function(i) {
				this.storeId
				if(this.orderNumQty!=0){
					$(".notifyList").append("<li>("+this.storeId+")매장에서 발주를 신청했습니다.</li>");
					num+=1;
				}
			});
			
			$(".nav-counter").text(Number(num));
		},
		error: function(xhr){
			alert("에러코드 = "+xhr.status);
		}
	})
}
</script>

