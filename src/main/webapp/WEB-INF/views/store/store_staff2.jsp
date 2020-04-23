<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.table tr:not(.trFirst):hover {
	background-color: #006C49;
	color: white;
}




</style>
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
			<h3>점주정보</h3>
			<hr />
			<%-- 점주정보를 출력하는 영역 --%>
			<div id="ownerDiv" class="information-left staff-left" >
				<div id="ownerInfo" class="brown staff-head">[지점] 점주 정보</div>
				<div class="information-left" style="width: 32%" >
				</div>
				<div class="information-right" style="width: 60%">
					<button id="ownerName" type="button" class="a-button green medium" style="margin-left: 20px;">이름</button>
					<div>
						<div id="ownerAddress" class="staff" style="font-weight: bold;">주소</div><span class="gray-font">주소</span>
					</div>
					<div>
						<div id="ownerPhone" class="staff" style="font-weight: bold;">연락처</div><span class="gray-font">연락처</span>
					</div>
					<div>
						<div id="ownerEmail" class="staff" style="font-weight: bold;">이메일</div><span class="gray-font">이메일</span>
					</div>
				</div>
			</div>
			
			<div class="information-right">
				<h3>[지점명 검색]</h3> 
				<div>
					<span class="staff" >지점명 :&nbsp;</span>
					<input type="search" id="storeName"/>&nbsp;
					<button type="button" id="searchBtn" class="a-button black" onclick="storeSearchDisplay()"><i class="fas fa-search"></i>&nbsp;검색</button>
				</div>
				<br />
				<hr />
				<div class="right">
					<span class="red-font">지점명</span>을 클릭하시면 점주 정보를 확인할수 있습니다.
				</div>
				<div class="right" id="length"> &nbsp;&nbsp;</div>
				<%-- <div class="right">총 매장수 : ${fn:length(storeList) }&nbsp;&nbsp;</div> --%>
				
				<%-- 지점 목록을 출력하는 영역 --%>
				<div id="storeListDiv"></div>
				<!-- <td><a onclick="ownerDisplay({{storeId}})">{{storeName}}</a></td> -->
				
			</div>
		</div>	
	</div>
</div>

<script id="templateStore1" type="text/x-handlebars-template">
	<table class="table" id="tableClick">
		<tbody>
			<tr id="trFirst" style="color: black;" >
				<th>지점명</th>
				<th>주소</th>
			</tr>
			<tr id="trFirst" style="color: black;" >
				<td colspan="2">검색된 지점이 없습니다.</td>
			</tr>
		</tbody>
	</table>
</script>
<script id="templateStore2" type="text/x-handlebars-template">
	<table class="table" id="tableClick">
		<tbody>
			<tr id="trFirst" style="color: black;" >
				<th>지점명</th>
				<th>주소</th>
			</tr>
			{{#each.}}
			<tr onclick="ownerDisplay({{storeId}})">
				<td>{{storeName}}</td>
				<td>{{storeAddress}}</td>			
			</tr>
			{{/each}}
		</tbody>
	</table>
</script>

<script id="templateOwner1" type="text/x-handlebars-template">
	<div class="brown staff-head">[등록된 점주가 없습니다.]</div>
	<div class="information-left" style="width: 32%">
	</div>
	<div class="information-right" style="width: 60%">
		<button type="button" class="a-button green medium" style="margin-left: 20px;" disabled="disabled">점주명</button>
		<div>
			<div class="staff" style="font-weight: bold;">주소</div><span class="gray-font">주소</span>
		</div>
		<div>
			<div class="staff" style="font-weight: bold;">연락처</div><span class="gray-font">연락처</span>
		</div>
		<div>
			<div class="staff" style="font-weight: bold;">이메일</div><span class="gray-font">이메일</span>
		</div>
	</div> 	
</script>

<script id="templateOwner2" type="text/x-handlebars-template">
	<div class="brown staff-head">[{{storeName}}] 점주 정보</div>
	<div class="information-left" style="width: 32%">
	</div>
	<div class="information-right" style="width: 60%">
		<button type="button" class="a-button green medium" style="margin-left: 20px;" disabled="disabled">{{hewonName}}</button>
		<div>
			<div class="staff" style="font-weight: bold;">주소</div><span class="gray-font">{{hewonAddress}}</span>
		</div>
		<div>
			<div class="staff" style="font-weight: bold;">연락처</div><span class="gray-font">{{hewonPhone}}</span>
		</div>
		<div>
			<div class="staff" style="font-weight: bold;">이메일</div><span class="gray-font">{{hewonEmail}}</span>
		</div>
	</div> 	
</script>

<script type="text/javascript">

	//처음에는 전체 출력 
	storeDisplay();
	
	//1.검색키워드가 없는 경우 전체지점 출력
 	function storeDisplay() {
		$.ajax({
			type: "GET",
			 url: "storeStaffList",
			 dataType: "json",
			 success: function(json) {
				 if(json.storeList.lenght==0) {
					 var source=$("#templateStore1").html();
					 var template=Handlebars.compile(source);
					 $("#storeListDiv").html(template(json.storeList));
					 return;
				 }
					 var source=$("#templateStore2").html();
					 var template=Handlebars.compile(source);
					 $("#storeListDiv").html(template(json.storeList));
			 },
			 
			 error: function(xhr) {
				 alert("에러코드 = "+xhr.status);
			 }
		});
		
	};
	
	//2.검색키워드가 있는 경우 검색하여 출력
 	function storeSearchDisplay() {
		
		var storeName=$("#storeName").val();
		
		$.ajax({
			type: "GET",
			 url: "storeStaffList/"+storeName,
			 dataType: "json",
			 success: function(json) {
				 if(json.storeList.length==0) {
					 var source=$("#templateStore1").html();
					 var template=Handlebars.compile(source);
					 $("#storeListDiv").html(template(json.storeList));
					 return;
				 }
					 var source=$("#templateStore2").html();
					 var template=Handlebars.compile(source);
					 $("#storeListDiv").html(template(json.storeList));
			 },
			 error: function(xhr) {
				 alert("에러코드 = "+xhr.status);
			 }
		}); 
		
		$("#searchBtn").submit();	
		$("#storeName").val("");
		
	}; 
	

	
	//지점명 클릭시 점주정보를 출력하는 함수
 	function ownerDisplay(storeId) {
		alert("storeId ="+storeId);
		//var hewonStId=storeId;
		//alert("hewonStId ="+hewonStId);
		$.ajax({
			type: "GET",
			 url: "storeOwner/"+storeId,
			 dataType: "json",
			 success: function(json) {
				 if(json.owner==null) {
					 var source=$("#templateOwner1").html();
					 var template=Handlebars.compile(source);
					 $("#ownerDiv").html(template(json.owner));						 
				 } else {
					 var source=$("#templateOwner2").html();
					 var template=Handlebars.compile(source);
					 $("#ownerDiv").html(template(json.owner));	
				 }
			 },
			 error: function(xhr) {
				 alert("에러코드 ="+xhr.status);
			 }
		});

	} 
	
	
 	$('.table>tbody> tr').hover(function() {
 	    $(this).addClass('hover');
 	}, function() {
 	    $(this).removeClass('hover');
 	});
 	
	$("#searchBtn").click(function(){
		/*
 		$("#owerInfo").val("");
		$("#owerName").val("");
		$(".staff").val("");
		*/
	});
		
</script>


















