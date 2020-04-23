<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- 모델에서 저장된 회원목록을 반환받아 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => [회원이름]을 클릭한 경우 회원정보 상세 출력페이지(/hewon/view) 요청 --%>
<%-- => [로그아웃]을 클릭한 경우 로그아웃 처리페이지(/hewon/logout) 요청 --%>
<%-- => [회원등록]을 클릭한 경우 회원정보 입력페이지(/hewon/join) 요청 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table width=780 border=0 cellpadding=0 cellspacing=0>
<tr>
	<td width="20"></td>
	<td>
	  	<table width=590 border=0 cellpadding=0 cellspacing=0>
		  	<tr>
				<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원관리 - 리스트</b></td>
		  	</tr>
	  	</table>  
	  	<br>
	  
	  	<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		  	<tr>
				<td width=190 align=center bgcolor="E6ECDE" height="22">아이디</td>
				<td width=200 align=center bgcolor="E6ECDE">이름</td>
				<td width=200 align=center bgcolor="E6ECDE">이메일</td>
		  	</tr>

			<c:forEach var="hewon" items="${hewonList}">
		  	<tr>
				<td width=190 align=center bgcolor="ffffff" height="20">
					${hewon.hewonId}
				</td>
				<td width=200 align=center bgcolor="ffffff">
					<a href="${pageContext.request.contextPath }/view?hewonId=${hewon.hewonId}" class="user">
						${hewon.hewonName}
					</a>
				</td>
				<td width=200 align=center bgcolor="ffffff">
					${hewon.hewonEmail}
				</td>
		  	</tr>
		  	</c:forEach>
	  	</table>

		<br>
	  	<table border="0" cellpadding="0" cellspacing="1" width="590">
			<tr>
				<td align="right">
					<c:if test="${loginHewon.hewonGrade=='9' }">
						<input type="button" value="회원등록" onclick="location.href='${pageContext.request.contextPath }/join';"/>
					</c:if>
					<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/logout';"/>
				</td>
			</tr>
		</table>		
	</td>
</tr>
</table>  
</body>
</html>