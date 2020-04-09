<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delivery_sto_info</title>
<link href="../css.css?after" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/76211070e2.js"></script>
<style type="text/css">
label{
	display: block;
	padding: 10px;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="main">
			<h3>[배송지(매장)정보 확인]</h3>
			<hr />
			<fieldset>
				<legend>매장정보</legend>
				<label>
					<span>매장코드 : </span><input type="text" />
				</label>
				<label>
					<span>매장명 :</span><input type="text" />
				</label>
				<label>
					<span>점주 :</span><input type="text" />
				</label>
				<label>
					<span>매장주소 :</span><input type="text" />
				</label>
			</fieldset>
			<div class="center">
				<button type="button" class="a-button medium sea">닫기</button>
			</div>
		</div>
	</div>
</div>	

</body>
</html>