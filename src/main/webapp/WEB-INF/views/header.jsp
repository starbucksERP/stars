<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header">
	
	<div class="nav">
		<a href="#none" class="logo"><!-- <img src="" alt=""> --></a>
		<div class="nav-right-list">
			<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/login';"><i class="fas fa-book-reader"></i>&nbsp;관리자</a>
			<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/join';"><i class="fas fa-address-card"></i>&nbsp;회원가입</a>
			<a class="nav-item" onClick="location.href='${pageContext.request.contextPath}/view';"><i class="fas fa-list-alt"></i>&nbsp;회원관리</a>
			<%-- <a class="nav-item"><i class="fas fa-pen-alt"></i>&nbsp;블랑카</a> --%>
		</div>
		<ul class="nav-left-list">
			<li class="nav-item">지점관리<br /><span class="tri">▲</span></li>
			<li class="nav-item">재고관리<br /><span class="tri">▲</span></li>
			<li class="nav-item" style="width: 160px; padding: 0px;">발주/구매관리<br /><span class="tri">▲</span></li>
			<li class="nav-item" style="width: 160px; padding: 0px;">[지점] 발주/구매관리<br /><span class="tri">▲</span></li>
			<li class="nav-item">배송관리<br /><span class="tri">▲</span></li>
			<li class="nav-item">회계관리<br /><span class="tri">▲</span></li>
			<li class="nav-item" style="width: 160px; padding: 0px;">[지점] 회계관리<br /><span class="tri">▲</span></li>
		</ul>
	</div>
	
	<div class="drop-list">
		<!-- 관리자 용 -->
		<ul class="drop-menu">
			<li onclick="location.href='${pageContext.request.contextPath}/store/storeEnroll'">지점 등록</li>
			<li onclick="location.href='${pageContext.request.contextPath}/store/storeSta'">지점 현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/store/storeStaff'">점주 정보</li>
		</ul>
		<!-- 관리자용 재고 -->
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='${pageContext.request.contextPath}/item/product'">품목현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/item/itemList'">재고현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_list'">판매조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_record'">판매등록</li>
		</ul>
		<!-- 지점용 재고 -->
		<%-- <ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='${pageContext.request.contextPath}/item/productList'">품목현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/item/itemList'">재고현황</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_list'">판매조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/storeItem/sale_record'">판매등록</li>
		</ul> --%>
		<!-- 관리자용 발주 -->
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='${pageContext.request.contextPath}/order/orderRequestList'">발주요청조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/order/orderStateList'">발주현황조회</li>
			<li onclick="location.href='${pageContext.request.contextPath}/purchase/purchasePlan'">구매계획</li>
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
			<!-- 나중에 수정 -->
			<li onclick="location.href='${pageContext.request.contextPath}/delivery/deliveryList'">배송조회사본</li>
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
		
</div>