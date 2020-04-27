<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style type="text/css">
#content{
    position: relative;
    background-image: url("${pageContext.request.contextPath }/images/starbucks-4620637_1920.jpg"); 
    height: 90vh;
    background-size: cover;                                                              
}

.img-cover{
   position: absolute;
   height: 100%;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:1;
}

.content{
     position: absolute;
     top:50%;
     left:54%;
     transform: translate(-60%, -55%);                                                                   
     z-index: 2;
}


.main{
	z-index: 999; 
	background-color: rgba(0, 0, 0, 0.4);  
	color: white; 
	padding: 75px;
}

.a-button{
	border-radius: 0px !important;
}


</style>
<script type="text/javascript">
function hewonLogin() {
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
	
	f.action = "${pageContext.request.contextPath }/hewon/login";
	f.submit();
}
</script>
<div class="content">
		<div class="row">
			<div class="main">
				<div style="font-size: 3em;" class="center">회원관리 - 로그인</div>
				<br />
				<hr />
					<br />
						<c:choose>
						  <c:when test="${empty(loginHewon) }">
						  <form name="f" method="post">
							  <fieldset style="padding: 50px;">
									<legend>로그인</legend>
									<label>
										<span style="padding-left: 10px;">사용자 아이디 : </span><input type="text" style="width:150; margin-right: 30px;" name="hewonId" value="${hewonId }">
									</label>
									<br />
									<label>
										<span style="padding-left: 10px;">비밀번호 :</span><input type="password" style="width:150; height: 24px; margin-right: 30px;" name="hewonPassword">
									</label>
								</fieldset>
						  </form>
						  <br>
						 <div class="center"><button type="button" class="a-button big green"  onClick="hewonLogin();">&nbsp;로그인&nbsp;</button> </div>
						  </c:when>
						  
						  <c:otherwise>
						   <h1><span class="coral-font">${loginHewon.hewonName}&nbsp;<c:if test="${loginHewon.hewonGrade=='9'}">[관리자]</c:if></span>&nbsp;님 환영합니다.</h1>
					     <br />
						  <br />
						  <br />
						  <div class="center">
						  	<c:if test="${loginHewon.hewonGrade=='9'}">
								<button type="button" class="a-button big yellow" onclick="location.href='${pageContext.request.contextPath }/hewon/list';">회원목록</button>&nbsp;&nbsp;
								<button type="button" class="a-button big sea" onclick="location.href='${pageContext.request.contextPath }/hewon/join';">회원등록</button>&nbsp;&nbsp;
						  	</c:if>
							<button type="button" class="a-button big red" onclick="location.href='${pageContext.request.contextPath }/hewon/logout';">로그아웃</button>&nbsp;&nbsp;
						</div>
				  </c:otherwise>
				  </c:choose>
			</div>
		</div>
     </div>
<div class="img-cover"></div>









<%-- <body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
	<table width=780 border=0 cellpadding=0 cellspacing=0>
	<tr>
	  <td width="20"></td>
	  <td style="color: red;">${message }</td>			
	</tr>

	<tr>
	  <td width="20"></td>
	  <td>
  	  <!--contents-->
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원관리 - 로그인</b></td>
		  </tr>
	  </table>  
	  <br>
	  
	  <c:choose>
	  비로그인 사용자의 응답 처리
	  <c:when test="${empty(loginHewon) }">
	  <form name="f" method="post">
	  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">사용자 아이디</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10px;">
				<input type="text" style="width:150" name="hewonId" value="${hewonId }">
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
			<td width=490 bgcolor="ffffff" style="padding-left:10px;">
				<input type="password" style="width:150" name="hewonPassword">
			</td>
		  </tr>
	  </table>
	  </form>
	  <br>
	  
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td align=center>
				<input type="button" value="로그인" onClick="hewonLogin();"> &nbsp;
			</td>
		  </tr>
	  </table>
	  </c:when>
	  
	  로그인 사용자의 응답 처리
	  <c:otherwise>
	  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
	 	 <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">
				${loginHewon.hewonName}님 환영합니다.
			</td>
		 </tr>		
	  </table>
	  <br>
	  
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td align=center>
				<button type="button" onclick="location.href='${pageContext.request.contextPath }/list';">회원목록</button>
				<button type="button" onclick="location.href='${pageContext.request.contextPath }/logout';">로그아웃</button>
				<c:if test="${loginHewon.hewonGrade=='9'}">
					<button type="button" onclick="location.href='${pageContext.request.contextPath }/join';">회원등록</button>
				</c:if>
			</td>
		  </tr>
	  </table>
	  </c:otherwise>
	  </c:choose>
	  </td>
	</tr>
</table>   --%>

