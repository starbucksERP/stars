<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choice_store_code</title>
<link href="../css.css?after" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/76211070e2.js"></script>
</head>
<body>
<!-- 1200*600 -->
<div class="container">
	<div class="row">
		<div class="main">
			<h3>[매장코드 선택]</h3>
			<div>
				<select>
					<option value="">매장코드 / 매장명</option>
					<option value="">1. 원두원두원두원두</option>
					<option value="">2. 원두원두원두원두</option>
					<option value="">3. 원두원두원두원두</option>
				</select>&nbsp;
				<input type="search" />&nbsp;
				<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
			</div>
			<br />
			<hr />
			<table class="table">
				<tbody>
					<tr>
						<th>매장코드</th>
						<th>매장명</th>
					</tr>
					<tr>
						<td>021234567</td>
						<td>강남 1호점</td>
					</tr>
				</tbody>
			</table>
			<div class="center">
				<button type="button" class="a-button medium sea">닫기</button>
			</div>
		</div>
	</div>
</div>	
</body>
</html>