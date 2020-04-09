<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store_search</title>
<link href="../css.css?after" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/76211070e2.js"></script>
</head>
<body>
<!-- 1200*600 -->
<div class="container">
	<div class="row">
		<div class="main">
			<h3>[매장명 검색]</h3>
			<div>
				<span class="staff">매장명 :&nbsp;</span>
				<input type="search" />&nbsp;
				<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
			</div>
			<br />
			<hr />
			<table class="table">
				<tbody>
					<tr>
						<th><input type="checkbox" class="allChk"></th>
						<th>매장코드</th>
						<th>매장명</th>
					</tr>
					<tr>
						<td><input type="checkbox" class="rowChk"></td>
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

<script type="text/javascript">

//검색결과 체크박스 
$(".allChk").change(function() {
 	if($(this).is(":checked")){
 		$(".rowChk").prop("checked", true)
 	}else{
$(".rowChk").prop("checked", false)
 	}
 });
 
</script>
</body>
</html>