<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">발주요청조회</a><br /><br />
						<a href="">발주요청조회</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">구매<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">구매계획</a><br /><br />
						<a href="">구매현황</a><br /><br />
						<a href="">구매입력</a>
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
		
			<h3>구매입력</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-plus-circle"></i>&nbsp;신규 구매</button>&nbsp;<button type="button" class="a-button big">검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>구매요청일</th>
						<td><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
						&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
						<th>거래처</th>
						<td><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
					</tr>
					<tr>
						<th>최종수정자</th>
						<td>
							<input type="search" />
						</td>
						<th>입고창고</th>
						<td><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
					</tr>
				</thead>
			</table>
			
			<hr>
			<br />
			
			<div><button type="button" class="a-button padding-button">항목추가</button>&nbsp;<button type="button" class="a-button padding-button red">항목삭제</button></div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>품목코드</th>
							<th>품목</th>
							<th>수량</th>
							<th>단가</th>
							<th>총액</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>1</td>
							<td>COF_IND283120</td>
							<td>리저브_웨스트자바스몰랏인도네시아</td>
							<td><input type="text" value="200" id="qty" class="number"></td>
							<td><span id="price">39000</span></td>
							<td><span id="total"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="center"><button type="button" class="a-button big">저장</button>&nbsp;&nbsp;<button type="button" class="a-button big" >다시작성</button></div>
			
		
		</div>

	</div>
</div>


<script type="text/javascript">
	// number 가격 범위에 숫자만 입력
	$(".number").on("keyup", function() {
    	$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 총액 계산
	var qty=parseInt($("#qty").val());
	var price=parseInt($("#price").text());
	
	$("#total").text(qty*price);
	 
</script>
