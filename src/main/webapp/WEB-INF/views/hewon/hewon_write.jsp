﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 입력받기 위한 JSP 문서 --%>
<%-- => [회원등록]을 클릭한 경우 회원정보 저장 처리페이지(/hewon/join) 요청(POST) --%>
<%-- => [로그인]을 클릭한 경우 로그인정보 입력페이지(/hewon/login) 요청 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Spring</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript">
function hewonCreate() {
	if ( f.hewonId.value == "" ) {
		alert("아이디를 입력하십시요.");
		f.hewonId.focus();
		return;
	} 
	if ( f.hewonPassword.value == "" ) {
		alert("비밀번호를 입력하십시요.");
		f.hewonPassword.focus();
		return;
	}
	if ( f.hewonName.value == "" ) {
		alert("이름을 입력하십시요.");
		f.hewonName.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/join";
	f.submit();
}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table width=780 border=0 cellpadding=0 cellspacing=0>
	<tr>
	  <td width="20"></td>
	  <td style="color: red;">${message }</td>			
	</tr>

	<tr>
	  <td width="20"></td>
	  <td>
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원관리 - 회원등록</b></td>
		  </tr>
	  </table>  
	  <br>
	  
	  <form name="f" method="post">
	  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10px;">
				<input type="text" style="width:150" name="hewonId" value="${hewon.hewonId }">
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10px;">
				<input type="password" style="width:150" name="hewonPassword" value="${hewon.hewonPassword }">
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10px;">
				<input type="text" style="width:240" name="hewonName" value="${hewon.hewonName }">
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">이메일</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10px;">
				<input type="text" style="width:240" name="hewonEmail" value="${hewon.hewonEmail }">
			</td>
		  </tr>		  
	  </table>
	  </form>
	  <br>
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td align=center>
				<input type="button" value="회원등록" onClick="hewonCreate();">
				<input type="button" value="로그인" onClick="location.href='${pageContext.request.contextPath}/login';">
			</td>
		  </tr>
	  </table>
	  </td>
	</tr>
</table>  
</body>
</html>