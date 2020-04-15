<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		
			<h3>발주현황조회</h3>
			<form:form action="storeOrderSta" method="post" id="form" modelAttribute="storeOrderSta">
				<div class="right"><button type="submit" class="a-button big">검색</button></div>
				<hr />
				<div class="information">
						<table class="table">
							<thead>
								<tr>
									<th>발주일</th>
									<td><label class="gLabel"><input type="text" name="historyDate1" class="datepicker" readonly="readonly" value="${storeOrderSta.historyDate1}"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
									&nbsp;-&nbsp;<label class="gLabel"><input type="text" name="historyDate2"  class="datepicker" readonly="readonly" value="${storeOrderSta.historyDate2}"/>&nbsp;<i class="far fa-calendar-alt"></i></label></td>
									<th>발주번호</th>
									<td><form:input path="historySeq"/></td>
								</tr>
								<tr>
									<th>품목</th>
									<td colspan="3"><form:input path="itemName" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								</tr>
								<tr>
									<th>진행상태</th>
									<td>
										<form:checkboxes items="${itemStateList}" path="itemState" class="fChk"/>
									</td>
									<th>가격 범위</th>
									<td><form:input path="itemQty1"/>&nbsp;-&nbsp;<form:input path="itemQty2"/></td>
								</tr>
							</thead>
						</table>
				</div>
			</form:form>
		
			<div class="right" style="float: right;">
				<ul class="order-sta">
					<li class="blackgray">전체</li>
					<li >발주진행</li>
					<li >완료</li>
				</ul>
			</div>
			<br />
			<hr style="margin-top: 14px;" />
			<br />
			<div class="date-output right"><c:choose><c:when test="${empty(storeOrderSta.historyDate1)}"></c:when><c:otherwise>${storeOrderSta.historyDate1}&nbsp;~&nbsp;${storeOrderSta.historyDate2}</c:otherwise></c:choose></div>
			<br />
			<div>
					<button type="button" class="a-button padding-button">입고확인</button>&nbsp;<button type="button" class="a-button padding-button red">취소요청</button>
			</div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>발주일자</th>
							<th>발주번호</th>
							<th>품목</th>
							<th>총 수량</th>
							<th>총 금액</th>
							<th>진행상태</th>
							<th>요청</th>
						</tr>
						<c:choose>
							<c:when test="${empty(storeOrderStaList) }">
								<tr align="center">
									<td colspan="8">검색된 발주정보가 없습니다.</td>		
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="sih" items="${storeOrderStaList }">
								<tr>
									<td><input type="checkbox" class="rowChk"></td>
									<td>${fn:substring(sih.historyDate,0,10)}</td>				
									<td>${sih.storeHistorySeq }</td>				
									<td>${sih.itemName }</td>
									<td>${sih.itemQty }</td>
									<td>${sih.itemQty }</td>		
									<c:choose>
										<c:when test="${sih.itemState==20}">
											<td class="green-font">발주완료</td>
										</c:when>
										<c:when test="${sih.itemState==60}">
											<td class="green-font">배송중</td>
										</c:when>
										<c:when test="${sih.itemState==70}">
											<td class="green-font">입고완료</td>
										</c:when>
										<c:otherwise>
											<td class="green-font">발주요청</td>
										</c:otherwise>
									</c:choose>
									<td><button type="button" class="a-button blackgray inner-button">취소</button> </td>	
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
				
		</div>

	</div>
</div>

<script type="text/javascript">
$(".order-sta>li").click(function() {
})

</script>
	