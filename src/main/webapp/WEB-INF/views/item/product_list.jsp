<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
#insertProductDiv {
	width: 600px;
	height: 600px;
	border: 3px solid darkgray;
	background-color: white;
	position: absolute;
	top: 30%;
	left: 30%;
	margin-top: -40px;
	margin-left: -100px;
	padding: 5px;
	z-index: 100;
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
						<a href="${pageContext.request.contextPath}/item/productList">품목현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/item/itemList">재고현황</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">판매관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/storeItem/sale_list">판매조회</a><br /><br />
						<a href="${pageContext.request.contextPath}/storeItem/sale_record">판매등록</a>
					</div>
				</li>
			</ul>
		</div>
		
		<!--  품목 신규등록 -->
		<div id="insertProductDiv">
			<div class="main">
			<h3>품목등록</h3>
			<hr />
				<table class="table">
					<thead>
						<tr>
							<th width="30%">품목그룹1</th>
							<td width="70%"><input type="search" id="itemNum1"  class="insert">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th width="30%">품목그룹2</th>
							<td width="70%"><input type="search" id="itemNum2" class="insert">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th>품목명</th>
							<td><input type="search" id="itemName" class="insert" /></td>
						</tr>
						<tr>
							<th>입고단가</th>
							<td><input type="search" id="itemPprice" class="insert"/></td>
						</tr>
						<tr>
							<th>출고단가</th>
							<td><input type="search" id="itemSprice" class="insert"/></td>
						</tr>
						<tr>
							<th>거래처</th>
							<td><input type="search" id="itemVendor" class="insert">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="button" class="a-button medium green" id="productInsertBtn">저장</button>
								<button type="reset" class="a-button medium red" id="resetinserttBtn" >초기화</button>
								<button type="button" class="a-button medium black" id="cancelInsertBtn">닫기</button>
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		
		<div class="main">
		
			<h3>품목 현황</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>품목코드</th>
						<td><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
					</tr>
					<tr>
						<th>품목명</th>
						<td><input type="search" /></td>
					</tr>
					<tr>
						<th>품목 구분</th>
						<td>
							<label class="gLabel"><input type="radio" class="fChk" >전체</label>&nbsp;&nbsp;|
							<label class="gLabel"><input type="radio" class="fChk" >원재료</label>
							<label class="gLabel"><input type="radio" class="fChk" >부재료</label>
							<label class="gLabel"><input type="radio" class="fChk" >비품</label>
							<label class="gLabel"><input type="radio" class="fChk" >푸드</label>
							<label class="gLabel"><input type="radio" class="fChk" >MD상품</label>
						</td>
					</tr>
				</thead>
			</table>
			
			<div class="right">
				<button type="button" class="a-button brown big" id="enrollBtn"><i class="fas fa-plus-circle"></i>&nbsp;품목 등록</button>
				<!-- <button type="button" class="a-button purple medium"><i class="fas fa-edit"></i>&nbsp;품목 수정</button>
				<button type="button" class="a-button red medium"><i class="fas fa-times"></i>&nbsp;품목 삭제</button> -->
			</div>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>품목코드</th>
							<th>폼목명</th>
							<th>단위</th>
							<th>단가</th>
							<th>품목 구분</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>A</td>
							<td>A001</td>
							<td>원두 - 블랙 퍼스트 마일</td>
							<td>1.5kg</td>
							<td>5,000</td>
							<td>[원재료]</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>

<script type="text/javascript">
	$("#enrollBtn").click(function() {
		$(".update").val("");    
		$("#updateDiv").hide(); 
		$("#insertProductDiv").show(300);  
	});
	
	$("#productInsertBtn").click(function() {
		var itemNum=$("#itemNum1").val()+$("#itemNum2").val();
		var itemName=$("#itemName").val();
		var itemPprice=$("#itemPprice").val();
		var itemSprice=$("#itemSprice").val();
		var itemVendor=$("#itemVendor").val();
		
		// 유효성검사 : 추후추가 및 모달박스로 변경
		if(itemNum1=="" || itemNum2=="") {
			alert("품목그룹을 모두 입력해주세요");
			return;
		} 
		
		if(itemName=="") {
			alert("품목명을 입력해주세요");
			return;
		}
		
		if(itemPprice=="") {
			alert("매입단가를 입력해 주세요.");
			return;
		}
		if(itemSprice=="") {
			alert("공급단가를 입력해 주세요.");
			return;
		}
		if(itemVendor=="") {
			alert("거래처를 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "productEnroll",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"itemNum":itemNum,"itemName":itemName,"itemPprice":itemPprice,"itemSprice":itemSprice,"itemVendor":itemVendor}),
			dataType: "text", 
			success: function(text) {
				if(text=="success") {
					$(".insert").val("");      
					$("#insertProductDiv").hide(300); 
				}
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	});
	
	$("#resetinserttBtn").click(function() {
		$(".insert").val("");      
	});
	
	$("#cancelInsertBtn").click(function() {
		$(".insert").val("");      
		$("#insertProductDiv").hide(300);  
	});

</script>

