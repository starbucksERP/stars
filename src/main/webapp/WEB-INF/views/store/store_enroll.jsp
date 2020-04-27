<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.error {
	color: #006C49;
}
</style>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">지점 관리<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="${pageContext.request.contextPath}/store/storeEnroll">지점 등록</a><br /><br />
						<a href="${pageContext.request.contextPath}/store/storeSta">지점 현황</a><br /><br />
						<a href="${pageContext.request.contextPath}/store/storeStaff">점주 정보</a>
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
			<h3>지점 등록 / 수정</h3>
			<hr />
			<div class="information-left">
			<br />
				<span style="float: right;"><button type="button" class="a-button yellow medium" id="modifyBtn" >수정</button></span>
				<br />
				<!-- <div class="errorCheckMsg" style="color:red; display: none;">check 부탁드립니다.(1개)</div> -->
				<button type="button" class="a-button darkgreen" id="errorCheckMsg" style="display: none; width: 200px; height: 35px; font-size: 15px;">check 부탁드립니다.(1개)</button>
				<br /><div id="resultLength" class="right" style="display:inline-block;"></div>
				<div id="storeInsertDiv"></div>
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>지점코드</th>
							<th>지점명</th>
							<th>점주명</th>
							<th>구분</th>
						</tr>
					</tbody>
				</table> 
			</div>
			
			<div class="information-right">
				<!-- 탭 컨텐츠 영역 -->
				<div class="enroll-div">
				<!-- 매장정보 -->
				<%-- 매장정보 입력 영역 --%>
				<fieldset id="insertArea" class="enroll-fieldset" style="display: block">
					<label>
						<span>지점명 </span><input type="text" id="insertName" name="storeName"/>
					</label><br />
					<div class="error nameErrorMsg"  style=" display: none;  padding-left: 163px; ">&nbsp;&nbsp;지점명을 반드시 입력해 주세요.</div>
					<label>
						<span>지점주소 </span><input type="text" id="insertAddress" name="storeAddress" style="width: 250px;"/>
					</label><br />
					<div class="error addressErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;지점주소를 반드시 입력해 주세요.</div>
					<label>
						<span>점주명 </span><input type="text" id="insertOwner" name="storeOwner"/>
					</label><br />
					<div class="error ownerErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;점주명을 반드시 입력해 주세요.</div>
					<label>
						<span>지점 전화번호 </span><input type="text" id="insertPhone" name="storePhone"/>
					</label><br />		
					<div class="error phoneErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;전화번호를 반드시 입력해 주세요.</div>			
					<span class="staff">구분 </span>	
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="head" >본점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="branch" >지점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="close">폐점</label>
					<div class="error radioErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;버튼을 선택해 주세요.</div>			
					<div class="error closeErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;폐점등록은 수정시 가능합니다.</div>
					
					<br />
					<label>
						<span>개업일 </span><input type="text" id="insertOpen" name="storeOpen"/>
					</label><br />
					<div class="error openErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;개업일을 반드시 입력해 주세요.</div>
					<label>
						<span>폐업일 </span><input type="text" id="insertClose" name="storeClose" disabled="disabled"  />
					</label><br />
					
					<div class="center" style="margin-top: 70px;">
						<button type="button" class="a-button darkgreen medium" id="addStoreBtn" >등 록</button>
						<button type="button" class="a-button blackgray medium" id="resetBtn">초기화</button>
					</div>
				</fieldset>
				
				<%-- 매장정보 수정 영역 --%>
				<fieldset id="updateArea" class="enroll-fieldset" style="display: none">
					<label>
						<span>지점코드 </span><input type="text" id="updateStoreId" name="storeId" readonly="readonly" />
					</label><br/>				
					<label>
						<span>지점명 </span><input type="text" id="updateName" name="storeName"/>
					</label><br />
					<div class="error unameErrorMsg"   style="display: none; padding-left: 163px; ">&nbsp;&nbsp;지점명을 반드시 입력해 주세요.</div>
					<label>
						<span>지점주소 </span><input type="text" id="updateAddress" name="storeAddress" style="width: 250px;"/>
					</label><br />
					<div class="error uaddressErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;지점주소를 반드시 입력해 주세요.</div>
					<label>
						<span>점주명 </span><input type="text" id="updateOwner" name="storeOwner"/>
					</label><br />
					<div class="error uownerErrorMsg"   style="display: none; padding-left:163px;">&nbsp;&nbsp;점주명을 반드시 입력해 주세요.</div>
					<label>
						<span>지점 전화번호 </span><input type="text" id="updatePhone" name="storePhone"/>
					</label><br />
					<div class="error uphoneErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;전화번호를 반드시 입력해 주세요.</div>			
					<span class="staff">구분 </span>	
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="head">본점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="branch">지점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="close">폐점</label>
					<div class="error uradioErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;버튼을 선택해 주세요.</div>			
					<div class="error ucloseErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;폐점을 클릭해 주세요.</div>
					<br />
					<label>
						<span>개업일 </span><input type="text" id="updateOpen" name="storeOpen"/>
					</label><br />
					<div class="error uopenErrorMsg"   style="display: none; padding-left: 163px;">&nbsp;&nbsp;개업일을 반드시 입력해 주세요.</div>
					<label>
						<span>폐업일 </span><input type="text" id="updateClose" name="storeClose" />
					</label><br />
					<div class="error ucloseMsg"   style="display: none; text-align:center; padding-left: 17px;">&nbsp;&nbsp;폐업일을 입력해 주세요.</div>
					
					<div class="center" style="margin-top: 70px;">
						<button type="button" class="a-button yellow medium" id="updateBtn" >수정완료</button>
					</div>
				</fieldset>				
					
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
				 $("#resultLength").html("총 검색결과 : "+json.storeList.length+"건");
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
						 "<td><input type='checkbox' class='rowChk' value='"+json.storeList[i].storeId+"' ></td>"+
						 "<td>"+json.storeList[i].storeId+"</td>"+
						 "<td>"+json.storeList[i].storeName+"</td>"+
						 "<td>"+json.storeList[i].storeOwner+"</td>"+
						 "<td>"+state+"</td>"+
						 "</tr>";
						$(".table>tbody").append(storeAdd);
					 })
				 }
				 
			 },
			 
			 error: function(xhr) {
				 alert("에러코드 = "+xhr.status);
			 }
		});		
	}
	
	
	 <%-- 처음 등록시 --%>
	 $("#addStoreBtn").click(function() {
		 
		 	//입력값을 반환받아 저장 
		 	var storeName=$("#insertName").val();
		 	var storeAddress=$("#insertAddress").val();
		 	var storeOwner=$("#insertOwner").val();
		 	var storePhone=$("#insertPhone").val();
		 	
		 	//라디오 선택된값 가져오기
		 	var storeState=$('.fChk:checked').val();
		 	
				if(storeState=='head'){
					storeState=0;
				} else if (storeState=='branch') {
					storeState=1;
				} else if (storeState=='close'){
					storeState=9;
				}
			
		 	var storeOpen=$("#insertOpen").val();
		 	var storeClose=$("#insertClose").val();
		 	
		 	if(storeName=="") {
		 		$(".nameErrorMsg").show();
		 		return;
		 	}
		 	if(storeAddress=="") {
		 		$(".addressErrorMsg").show();
		 		return;
		 	}
		 	if(storeOwner=="") {
		 		$(".ownerErrorMsg").show();
		 		return;
		 	}
		 	if(storePhone=="") {
		 		$(".phoneErrorMsg").show();
		 		return;
		 	}
		 	
		 	if($(':radio[name="radio-name"]:checked').length<1){
		 		$(".radioErrorMsg").show();
		 		return;
		 	}
		 	
		 	if(storeState==0 || storeState==1) {
		 		if(storeOpen=="") {
		 			$(".openErrorMsg").show();
		 			return;
		 		}
		 	} else if(storeState==9) {
		 		$(".closeErrorMsg").show();
		 		return;
		 	}
		 			

		 	$.ajax({
		 		type: "POST",
		 		 url: "storeAdd",
		 		 headers: {"content-type":"application/json"},
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
		 	
 		 		$(".nameErrorMsg").hide();
		 		$(".addressErrorMsg").hide();
		 		$(".ownerErrorMsg").hide();
		 		$(".phoneErrorMsg").hide();
		 		$(".openErrorMsg").hide();
		 		$(".radioErrorMsg").hide();
		 		$(".openErrorMsg").hide();
		 		$(".closeErrorMsg").hide(); 	 	
		 	
		 });

	
	<%-- 수정버튼 클릭시 발생하는 이벤트 --%>
	$("#modifyBtn").click(function() {
		var cnt = $(".rowChk:checked").length;
		
		if(cnt>1 || cnt==0) {
			$("#errorCheckMsg").css('display','block');
			$(this).prop('checked',false);
		} else {
			$("#errorCheckMsg").css('display','none');
			$("#insertArea").css('display','none');
			
			<%-- store_id를 전달하여 입력값 반환받기 --%>
		 	//체크박스선택값 (메소드 때문에 가져온것)
		 	var storeId=$(".rowChk:checked").val();
			
			<%-- 반환받은값 변경inpt태그에 저장 --%>
			$("#updateStoreId").val(storeId);
			var storeName=$("#updateName").val(storeName);
			var storeAddress=$("#updateAddress").val(storeAddress);
			var storeOwner=$("#updateOwner").val(storeOwner);
			var storePhone=$("#updatePhone").val(storePhone);
			 
			var storeOpen=$("#updateOpen").val(storeOpen);
			var storeClose=$("#updateClose").val(storeClose);
			
			$.ajax({
				type: "GET",
				 url: "storeIdView/"+storeId,
				 dataType: "json",
				 success: function(json) {
					 $("#updateName").val(json.storeName);
					 $("#updateAddress").val(json.storeAddress);
					 $("#updateOwner").val(json.storeOwner);
					 $("#updatePhone").val(json.storePhone);
					 $("#updateOpen").val(json.storeOpen);
					 $("#updateClose").val(json.storeClose);
					 if(json.storeState==0){
						 $("input:radio[name='radio-name']:radio[value='head']").prop('checked', true); 
					 }else if(json.storeState==1){
						 $("input:radio[name='radio-name']:radio[value='branch']").prop('checked', true); 
					 }else{
						 $("input:radio[name='radio-name']:radio[value='close']").prop('checked', true); 
					 }
				 },
				 error: function(xhr) {
					 alert("에러코드 ="+xhr.status);
				 }
			});
		 
			$("#updateArea").show();
		}
	}); 			
	
		<%-- 수정정보 등록 --%>
		$("#updateBtn").click(function() {
			
		 	var storeId=$(".rowChk:checked").val();
		 	var storeName=$("#updateName").val();
		 	var storeAddress=$("#updateAddress").val();
		 	var storeOwner=$("#updateOwner").val();
		 	var storePhone=$("#updatePhone").val();
		 	
		 	//라디오 선택된값 가져오기
 		 	var storeState=0;
			 $(".fChk:checked").each(function(i) {
				 if($(this).val()=='head'){
					 storeState=0;
				 }else if($(this).val()=='branch'){
					 storeState=1;
				 }else if($(this).val()=='close'){
					 storeState=9;
				 }
			 }); 
			 
		 	var storeOpen=$("#updateOpen").val();
		 	var storeClose=$("#updateClose").val();
		 	
		 	if(storeName=="") {
		 		$(".unameErrorMsg").show();
		 		return;
		 	}
		 	if(storeAddress=="") {
		 		$(".uaddressErrorMsg").show();
		 		return;
		 	}
		 	if(storeOwner=="") {
		 		$(".uownerErrorMsg").show();
		 		return;
		 	}
		 	if(storePhone=="") {
		 		$(".uphoneErrorMsg").show();
		 		return;
		 	}
		 	
		 	if($(':radio[name="radio-name"]:checked').length<1){
		 		$(".uradioErrorMsg").show();
		 		return;
		 	} 
		 	
		 	if(storeState==0 || storeState==1) {
		 		if(storeOpen=="") {
		 			$(".uopenErrorMsg").show();
		 			return;
		 		} else if (storeClose!="") {
		 			$(".ucloseErrorMsg").show();
		 			return;
		 		}
		 	} else if(storeState==9) {
		 		if(storeClose=="") {
			 		$(".ucloseMsg").show();
			 		return;
		 		}
		 	}

		 	$.ajax({
		 		type: "PUT",
		 		 url: "storeModify/"+storeId,
		 		 headers: {"content-type":"application/json","X-Http-Method-override":"PUT"},
		 		 data: JSON.stringify({
	 				"storeName":storeName,
					"storeAddress":storeAddress,
					"storeOwner":storeOwner,
					"storePhone":storePhone,
					"storeState":storeState,
					"storeOpen":storeOpen,
					"storeClose":storeClose			 		
		 		 }),
		 		 dataType:"text",
		 		 success: function(text) {
		 			 if(text=="success"){
		 				storeDisplay();
		 			 }
		 		 },
		 		 error: function(xhr) {
		 			 alert("에러코드 ="+xhr.status);
		 		 }
		 	});
			
			$("#updateArea").css('display','none');
			$("#insertArea").show();
		
			/*
	 		$(".unameErrorMsg").hide();
	 		$(".uaddressErrorMsg").hide();
	 		$(".uownerErrorMsg").hide();
	 		$(".uphoneErrorMsg").hide();
	 		$(".uopenErrorMsg").hide();
	 		$(".uradioErrorMsg").hide();
	 		$(".ucloseErrorMsg").hide(); 
	 		$(".uopenErrorMsg").hide();
	 		$(".ucloseMsg").hide();
	 		*/
	 		$(".error").hide();
		});
		
	<%-- 초기화 버튼 클릭시 --%>
	$("#resetBtn").click(function() {
		$("input[type='text']").val("");
		$(".error").hide();
	});
	



	
</script>











 