<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn" style="background-color: #669900;" onclick="location.href='${pageContext.request.contextPath }/deliveryReq'">배송요청조회</button>
				</li>
				<li>
					<button class="dropdown-btn" style="background-color: #2C2A29;" onclick="location.href='${pageContext.request.contextPath }/deliveryList'">배송조회</button>
				</li>
				
			</ul>
		</div>

		<div class="main">
		
			<h3>배송요청조회</h3>
			<br />
			<div class="right">
				<button type="button" class="a-button black medium" id="chk" 
				style="float: left;">전체 선택 / 해제</button>
				<select name="delReqCategory" class="delReqCategory">
					<option value="">검색조건 선택</option>
					<option class="delSearchOpt" value="requestNum">1. 요청번호</option>
					<option class="delSearchOpt" value="storeId">2. 매장코드</option>
				</select>&nbsp;
				<input type="search" id="delReqSearchInput"/>&nbsp;
				<button type="button" class="a-button" style="padding: 3px 20px"  onclick="deliveryReqSearch()">검색</button>
				<button type="button" class="a-button" style="padding: 3px 20px" onclick="delReqSearchReset()">검색 초기화</button>
			</div>
			
			<br />
			<hr />
			<div class="information" id="displayDiv" >
			<%-- 	<table class="table">
					<tbody>
						<tr>
							<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>요청번호</th>
							<th>매장코드</th>
							<th>배송처리현황</th>
						</tr>
						<tr>
						<c:choose>
								<c:when test="${empty(deliveryReqList) }">
									<tr align="center">
										<td colspan="5">검색된 배송요청이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="deliveryReq" items="${deliveryReqList }">
									<tr>
										<td><input type="checkbox" class="rowChk"  value="${deliveryReq.deliverySeq }"></td>
										<td>${deliveryReq.deliverySeq }</td>				
										<!-- 팝업창 뜨는거 만들어야 함  -->
										<td>${deliveryReq.requestNum }</td>				
										<td>${deliveryReq.storeId }</td>
										<td>${deliveryReq.deliveryState }</td>
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				
				</table> --%>
				
			</div>
				<div class="right">
					<button type="button" class="a-button medium" onclick="requestConfirmation()" >요청확인처리</button>
				</div>
				
		
		</div>

	</div>
</div>

<script id="delReqListEmpty" type="text/x-handlebars-template">
<table class="table">
	<tbody>
		<tr>
			<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
			<th>번호</th>
			<th>요청번호</th>
			<th>매장코드</th>
			<th>배송처리현황</th>
		</tr>
		<tr>
			<tr align="center">
    		<td colspan="5">검색된 배송요청이 없습니다.</td>		
		</tr>
	</tbody>
</table>
</script>

<script id="delReqList" type="text/x-handlebars-template">
<table class="table">
	<tbody>
		<tr>
			<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
			<th>번호</th>
			<th>요청번호</th>
			<th>매장코드</th>
			<th>배송처리현황</th>
		</tr>
		{{#each.}}
			<tr>
				<td><input type="checkbox" class="rowChk"  value="{{deliverySeq }}"></td>
				<td>{{deliverySeq }}</td>
				<td>{{requestNum }}</td>				
				<td>{{storeId }}</td>
				<td>{{deliveryState }}</td>	
			</tr>
		{{/each}}
	</tbody>
</table>
</script>


<script type="text/javascript">

delReqDisplay();

function delReqDisplay() {
	$.ajax({
		type: "GET",
		 url: "deliveryReqList",
		 dataType: "json",
		 success: function(json) {
			 if(json.deliveryReqList.length==0) {
				 var source=$("#delReqListEmpty").html();
				 var template=Handlebars.compile(source);
				 $("#displayDiv").html(template(json.deliveryReqList));
				 return;
			 }
				 var source=$("#delReqList").html();
				 var template=Handlebars.compile(source);
				 $("#displayDiv").html(template(json.deliveryReqList));
		 },
		 
		 error: function(xhr) {
			 alert("에러코드 = "+xhr.status);
		 }
	});
	
};

function deliveryReqSearch(){
		
	var delivery;
	alert("조건검색 시작 ");	
	if($(".delReqCategory").val()=='requestNum') {
		alert("조건이 요청번호인 경우");	
		delivery={	
			requestNum:$("#delReqSearchInput").val()
		}
	}else if($(".delReqCategory").val()=='storeId') {
		alert("조건이 지점코드인 경우");	
		delivery={
			storeId:$("#delReqSearchInput").val()
		}
	} else {
		$(this).alert("검색조건 선택 안한 경우");		
		alert("검색 항목을 선택해 주세요.");
		location.href="/star/deliveryReq"
		return; 
	}
	
	$.ajax({
		type: "POST",
		url: "deliveryReqSearch", 
		headers: {"content-type":"application/json"},
		data: JSON.stringify(delivery),
		dataType:"json",
		success: function(json) {
			if(json.reqSearchList.length==0) {
				 var source=$("#delReqListEmpty").html();
				 var template=Handlebars.compile(source);
				 $("#displayDiv").html(template(json.reqSearchList));
				 return;
			 }
				 var source=$("#delReqList").html();
				 var template=Handlebars.compile(source);
				 $("#displayDiv").html(template(json.reqSearchList));
		 },
		 
		 error: function(xhr) {
			 alert("에러코드 = "+xhr.status);
		 }
	});
	
};

	


function delReqSearchReset() {
	location.href="/star/deliveryReq"
}


// 배송요청을 확인처리하기 위한 함수 
function requestConfirmation() {
		
		
		if($(".rowChk:checked").length==0) {
			alert("배송요청확인: 요청승인할 배송정보를 선택해 주세요.");
		} else { 
			
			var delivery =[];
			var rowChk = $(".rowChk:checked");
			
			rowChk.each(function(i) {
				var tr = rowChk.parent().parent().eq(i);
				var td = tr.children();
				
				var deliverySeq = td.eq(1).text();
				delivery.push(deliverySeq);
			});
			
			var param={"list":delivery};
			
			$.ajax({
				type: "POST",
				url: "delReqConfirm",
				data: param,
				dateType: "text",
				success: function(text) {
				alert(delivery +"번 배송 = 배송요청 승인")
						location.href="/star/deliveryReq"
					
				},
				error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 
		          }

			});
		
		}
	}
			
			

</script>





























