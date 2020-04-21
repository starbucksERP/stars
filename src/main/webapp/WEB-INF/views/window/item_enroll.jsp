<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>item_enroll</title>
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
					<select class="category">
						<option>대분류</option>
						<option value="A">제조음료</option>
						<option value="B">푸드</option>
						<option value="C">상품</option>
					</select>
					<select class="subCategory" >
					</select>
					
				</label>
				<label>
					<span>품목명 :</span><select  class="itemName"></select>
				</label>
				<label>
					<span>수량 :</span><input type="text" name="itemQty"/> 개
				</label>
				<label>
					<span>매입단가 :</span><input type="text" name="itemSprice"/> 원
				</label>
				<label>
					<span>공급가 :</span><input type="text" name="itemPprice"/> 원
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