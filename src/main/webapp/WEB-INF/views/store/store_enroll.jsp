<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h3>지점 등록 / 수정</h3>
			<hr />
			<div class="information-left">
			<br />
				<span id="length"></span>
				<span style="float: right;"><button type="button" class="a-button yellow medium" id="modifyBtn" >수정</button></span>
				<div id="checkErrorMsg" style="color:red; display: none;">하나만 체크해 주세요.</div>
				<div id="storeInsertDiv"></div>
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk" value=""></th>
							<th>지점코드</th>
							<th>지점명</th>
							<th>점주명</th>
							<th>구분</th>
						</tr>
					</tbody>
				</table> 
			</div>
			
			<div class="information-right">
				<!-- <ul class="enroll-ul">
					<li class="tab1" >지점정보</li>
				</ul> -->
				
				<!-- 탭 컨텐츠 영역 -->
				<div class="enroll-div">
				<!-- 매장정보 -->
				<%-- 매장정보 입력 영역 --%>
				<fieldset id="insertArea" class="enroll-fieldset" style="display: block">
					<!--  
					<label>
						<span>지점코드 </span><input type="text" id="storeId" readonly="readonly" />
					</label><br/>
					-->
					<label>
						<span>지점명 </span><input type="text" id="insertName" name="storeName"/>
					</label><br />
					<label>
						<span>지점주소 </span><input type="text" id="insertAddress" name="storeAddress" style="width: 250px;"/>
					</label><br />
					<label>
						<span>점주명 </span><input type="text" id="insertOwner" name="storeOwner"/>
					</label><br />
					<label>
						<span>지점 전화번호 </span><input type="text" id="insertPhone" name="storePhone"/>
					</label><br />					
					<span class="staff">구분 </span>	
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="head">본점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="branch" checked="checked">지점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="close">폐점</label>
					<br />
					<label>
						<span>개업일 </span><input type="text" id="insertOpen" name="storeOpen"/>
					</label><br />
					<div id="openErrorMsg" style="color:red; display: none;">&nbsp;&nbsp;개업일을 반드시 입력해 주세요.</div>
					<label>
						<span>폐업일 </span><input type="text" id="insertClose" name="storeClose" disabled="disabled"/>
					</label><br />
					<div id="closeErrorMsg" style="color:red; display: none; padding-left: 25px;" >폐업일은 수정시 가능합니다.</div>
					<span class="staff">지점 이미지 </span>&nbsp;
					<img src="../star.png" alt="" align="top">
					
					<div class="center" style="margin-top: 70px;">
						<button type="button" class="a-button darkgreen medium" id="addStoreBtn" >등 록</button>
						<button type="button" class="a-button blackgray medium">초기화</button>
					</div>
				</fieldset>
				
				<%-- 매장정보 수정 영역 --%>
				<fieldset id="updateArea" class="enroll-fieldset" style="display: none">
					<label>
						<span>지점명 </span><input type="text" id="updateName" name="storeName"/>
					</label><br />
					<label>
						<span>지점주소 </span><input type="text" id="updateAddress" name="storeAddress" style="width: 250px;"/>
					</label><br />
					<label>
						<span>점주명 </span><input type="text" id="updateOwner" name="storeOwner"/>
					</label><br />
					<label>
						<span>지점 전화번호 </span><input type="text" id="updatePhone" name="storePhone"/>
					</label><br />					
					<span class="staff">구분 </span>	
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="head">본점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="branch" checked="checked">지점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="close">폐점</label>
					<br />
					<label>
						<span>개업일 </span><input type="text" id="updateOpen" name="storeOpen"/>
					</label><br />
					<div id="" style="color:red; display: none;">&nbsp;&nbsp;개업일을 반드시 입력해 주세요.</div>
					<label>
						<span>폐업일 </span><input type="text" id="updateClose" name="storeClose" />
					</label><br />
					<div id="" style="color:red; display: none; text-align: center;">&nbsp;&nbsp;</div>
					<span class="staff">지점 이미지 </span>&nbsp;
					<img src="../star.png" alt="" align="top">
					
					<div class="center" style="margin-top: 70px;">
						<button type="button" class="a-button yellow medium" id="updateBtn" >수정완료</button>
						<button type="button" class="a-button blackgray medium">초기화</button>
					</div>
				</fieldset>				
				<!-- 점주 정보 -->
				<!--  
				<fieldset id="tab2" class="enroll-fieldset" style="display: none">
					<label>
						<span>주소  </span><input type="text" readonly="readonly" />
					</label><br/>
					<label>
						<span>연락처 </span><input type="text" />
					</label><br />
					<label>
						<span>이메일 </span><input type="text" />
					</label><br />
					<label>
						<span>요구사항 </span><input type="text" />
					</label><br />
				</fieldset>
				-->
					
				</div>
			</div>
		
		</div>

	</div>
</div> 


<script type="text/javascript">

	//처음에는 전체 출력
	storeDisplay();
	function storeDisplay() {
		$.ajax({
			type: "GET",
			 url: "storeStaffList",
			 dataType: "json",
			 success: function(json) {
				 if(json.storeList.length==0){
					 $(".table>tbody").append("<tr><td colspan='5'>검색된 지점정보가 없습니다.</td></tr>");
				 } else {
					 $(".table>tbody tr:not(:first)").empty();
					 $(json.storeList).each(function(i) {
						 var state= json.storeList[i].storeState;
						 if(state==0){
							 state="본점";
						 }else if(state==1){
							 state="지점";
						 }else{
							 state="폐점";
						 }
						 
						 var storeAdd = "<tr>"+
						 "<td><input type='checkbox' class='rowChk'></td>"+
						 "<td>"+json.storeList[i].storeId+"</td>"+
						 "<td>"+json.storeList[i].storeName+"</td>"+
						 "<td>"+json.storeList[i].storeOwner+"</td>"+
						 "<td>"+state+"</td>"+
						 "</tr>";
						$(".table>tbody").append(storeAdd);
					 })

						//var n = ($( 'tr' ).length)-1;
					 	//alert(n);
						//var nAdd = "<p style='display: inline-block;'>총 매장수 :"+n+"</p>";
						//$("#length").append(nAdd);
				 }
				 
			 },
			 
			 error: function(xhr) {
				 alert("에러코드 = "+xhr.status);
			 }
		});		
	}
	
	 $("#addStoreBtn").click(function() {
		 
		 	//입력값을 반환받아 저장 
		 	var storeName=$("#insertName").val();
		 	var storeAddress=$("#insertAddress").val();
		 	var storeOwner=$("#insertOwner").val();
		 	var storePhone=$("#insertPhone").val();
		 	var storeOpen=$("#insertOpen").val();
		 	var storeClose=$("#insertClose").val();
			 
		 	$.ajax({
		 		type: "POST",
		 		 url: "storeAdd",
		 		 headers: {"content-type":"application/json"},
		 		 data: JSON.stringify({
		 				"storeName":storeName,
						"storeAddress":storeAddress,
						"storeOwner":storeOwner,
						"storePhone":storePhone,
						"storeOpen":storeOpen,
						"storeClose":storeClose
		 		 }),
		 		 dataType: "text",
		 		 success: function(text) {
		 			 if(text=="success") {
		 			 	$("#insertName").val("");
		 			 	$("#insertAddress").val("");
		 			 	$("#insertOwner").val("");
		 			 	$("#insertPhone").val("");
		 			 	$("#insertOpen").val("");
		 			 	$("#insertClose").val("");
		 			 	storeDisplay();
		 			 }
		 		 },
		 		 error: function (xhr) {
					alert("에러코드 = "+xhr.status)
				}
		 	});
			 
		 });


	<%-- 지점등록시 라디오버튼 본점,지점 선택시  폐업일 비활성화 / 폐점 선택시 개업일 비활성화 --%>
	$('.fChk').on('click',function(){ 
		
		var checkValue = $("input:radio[name='radio-name']:checked").val();
		
		if( checkValue != 'close') {
			$('#insertOpen').prop('disabled',false);
			$('#insertOpen').focus();
			$('#insertClose').prop('disabled',true);
			$('#closeErrorMsg').hide();
		} else {
			document.getElementById('insertClose').disabled=true;
			$('#closeErrorMsg').css('display','block');
			$('#insertOpen').prop('disabled',true);
		}
	});
	
	<%-- 수정버튼 클릭시 발생하는 이벤트 --%>
	$("#modifyBtn").click(function() {
		var cnt = $("input:checkbox[class='rowChk']:checked").length;
		
		if(cnt>1) {
			$(this).prop('checked',false);
			$('#checkErrorMsg').css('display','block');
			return false;
		} else {
			$('#checkErrorMsg').css('display','none');
			$("#insertArea").css('display','none');
			
			<%-- store_id를 전달하여 입력값 반환받기 --%>
		 	var storeName=$("#insertName").val();
		 	var storeAddress=$("#insertAddress").val();
		 	var storeOwner=$("#insertOwner").val();
		 	var storePhone=$("#insertPhone").val();
		 	//체크박스선택값 아직 보류
		 	var storeOpen=$("#insertOpen").val();
		 	var storeClose=$("#insertClose").val();			
			
			<%-- 반환받은값 변경inpt태그에 저장 --%>
			var storeName=$("#updateName").val(storeName);
			var storeAddress=$("#updateAddress").val(storeAddress);
			var storeOwner=$("#updateOwner").val(storeOwner);
			var storePhone=$("#updatePhone").val(storePhone);
			var storeOpen=$("#updateOpen").val(storeOpen);
			var storeClose=$("#updateClose").val(storeClose);
			
			$("#updateArea").show();
			<%-- store_id를 전달하여 입력값 반환받기 --%>
			
		 	
		 	
			
			$("#updateBtn").click(function() {
				$("#updateArea").css('display','none');
				$("#insertArea").show();
			});
		}
		
	}); 
	

	
	
	<%-- 지점등록 버튼 클릭시 submit --%>
/* 		 	var storeName=$("#updateName").val();
		 	var storeAddress=$("#updateAddress").val();
		 	var storeOwner=$("#updateOwner").val();
		 	var storePhone=$("#updatePhone").val();
		 	
		 	var states=[];
			 $(".fChk:checked").each(function(i) {
				 if($(this).val()=='head'){
					 states.push(0);
					 var storeState=$(".fChk").val(states);
				 }else if($(this).val()=='branch'){
					 states.push(1);
					 var storeState=$(".fChk").val(states);
				 }else if($(this).val()=='close'){
					 states.push(9);
					 var storeState=$(".fChk").val(states);
				 }
			 });
		 	
		 	var storeOpen=$("#updateOpen").val();
		 	var storeClose=$("#updateClose").val(); */
	
/* 	$("#addStoreBtn").click(function() { 
		
		var openDate=$(".openDate").val();
		var closeDate=$(".closeDate").val();
		
		if(openDate=="" && closeDate=="") {
			$('#openErrorMsg').css('display','block');
			$('.openDate').focus();
			return;
		} else{
			$('#closeErrorMsg').css('display','block');
			$('.closeDate').focus();
			return;			
		}
	}) */


	<%-- 지점정보 / 점주정보 탭이동 --%>
	$(".enroll-ul li").click(function() {
		if($(this).attr("class")=='tab1'){
			$("#tab1").show();
			$("#tab2").hide();
		}else{
			$("#tab2").show();
			$("#tab1").hide();
		}
	})
	
	
	<%-- 수정가능한 체크박스 선택 갯수 제한 --%>
/* 	$("#modifyBtn").click(function() {
		
		var cnt = $("input:checkbox[class='rowChk']:checked").length;
		
		if(cnt>1) {
			$(this).prop('checked',false);
			$('#checkErrorMsg').css('display','block');
		}
	});
	 */
	

	
</script>











/* 		 	//입력게시글을 전달하여 저장하는 메소드 요청
		 	$.ajax({
		 		type: "PUT",
		 		 url: "storeModify",
		 		headers: {"content-type":"application/json","X-HTTP-Method-override":"PUT"},
		 		data: JSON.stringify({
		 			"storeName":storeName,
		 			"storeAddress":storeAddress,
		 			"storeOwner":storeOwner,
		 			"storePhone":storePhone,
		 			"storeState":storeState,
		 			"storeOpen":storeOpen,
		 			"storeClose":storeClose
		 		}),
		 		dataType: "text",
		 		success: function(text) {
		 			if(text=="success"){
		 			 	$("#updateName").val("");
		 			 	$("#updateAddress").val("");
		 			 	$("#updateOwner").val("");
		 			 	$("#updatePhone").val("");
		 			 	$(".fChk:checked").prop('checked',false);
		 			 	$("#updateOpen").val("");
		 			 	$("#updateClose").val("");
		 			 	storeDisplay();		 				
		 		}
		 	},
		 	error: function(xhr) {
		 		alert("에러코드 = "+xhr.status)
		 	}
		 }); */