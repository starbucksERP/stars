<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css.css?after" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/76211070e2.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="main">
			<br />
			<h3>[지점명 검색]</h3>
			<hr />
			<div>
				 <span>지점명</span>&nbsp;
				<input type="search" />&nbsp;
				<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
			</div>
			<table class="table">
				<tbody>
					<tr>
						<th ><input type="checkbox" class="allChk"></th>
						<th>요청번호</th>
						<th>매장코드</th>
						<th>매장명</th>
					</tr>
					<tr>
						<td><input type="checkbox" class="rowChk"></td>
						<td >req1234567</td>
						<td>021234567</td>
						<td>강남 1호점</td>
					</tr>
				</tbody>
			</table>
			<div class="center">
				<button type="button" class="a-button medium">저장</button>
				<button type="button" class="a-button medium sea">닫기</button>
			</div>
		</div>
	</div>
</div>	


</body>
</html>