<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header">
	
	<div class="nav">
		<a href="#none" class="logo"><!-- <img src="" alt=""> --></a>
		<div class="nav-right-list">
			<a class="nav-item"><i class="fas fa-book-reader"></i>&nbsp;관리자</a>
			<a class="nav-item"><i class="fas fa-address-card"></i>&nbsp;회원가입</a>
			<a class="nav-item"><i class="fas fa-list-alt"></i>&nbsp;회원관리</a>
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
		<ul class="drop-menu">
			<li onclick="location.href='storeEnroll'">지점 등록</li>
			<li onclick="location.href='storeSta'">지점 현황</li>
			<li onclick="location.href='storeInfo'">지점 정보</li>
			<li onclick="location.href='storeStaff'">점주 정보</li>
		</ul>
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='productList'">품목현황</li>
			<li onclick="location.href='itemList'">재고현황</li>
			<li onclick="location.href='sale_record'">판매등록</li>
			<li onclick="location.href='sale_list'">판매조회</li>
		</ul>
		<ul class="drop-menu" style="padding-left: 5%">
			<li onclick="location.href='orderReq'">발주요청조회</li>
			<li onclick="location.href='orderList'">발주현황조회</li>
			<li onclick="location.href='purchasePlan'">구매계획</li>
			<li onclick="location.href='purchaselist'">구매현황</li>
			<li onclick="location.href='purchaseAdd'">구매입력</li>
			<li onclick="location.href='history'">입출하조회</li>
		</ul>		
		<ul class="drop-menu" style="padding-left: 15%">
			<li onclick="location.href='storeOrderInput'">발주입력</li>
			<li onclick="location.href='storeOrderReq'">발주요청조회</li>
			<li onclick="location.href='storeOrderSta'">발주현황조회</li>
			<li onclick="location.href='storeReceipt'">입출하조회</li>
		</ul>		
		<ul class="drop-menu" style="/* padding-left: 20% */padding-left:35%">
			<li onclick="location.href='deliveryReq'">배송요청조회</li>
			<li onclick="location.href='deliveryList'">배송조회</li>
		</ul>	
		<ul class="drop-menu" style="padding-left: 18%">
			<li onclick="location.href='accountPurchase'">매입 현황</li>
			<li onclick="location.href='accountSales'">매출 현황</li>
			<li onclick="location.href='accountIncome'">손익 분석</li>
			<li onclick="location.href='purchaseMonth'">매입 월별현황</li>
			<li onclick="location.href='salesMonth'">매출 월별현황</li>
			<li onclick="location.href='incomeMonth'">월별 손익분석</li>
		</ul>
		<ul class="drop-menu" style="padding-left: 18%">
			<li onclick="location.href='st_accountPurchase'">매입 현황</li>
			<li onclick="location.href='st_accountSales'">매출 현황</li>
			<li onclick="location.href='st_accountIncome'">손익 분석</li>
		</ul>					
	</div>
		
</div>