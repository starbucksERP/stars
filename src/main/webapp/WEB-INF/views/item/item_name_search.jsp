<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>item_name_search</title>
<link href="../css.css?after" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/76211070e2.js"></script>
</head>
<body>
<!-- 1200*600 -->
<div class="container">
	<div class="row">
		<div class="main">
			<h3>품목명 검색</h3>
			<br />
			<div>
				<label>
					<span>품목명 :</span><input type="text" />
				</label>&nbsp;
				<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
			</div>
			<hr />
			<table class="table">
				<tbody>
					<tr>
						<th><input type="checkbox" class="allChk"></th>
						<th>품목 코드</th>
						<th>품목명</th>
					</tr>
					<tr>
						<td><input type="checkbox" class="rowChk"></td>
						<td>A001</td>
						<td>원두 - 블랙 퍼스트 마일드</td>
					</tr>
				</tbody>
			</table>
			<div class="center">
				<button type="button" class="a-button medium">저장</button>&nbsp;
				<button type="button" class="a-button medium black">닫기</button>
			</div>
		</div>
	</div>
</div>	

</body>
</html>