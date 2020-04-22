<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn" style="background-color: #2C2A29;" onclick="location.href='${pageContext.request.contextPath }/deliveryReq'">배송요청조회</button>
					</li>
					<li>
						<button class="dropdown-btn" style="background-color: #669900;" onclick="location.href='${pageContext.request.contextPath }/deliveryList'" >배송조회</button>
					</li>
					
				</ul>
			</div>

			<div class="main">
			
				<h3>배송조회</h3>
				<div class="right"><button type="button" class="a-button big" onclick="delReadySearch()">상세 검색</button><button type="button" class="a-button big" onclick="delReadySearchReset()">검색 초기화</button></div>
				<hr />
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<th>요청번호</th>
								<td colspan="1"><input type="search" class="delReadyInput" id="requestNumInput"/>&nbsp;<a href="${pageContext.request.contextPath }/delivery/choice_store_code.jsp" onClick="window.open(this.href, '', 'width=400, height=430'); return false;" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								<th>매장코드</th>
								<td colspan="1"><input type="search" class="delReadyInput" id="storeIdInput"/>&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							</tr>
							<tr>
								<th>배송 시작일</th>
								<td colspan="1">
									<label class="gLabel"><input type="date" class="delReadyInput" id="delStartInput1"/>&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="date" class="delReadyInput" id="delStartInput2" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
								
								<th>배송 완료일</th>
								<td colspan="1">
									<label class="gLabel"><input type="date" class="delReadyInput" id="delEndInput1" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="date" class="delReadyInput" id="delEndInput2" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
							</tr>
							<tr>
								<th>배송처리 현황</th>
								<td colspan="3">
									<select id="delReadyCategory">
										<option value="10">배송처리 현황 선택</option>
										<option value="50">1. 배송 준비중</option>
										<option value="60">2. 배송중</option>
										<option value="70">3. 배송완료</option>
									</select>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				
				<br />
				<br />
				<div class="right">
					<button type="button" class="a-button big black" id="chk" style="float: left;">전체 선택 / 해제</button>
					<button type="button" class="a-button big" id="deliveryStartBtn">배송 시작</button>
				</div>
				<br />
				<br />
				<hr >
				
				<div class="information" id="delReadyDisplay">
					<%-- <table class="table">
						<tbody>
						
							<tr>
								<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
								<th>번호</th>
								<th>요청번호</th>
								<th>매장코드</th>
								<th>배송처리현황</th>
								<th>배송 시작일</th>
								<th>배송 종료일</th>
							</tr>
							<tr>
							<c:choose>
								<c:when test="${empty(deliveryReadyList) }">
									<tr align="center">
										<td colspan="7">검색된 배송요청이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="deliveryReady" items="${deliveryReadyList }">
									<tr>
										<td><input type="checkbox" class="rowChk"  value="${deliveryReady.deliverySeq }"></td>
										<td>${deliveryReady.deliverySeq }</td>				
										<!-- 팝업창 뜨는거 만들어야 함  -->
										<td>${deliveryReady.requestNum }</td>				
										<td>${deliveryReady.storeId }</td>
										<td>${deliveryReady.deliveryState }</td>
										<td>${deliveryReady.deliveryStart }</td>
										<td>${deliveryReady.deliveryEnd }</td>
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
						</tbody>
					</table> --%>
				</div>
			</div>
		</div>
	</div>
	
<script id="delReadyListEmpty" type="text/x-handlebars-template">
<table class="table">
	<tbody>
		<tr>
		<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
		<th>번호</th>
		<th>요청번호</th>
		<th>매장코드</th>
		<th>배송처리현황</th>
		<th>배송 시작일</th>
		<th>배송 종료일</th>
		</tr>
		<tr>
			<tr align="center">
    		<td colspan="7">검색된 배송기록이 없습니다.</td>		
		</tr>
	</tbody>
</table>
</script>

<script id="delReadyList" type="text/x-handlebars-template">
<table class="table">
	<tbody>
		<tr>
		<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
		<th>번호</th>
		<th>요청번호</th>
		<th>매장코드</th>
		<th>배송처리현황</th>
		<th>배송 시작일</th>
		<th>배송 종료일</th>
		</tr>
		{{#each.}}
			<tr>
				<td><input type="checkbox" class="rowChk"  value="{{deliverySeq }}"></td>
				<td>{{deliverySeq }}</td>
				<td>{{requestNum }}</td>				
				<td>{{storeId }}</td>
				<td>{{deliveryState }}</td>	
				<td>{{deliveryStart }}</td>	
				<td>{{deliveryEnd }}</td>	
			</tr>
		{{/each}}
	</tbody>
</table>
</script>
	
<script type="text/javascript">

delReadyDisplay();

// 배송현황조회 페이지 기본 테이블 출력 메소드 
function delReadyDisplay() {
	$.ajax({
		type: "GET",
		 url: "deliveryReadyList",
		 dataType: "json",
		 success: function(json) {
			 if(json.deliveryReadyList.length==0) {
				 var source=$("#delReadyListEmpty").html();
				 var template=Handlebars.compile(source);
				 $("#delReadyDisplay").html(template(json.deliveryReadyList));
				 return;
			 }
				 var source=$("#delReadyList").html();
				 var template=Handlebars.compile(source);
				 $("#delReadyDisplay").html(template(json.deliveryReadyList));
		 },
		 
		 error: function(xhr) {
			 alert("에러코드 = "+xhr.status);
		 }
	});
	
};

function delReadySearch() {
	var deliverySearch;
	
		if($("#requestNumInput").val()==''&& $("#storeIdInput").val()==''&&
			$("#delStartInput1").val()=='' && $("#delStartInput2").val()==''
			&& $("#delEndInput1").val()=='' && $("#delEndInput2").val()==''
			&& $("#delReadyCategory").val()=='') {
			
			alert("입력된 검색어가 없습니다.");
			return;
			
		} else {
			
			deliverySearch={
					requestNum:$("#requestNumInput").val(),
					deliveryState:$("#delReadyCategory").val(),
					storeId:$("#storeIdInput").val(), 
					deliveryStart:$("#delStartInput1").val(),
					deliveryStartTwo:$("#delStartInput2").val(),
					deliveryEnd:$("#delEndInput1").val(),
					deliveryEndTwo:$("#delEndInput2").val()
			}
		}
	
	 $.ajax({
		type: "POST",
		url: "deliveryReadySearch",  
		headers: {"content-type":"application/json"},
		data: JSON.stringify(deliverySearch),
		dataType:"json",
		success: function(json) {
			if(json.readySearchList.length==0) {
				 var source=$("#delReadyListEmpty").html();
				 var template=Handlebars.compile(source);
				 $("#delReadyDisplay").html(template(json.readySearchList));
				 return;
			 }
				 var source=$("#delReadyList").html();
				 var template=Handlebars.compile(source);
				 $("#delReadyDisplay").html(template(json.readySearchList));
		 },
		 
		 error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				 
	          }
	}); 
};

function delReadySearchReset() {
	location.href="/star/deliveryList";
}



// 배송시작승인 처리하기 위한 함수 
$("#deliveryStartBtn").click(function() {
		
		
		if($(".rowChk:checked").length==0) {
			alert("배송승인: 배송정보를 선택해 주세요.");
		} else {
			
			var delivery =[];
			var rowChk = $(".rowChk:checked");
			
			rowChk.each(function(i) {
				var tr = rowChk.parent().parent().eq(i);
				var td = tr.children();
				
				var deliverySeq = td.eq(1).text();
				var deliveryState = td.eq(4).text();
				if(deliveryState == 60) {			
				alert(deliverySeq+"번의 배송은 이미 배송중 입니다.");
				} else{
				delivery.push(deliverySeq);					
				}
			});
			
			if(delivery.length!=0) {
				var param={"list":delivery};
			 	 $.ajax({
					type: "POST",
					url: "deliveryStart",
					data: param,
					dateType: "text",
					success: function(text) {
							alert(delivery + "번 배송 = 출하승인 완료");
							location.href="/star/deliveryList";
					},
					error:function(request,status,error){
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			          }
				});  
			} else {
				alert("처리할 배송정보가 없습니다.");
				location.href="/star/deliveryList"
				return;
			}
			
		
		}
	});
			
			

</script>





			
	
	
	
	
	
	
	
	
	
	
	
	
	
	