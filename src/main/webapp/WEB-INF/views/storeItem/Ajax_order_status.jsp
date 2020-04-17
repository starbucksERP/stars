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
				<div class="right"><button type="button" class="a-button big" onclick="orderStatusDisplay()">검색</button></div>
				<hr />
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<th>발주일</th>
								<td><label class="gLabel"><input type="text" class="historyDate1 datepicker" readonly="readonly" value="${storeOrderSta.historyDate1}"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
								&nbsp;-&nbsp;<label class="gLabel"><input type="text" class="historyDate2 datepicker" readonly="readonly" value="${storeOrderSta.historyDate2}"/>&nbsp;<i class="far fa-calendar-alt"></i></label></td>
								<th>발주번호</th>
								<td><input type="text" class="historySeq"/></td>
							</tr>
							<tr>
								<th>품목</th>
								<td colspan="3"><input type="text" class="itemName" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							</tr>
							<tr>
								<th>진행상태</th>
								<td>
								asd
								</td>
								<th>가격 범위</th>
								<td><input type="number" class="itemQty1"/>&nbsp;-&nbsp;<input type="number" class="itemQty1"/></td>
							</tr>
						</thead>
					</table>
				</div>
		
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
			<div class="date-output right"></div>
			<br />
			<div>
				<button type="button" class="a-button padding-button">입고확인</button>&nbsp;<button type="button" class="a-button padding-button red">취소요청</button>
			</div>
			<div class="information" id="info">
			</div>
				
		</div>

	</div>
</div>

<script id="template" type="text/x-handlebars-template">
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
			{{#each .}}
			<tr>
				<td><input type="checkbox" class="rowChk"></td>
				<td>(historyDate,0,10)</td>				
				<td>{{storeHistorySeq }}</td>				
				<td>{{itemName }}</td>
				<td>{{itemQty }}</td>
				<td>{{itemQty }}</td>
				{{#if "itemState == '20'"}}<td>발주완료</td>{{/if}}
				<td><button type="button" class="a-button blackgray inner-button">취소</button> </td>	
			</tr>
			{{/each}}
			</tr>
		</tbody>
	</table>
</script>


<script type="text/javascript">

	orderStatusDisplay();
	
	function orderStatusDisplay(){
		
		var searchData={
			historyDate1	:	$(".historyDate1").val(),
			historyDate2	:	$(".historyDate2").val(),
			itemName		:	$(".itemName").val(),
			itemState		:	$(".itemState").val(),
			itemQty1		:	$(".itemQty1").val(),
			itemQty2		:	$(".itemQty2").val()
		};
		
		
		$.ajax({
			type: "GET",
			url: "storeOrderStaList",
			data: searchData,
			dataType:"json",
			success: function(json) {
				var source=$("#template").html();
				var template=Handlebars.compile(source);
				$("#info").html(template(json.sihList));
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		
		});
		
	};
	

</script>
	