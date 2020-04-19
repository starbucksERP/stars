<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.choice { display: none; }
</style>
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
		
			<h3>구매계획설정</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-plus-circle"></i>&nbsp;신규 구매계획</button>&nbsp;<button type="button" class="a-button big">검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th width="10%">품목명</th>
						<td width="40%">
							<input type="search">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a>
						</td>
						<th width="10%">상품카테고리</th>
						<td width="40%">
						<select id="category" name="num1">
							<option>대분류</option>
							<option value="A">제조음료</option>
							<option value="B">푸드</option>
							<option value="C">상품</option>
						</select>
						<select id="categoryA" class="choice" name="num2">
							<option>제조음료 소분류</option>
							<option value="01">원두</option>
							<option value="02">티백</option>
							<option value="03">부재료</option>
						</select>
						<select id="categoryB" class="choice" name="num2">
							<option>푸드 소분류</option>
							<option value="01">베이커리</option>
							<option value="02">케이크</option>
							<option value="03">샌드위치</option>
							<option value="04">디저트</option>
							<option value="05">아이스크림</option>
							<option value="06">병음료</option>
						</select>
						<select id="categoryC" class="choice" name="num2">
							<option>상품 소분류</option>
							<option value="01">머그</option>
							<option value="02">글라스</option>
							<option value="03">텀블러</option>
							<option value="04">보온병</option>
							<option value="05">악세서리</option>
							<option value="06">커피용품</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>거래처명</th>
						<td>
							<input type="search">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a>
						</td>
						<th>최종수정자</th>
						<td>
							<input type="search" />
						</td>
					</tr>
				</thead>
			</table>
			
			<hr>
			<br />
			
			<div><button type="button" class="a-button green padding-button">일괄수정</button>&nbsp;<button type="button" class="a-button padding-button gray">초기화</button></div>
			<div class="information">
				<table class="table cal">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>거래처명</th>
							<th>분류</th>
							<th>상품명(코드)</th>
							<th>최소보유량</th>
							<th>허용(%)</th>
							<th>범위</th>
							<th>최종수정자</th>
							<th>수정</th>
							<th>초기화</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>STARBUCKSFARM</td>
							<td> 원두</td>
							<td>리저브_웨스트자바스몰랏인도네시아)</td>
							<td><input type="number" value="2000" class="min-own min-own0"></td>
							<td><input type="number" value="10" class="permit-div permit-div0">&nbsp;%</td>
							<td class="Scope Scope0"></td>
							<td>김대리</td>
							<td><button type="button" class="a-button green inner-button">수정</button></td>
							<td><button type="button" class="a-button gray inner-button">초기화</button></td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>STARBUCKSFARM</td>
							<td> 원두</td>
							<td>리저브_웨스트자바스몰랏인도네시아)</td>
							<td><input type="number" value="3000" class="min-own min-own1"></td>
							<td><input type="number" value="30" class="permit-div permit-div1">&nbsp;%</td>
							<td class="Scope Scope1"></td>
							<td>김대리</td>
							<td><button type="button" class="a-button green inner-button">수정</button></td>
							<td><button type="button" class="a-button gray inner-button">초기화</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>


<script type="text/javascript">
	 
	 // 재고 보유량 범위 계산 
	 var own=new Array();
	 var scope=new Array();
	 var sum=new Array();
	 
	 for(var i=0; i<2; i++){
		own.push($(".min-own"+i).val());
		scope.push(own[i]*parseFloat($(".permit-div"+i).val()/100));
		sum.push(Number(own[i])+Number(scope[i]));
		$(".Scope"+i).text(own[i]-scope[i]+" ~ "+sum[i]);
	 };
	 
	 
	 /* 
	 var own=parseFloat($(".min-own").val());
	 var scope=parseFloat(own*$(".permit-div").val()/100);
	 var scopArr=[own-scope, own+scope];
	 
	 
	 $(".Scope").text(scopArr[0]+" ~ "+scopArr[1]);
	 
	 $(function(){
		$(".min-own").keyup(function() {
			own=parseFloat($(".min-own").val());
			scope=parseFloat(own*$(".permit-div").val()/100);
			scopArr=[own-scope,own+scope];
			 $(".Scope").text(scopArr[0]+" ~ "+scopArr[1]);
		});
		$(".permit-div").keyup(function() {
			own=parseFloat($(".min-own").val());
			scope=parseFloat(own*$(".permit-div").val()/100);
			scopArr=[own-scope,own+scope];
			 $(".Scope").text(scopArr[0]+" ~ "+scopArr[1]);
		});
	});
	  */

	$('#category').change(function() {
		var category = jQuery('#category option:selected').val();
		if (category== 'A') {
			$('.choice').hide();
			$('#categoryA').show();
		} else if (category=='B') {
			$('.choice').hide();
			$('#categoryB').show();
		} else if (category=='C') {
			$('.choice').hide();
			$('#categoryC').show();
		} else {
			$('.choice').hide();
		} 
	});
	
</script>
