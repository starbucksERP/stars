<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#content{
    position: relative;
    background-image: url("${pageContext.request.contextPath }/images/error.jpg"); 
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
	color: white; 
	padding: 50px;
	width: 100%;
	height: 80%;
}
</style>
<div class="content">
		<div class="row">
			<div class="main">
				<h1  style="font-size: 1.7em">에러페이지</h1>
				<br />
				<hr />
				<p class="message" style="font-size: 1.2em">프로그램 실행에 예기치 못한 오류가 발생 되었거나 비정상적인 방법으로 요청하여 오류가 발생 되었습니다.</p>
				<br />
				<br />
				<div class="right">
					<button type="button" class="a-button black big" onclick="location.href='${pageContext.request.contextPath}/hewon/login';">로그인 페이지 이동</button>	
				</div>
			</div>
		</div>
     </div>
<div class="img-cover"></div>





