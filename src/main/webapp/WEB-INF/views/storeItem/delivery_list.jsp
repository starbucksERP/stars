<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
		               <button class="dropdown-btn">발주관리<i class="fa fa-caret-down"></i></button>
		               <div class="dropdown-container">
		                  <a href="${pageContext.request.contextPath}/sic/storeOrderRequestList">발주요청조회</a><br /><br />
		                  <a href="${pageContext.request.contextPath}/sic/storeOrderStateList">발주현황조회</a><br /><br />
		                  <a href="${pageContext.request.contextPath}/sic/storeOrderInput">발주입력</a>
		               </div>
		            </li>
		            <li>
		               <button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
		               <div class="dropdown-container">
		                  <a href="${pageContext.request.contextPath}/delivery/deliveryList">배송조회</a>
		               </div>
	          	  </li>
				
				</ul>
			</div>

			<div class="main">
			
				<h3>배송조회</h3>
				<div class="right"><button type="button" class="a-button big sea" onclick="delReadySearch()">상세 검색</button>
				&nbsp;&nbsp;<button type="button" class="a-button big darkgreen" onclick="location.href='${pageContext.request.contextPath }/delivery/deliveryList'">검색 초기화</button></div>
				<hr />
				<div class="information">
				<form action="deliveryList" id="delReadySearchForm" method="post">
					<table class="table">
						<thead>
							<tr>
								<th>요청번호</th>
								<td colspan="1"><input type="search" name="requestNum" id="requestNumInput" value=""/>&nbsp;<a href="${pageContext.request.contextPath }/delivery/choice_store_code.jsp" onClick="window.open(this.href, '', 'width=400, height=430'); return false;" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								<th>매장코드</th>
								<td colspan="1"><input type="search" name="storeId" id="storeIdInput" value="${loginHewon.hewonStId} " readonly="readonly"/>&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							</tr>
							<tr>
								<th>배송 시작일</th>
								<td colspan="1">
									<label class="gLabel"><input type="search" name="deliveryStart" id="delStartInput1" value=""/>&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="search" name="deliveryStartTwo"  id="delStartInput2" value="" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
								<th>배송 완료일</th>
								<td colspan="1">
									<label class="gLabel"><input type="search" name="deliveryEnd" id="delEndInput1" value="" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="search" name="deliveryEndTwo" id="delEndInput2" value="" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td> 
							</tr>
							<tr>
								<th>배송처리 현황</th>
								<td colspan="3">
									<select name="deliveryState" id="delReadyCategory">
										<option value="0">배송처리 현황 선택</option>
										<option value="50">1. 배송 준비중</option>
										<option value="60">2. 배송중</option>
										<option value="70">3. 배송완료</option>
									</select>
								</td>
							</tr>
						</thead>
					</table>
				</form>
				</div>
				
				<br />
				<br />
				<hr >
				
				<div class="information" id="delReadyDisplay">
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
								<th>번호</th>
								<th>요청번호</th>
								<th>매장코드</th>
								<th>배송처리현황</th>
								<th>배송 요청일</th>
								<th>배송 종료일</th>
							</tr>
							<tr>
							<c:choose>
								<c:when test="${empty(delReadyList) }">
									<tr align="center">
										<td colspan="7">검색된 배송요청이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="delReadyList" items="${delReadyList }">
									<tr>
										<td><input type="checkbox" class="rowChk"  value="${delReadyList.deliverySeq }"></td>
										<td>${delReadyList.deliverySeq }</td>				
										<!-- 팝업창 뜨는거 만들어야 함  -->
										<td>${delReadyList.requestNum }</td>				
										<td>${delReadyList.storeId }</td>
										<c:choose>
										<c:when test="${delReadyList.deliveryState == 50}">
										<td class="red-font">배송 준비중</td>										
										</c:when>
										<c:when test="${delReadyList.deliveryState == 60}">
										<td class="blue-font">배송중</td>										
										</c:when>
										<c:when test="${delReadyList.deliveryState == 70}">
										<td style="color:green">배송 완료</td>										
										</c:when>
										</c:choose >
										<c:set var="startDate" value="${delReadyList.deliveryStart}"/>
										<c:set var="endDate" value="${delReadyList.deliveryEnd}"/>
										<td>${fn:substring(startDate,0,10) }</td>
										<td>${fn:substring(endDate,0,10) }</td>
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

$(function(){

    $("#delStartInput1").datepicker();
    $("#delStartInput2").datepicker();
    $("#delEndInput1").datepicker();
    $("#delEndInput2").datepicker();
    
	$.datepicker.setDefaults({
	    dateFormat: 'y/mm/dd' 
	});


});


function delReadySearch() {

	$("#delReadySearchForm").submit(); 
	
};


			

</script>


			
	
	
	
	
	
	
	
	
	
	
	
	
	
	