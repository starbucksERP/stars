<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn" style="background-color: #2C2A29;" onclick="location.href='${pageContext.request.contextPath }/delivery/deliveryReq'">배송요청조회</button>
					</li>
					<li>
						<button class="dropdown-btn" style="background-color: #669900;" onclick="location.href='${pageContext.request.contextPath }/delivery/deliveryList'" >배송조회</button>
					</li>
					
				</ul>
			</div>

			<div class="main">
			
				<h3>배송조회</h3>
				<div class="right"><button type="button" class="a-button big" onclick="delReadySearch()">상세 검색</button><button type="button" class="a-button big" onclick="location.href='${pageContext.request.contextPath }/delivery/deliveryList'">검색 초기화</button></div>
				<hr />
				<div class="information">
				<form action="deliveryList" id="delReadySearchForm" method="post">
					<table class="table">
						<thead>
							<tr>
								<th>요청번호</th>
								<td colspan="1"><input type="search" name="requestNum" id="requestNumInput" value=""/>&nbsp;<a href="${pageContext.request.contextPath }/delivery/choice_store_code.jsp" onClick="window.open(this.href, '', 'width=400, height=430'); return false;" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								<th>매장코드</th>
								<td colspan="1"><input type="search" name="storeId" id="storeIdInput" value="0"/>&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							</tr>
							<tr>
								<th>배송 시작일</th>
								<td colspan="1">
									<label class="gLabel"><input type="search" name="deliveryStart" id="delStartInput1" value=""/>&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="search" name="deliveryStartTwo"  id="delStartInput2" value="" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
								<th>배송 완료일</th>
								<td colspan="1">
									<label class="gLabel"><input type="search" name="deliveryEnd" id="delEndInput1" value="" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="search" name="deliveryEndTwo" id="delEndInput2" value="" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td> 
							</tr>
							<tr>
								<th>배송처리 현황</th>
								<td colspan="3">
									<select name="deliveryState" id="delReadyCategory">
										<option value="0">배송처리 현황 선택</option>
										<option value="50">1. 배송 준비중</option>
										<option value="60">2. 배송중</option>
										<option value="70">3. 배송완료</option>
									</select>
								</td>
							</tr>
						</thead>
					</table>
				</form>
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
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
								<th>번호</th>
								<th>요청번호</th>
								<th>매장코드</th>
								<th>배송처리현황</th>
								<th>배송 요청일</th>
								<th>배송 종료일</th>
							</tr>
							<tr>
							<c:choose>
								<c:when test="${empty(delReadyList) }">
									<tr align="center">
										<td colspan="7">검색된 배송요청이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="delReadyList" items="${delReadyList }">
									<tr>
										<td><input type="checkbox" class="rowChk"  value="${delReadyList.deliverySeq }"></td>
										<td>${delReadyList.deliverySeq }</td>				
										<!-- 팝업창 뜨는거 만들어야 함  -->
										<td>${delReadyList.requestNum }</td>				
										<td>${delReadyList.storeId }</td>
										<c:choose>
										<c:when test="${delReadyList.deliveryState == 50}">
										<td class="red-font">배송 준비중</td>										
										</c:when>
										<c:when test="${delReadyList.deliveryState == 60}">
										<td class="blue-font">배송중</td>										
										</c:when>
										<c:when test="${delReadyList.deliveryState == 70}">
										<td style="color:green">배송 완료</td>										
										</c:when>
										</c:choose >
										<c:set var="startDate" value="${delReadyList.deliveryStart}"/>
										<c:set var="endDate" value="${delReadyList.deliveryEnd}"/>
										<td>${fn:substring(startDate,0,10) }</td>
										<td>${fn:substring(endDate,0,10) }</td>
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

$(function(){

    $("#delStartInput1").datepicker();
    $("#delStartInput2").datepicker();
    $("#delEndInput1").datepicker();
    $("#delEndInput2").datepicker();
    
	$.datepicker.setDefaults({
	    dateFormat: 'y/mm/dd' 
	});


});


function delReadySearch() {

	alert($("#delReadyCategory").val());
	$("#delReadySearchForm").submit(); 
	
		
		//$("#delReadySearchForm").submit(); 
	/*
	if($("#requestNumInput").val()=='' && $("#storeIdInput").val()=='' && $("#delStartInput1").val=='' && $("#delStartInput2").val()==''
	&& $("#delEndInput1").val()=='' && $("#delEndInput2").val()=='' && $("#delReadyCategory").val()=='') {
		alert("검색 사항을 선택 및 입력해 주세요.");
		return false;
	} else {
	 //$("#delReadySearchForm").submit(); 
	 console.log("실패패패패패패")
	 return;
	} 
	*/
	
};



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
							location.href="${pageContext.request.contextPath }/delivery/deliveryList"; 
					},
					error:function(request,status,error){
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			          }
				});  
			} else {
				alert("처리할 배송정보가 없습니다.");
				return;
			}
			
		
		}
	});
			

<%--
// 배송요청을 확인처리하기 위한 함수 //테스팅 확인용 

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

--%>

<%-- 핸들바스 사용할때 이용되는 다중검색 메소드 
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
--%>

			

</script>



<%--  핸들바스 템플릿 
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
	--%>	


			
	
	
	
	
	
	
	
	
	
	
	
	
	
	