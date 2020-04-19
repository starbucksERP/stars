<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>item_enroll</title>
<link href="../css.css?after" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/76211070e2.js"></script>
</head>
<style type="text/css">
.choice { display: none; }
label {
	display: block;
	padding: 10px;
}
</style>
<body>
<div class="container">
	<div class="row">
		<div class="main">
			<h3>재고등록</h3>
			<hr />
			<fieldset>
			<%-- itemNum = num1+num2+SEQ  --%>
				<label>
					<span>카테고리 :</span>
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
				</label>
				<label>
					<span>품목명 :</span><input type="text" name="itemName"/>
				</label>
				<label>
					<span>수량 :</span><input type="text" name="itemQty"/> 개
				</label>
				<label>
					<span>매입단가 :</span><input type="text" name="itemSprice"/> 원
				</label>
				<label>
					<span>매출단가 :</span><input type="text" name="itemPprice"/> 원
				</label>
				<label>
					<span>거래처 :</span><input type="text" name="itemVendor" />
				</label>
				<label>
					<span>등록담당자 :</span><input type="text" name="itemDm" value="loginUser.getName출력" readonly="readonly"/>
				</label>
			</fieldset>
			<div class="center">
				<button type="button" class="a-button medium">저장</button>
				<button type="button" class="a-button medium purple">초기화</button>
				<button type="button" class="a-button medium black">닫기</button>
			</div>
		</div>
	</div>
</div>	
</body>
<script type="text/javascript">
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
</html>