<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style type="text/css">
.a-button{
	border-radius: 0px !important;
}
</style>
<div class="row" style="margin-left: 6%;">
	<div class="main">
		<div style="font-size: 3em;" class="center">회원관리 - 리스트</div>
		<br />
		<hr />
		<table class="table">
	  		<tbody>
		  	<tr>
		  		<th>회원아이디</th>
		  		<th>회원이름</th>
		  		<th>회원주소</th>
		  		<th>회원전화번호</th>
		  		<th>회원이메일</th>
		  		<th>가입날짜</th>
		  		<th>지점코드</th>
		  	</tr>

			<c:forEach var="hewon" items="${hewonList}">
		  	<tr>
		  		<td>${hewon.hewonId}</td>
		  		<td>
		  			<a href="${pageContext.request.contextPath }/hewon/view?hewonId=${hewon.hewonId}" class="user">
						${hewon.hewonName}
					</a>
				</td>
		  		<td>${hewon.hewonAddress}</td>
		  		<td>${hewon.hewonPhone}</td>
		  		<td>${hewon.hewonEmail}</td>
		  		<td>${hewon.hewonJoinDate}</td>
		  		<td>${hewon.hewonStId}</td>
		  	</tr>
		  	</c:forEach>
		  	</tbody>
	  	</table>
	  	<div class="center">
	  		<c:if test="${loginHewon.hewonGrade=='9' }">
			<button type="button" class="a-button big sea" onclick="location.href='${pageContext.request.contextPath }/hewon/join';">회원등록</button>&nbsp;&nbsp;
			</c:if>
			<button type="button" class="a-button big red" onclick="location.href='${pageContext.request.contextPath }/hewon/logout';">로그아웃</button>
	  	</div>
				
	</div>
</div>
	  
	  	

					

