<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">지점 등록<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">지점 현황<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">지점 정보<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">점주 정보<i class="fa fa-caret-down"></i></button>
				</li>
			</ul>
		</div>

		<div class="main">
			
			<form action="storeSta" id="storeStaForm" method="post">
				<h3>지점 현황</h3>
				<div class="right"><button type="button" class="a-button darkgreen big" onclick="startState()"><i class="fas fa-search"></i>&nbsp;검색</button></div>
				<hr />
				<table class="table">
					<thead>
						<tr>
							<th>지점명</th>
							<td><input type="search" name="storeName">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th>구분</th>
							<td>
								<label class="gLabel"><input type="checkbox" class="fChk" name="state" value="본점">본점</label>
								<label class="gLabel"><input type="checkbox" class="fChk" name="state" value="지점">지점</label>
								<label class="gLabel"><input type="checkbox" class="fChk" name="state" value="폐점">폐점</label>
								<input type="hidden" name="states"/>
							</td>
						</tr>
					</thead>
				</table>
			</form>
			
			<div class="right">
				<button type="button" class="a-button sea medium" onclick="location.href='${pageContext.request.contextPath}/storeEnroll'"><i class="fas fa-plus-circle"></i>&nbsp;지점 등록</button>
			</div>
			
			<br />
			<hr>
			<br />
			<div class="right">총 매장수 : ${fn:length(storeList) }&nbsp;&nbsp;</div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th >지점코드</th>
							<th >지점명</th>
							<th >지점주소</th>
							<th>점주명</th>
							<th >지점번호</th>
							<th >구분</th>
							<th >개업일</th>
							<th >폐업일</th>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${empty(storeList) }">
									<tr align="center">
										<td colspan="8">검색된 지점정보가 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="store" items="${storeList }">
									<tr>
										<td>${store.storeId }</td>				
										<td>${store.storeName }</td>				
										<td>${store.storeAddress }</td>
										<td>점주테이블</td>
										<td>${store.storePhone }</td>				
									<c:if test="${store.storeState==0 }">
										<td>본점</td>
									</c:if>
									<c:if test="${store.storeState==1 }">
										<td>지점</td>
									</c:if>
									<c:if test="${store.storeState==9 }">
										<td>폐점</td>
									</c:if>
										<td>${fn:substring(store.storeOpen,0,10)}</td>
									<c:choose>
										<c:when test="${!empty(store.storeClose)}">
											<td>${fn:substring(store.storeClose,0,10)}</td>				
										</c:when>
										<c:otherwise>
											<td>&nbsp;</td>
										</c:otherwise>
									</c:choose>
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function startState(){
		
		var states=[];
			
		 $(".fChk:checked").each(function(i) {
			 if($(this).val()=='본점'){
				 states.push(0);
			 }else if($(this).val()=='지점'){
				 states.push(1);
			 }else if($(this).val()=='폐점'){
				 states.push(9);
			 }
		 });
			 
		 if(states.length==0){
			 states.push(0);
			 states.push(1);
			 states.push(9);
		 }
		 
		 $("input[type='hidden']").val(states);
		 $("#storeStaForm").submit();
	}
</script>












