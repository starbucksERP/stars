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
     top:55%;
     left:54%;
     transform: translate(-60%, -55%);                                                                   
     z-index: 2;
}


.main{
	z-index: 999; 
	background: black; 
	color: white; 
	padding: 75px;
}

</style>

<script type="text/javascript">
function hewonRemove(hewonId) {
	if (confirm("정말로 삭제 하시겠습니까?") ) {
		location.href='${pageContext.request.contextPath }/hewon/remove?hewonId='+hewonId;
	}
}
</script>
<div class="content">
		<div class="row">
			<div class="main">
				<div style="font-size: 3em;" class="center">회원관리 - 상세정보</div>
				<br />
				<hr />
					  <fieldset style="padding: 50px;">
							<legend>${hewon.hewonName}(${hewon.hewonId}) 정보</legend>
							<label>
								<span style="padding-left: 10px;">번호:</span>${hewon.hewonPhone}
							</label>
							<br />
							<label>
								<span style="padding-left: 10px;">주소:</span>${hewon.hewonAddress}
							</label>
							<br />
							<label>
								<span style="padding-left: 10px;">이메일:</span>${hewon.hewonEmail}
							</label>
							<br />
							<label>
								<span style="padding-left: 10px;">지점 코드:</span>${hewon.hewonStId}
							</label>
							<br />
						</fieldset>
				  <br>
				  <div class="center">
					  <c:if test="${loginHewon.hewonGrade=='9' || loginHewon.hewonId==hewon.hewonId }">
							<button type="button" class="a-button big purple" onClick="location.href='${pageContext.request.contextPath }/hewon/modify?hewonId=${hewon.hewonId}';">수정</button>&nbsp;&nbsp;
						</c:if>
						<c:if test="${loginHewon.hewonGrade=='9' }">
							<button type="button" class="a-button big red" onClick="hewonRemove('${hewon.hewonId}');">삭제</button>&nbsp;&nbsp;
						</c:if>
						<button type="button" class="a-button big sea" onClick="location.href='${pageContext.request.contextPath }/hewon/list';">목록</button>
					</div>
			</div>
		</div>
     </div>
<div class="img-cover"></div>