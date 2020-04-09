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
				<label>
					<span>등록일자 : </span><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i>
				</label>
				<label>
					<span>품목코드 :</span><input type="text" />
				</label>
				<label>
					<span>품목명 :</span><input type="text" />
				</label>
				<label>
					<span>수량 :</span><input type="text" />
				</label>
				<label>
					<span>거래처 :</span><input type="text" />
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
</html>