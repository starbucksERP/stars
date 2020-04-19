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
				<div class="right"><button type="button" id="modifyBtn" class="a-button yellow medium">수정</button></div>
				<div id="checkErrorMsg" style="color:red; display: none;">하나만 체크해 주세요.</div>
				<div id="storeInsertDiv"></div>
				<%-- 				
					<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>지점코드</th>
							<th>지점명</th>
							<th>점주명</th>
							<th>구분</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>${store.storeId }</td>
							<td>${store.storeName }</td>
							<td>${store.storeOwner }</td>
							<td>${store.storeState }</td>
						</tr>
					</tbody>
					</table> 
				--%>
			</div>
			
			<div class="information-right">
				<!-- 탭 메뉴 영역 -->
				<ul class="enroll-ul">
					<li class="tab1" >지점정보</li>
					<!-- <li class="tab2" >점주정보</li> -->
				</ul>
				<!-- 탭 컨텐츠 영역 -->
				<div class="enroll-div">
				<!-- 매장정보 -->
				<fieldset id="tab1" class="enroll-fieldset" style="display: block">
					<label>
						<span>지점코드 </span><input type="text" readonly="readonly" />
					</label><br/>
					<label>
						<span>지점명 </span><input type="text" />
					</label><br />
					<label>
						<span>지점주소 </span><input type="text" />
					</label><br />
					<label>
						<span>점주명 </span><input type="text" />
					</label><br />
					<label>
						<span>지점<br/> 전화번호 </span><input type="text" />
					</label><br />					
					<span class="staff">구분 </span>	
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="head">본점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="branch">지점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="close">폐점</label>
					<br />
					<label>
						<span>개업일 </span><input type="text" class="openDate"/>
					</label><br />
					<div id="openErrorMsg" style="color:red; display: none;">&nbsp;&nbsp;개업일을 반드시 입력해 주세요.</div>
					<label>
						<span>폐업일 </span><input type="text" class="closeDate"/>
					</label><br />
					<div id="closeErrorMsg" style="color:red; display: none;">&nbsp;&nbsp;폐업일을 반드시 입력해 주세요.</div>
					<span class="staff">지점 이미지 </span>&nbsp;
					<img src="../star.png" alt="" align="top">
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
					<br />
						
					<div class="center">
						<button type="button" class="a-button darkgreen medium" id="addStoreBtn" >등 록</button>
						<button type="button" class="a-button blackgray medium">초기화</button>
					</div>
				</div>
			</div>
		
		</div>

	</div>
</div> 

<script id="templateStore" type="text/x-handlebars-template">
	<table class="table">
	<tbody>
		<tr>
			<th><input type="checkbox" class="allChk"></th>
			<th>지점코드</th>
			<th>지점명</th>
			<th>점주명</th>
			<th>구분</th>
		</tr>
		{{#each.}}
		<tr>
			<td><input type="checkbox" class="rowChk"></td>
			<td>{{storeId }}</td>
			<td>{{storeName }}</td>
			<td>{{storeOwner }}</td>
			<td>{{storeState }}</td>
		</tr>
		{{/each}}
	</tbody>
	</table>
</script>


<script type="text/javascript">

	//처음에는 전체 출력
	storeDisplay();
	function storeDisplay() {
		$.ajax({
			type: "GET",
			 url: "storeStaffList",
			 dataType: "json",
			 success: function(json) {
				 if(json.storeList.lenght==0) {
					 $("#storeInsertDiv").html("검색된 지점정보가 없습니다.");
					 return;
				 }
				 var source=$("#templateStore").html();
				 var template=Handlebars.compile(source);
				 $("#storeInsertDiv").html(template(json.storeList));
			 },
			 
			 error: function(xhr) {
				 alert("에러코드 = "+xhr.status);
			 }
		});		
	}


	<%-- 지점정보 / 점주정보 탭이동 
	$(".enroll-ul li").click(function() {
		if($(this).attr("class")=='tab1'){
			$("#tab1").show();
			$("#tab2").hide();
		}else{
			$("#tab2").show();
			$("#tab1").hide();
		}
	})
	--%>
	
	<%-- 수정가능한 체크박스 선택 갯수 제한 --%>
	$("#modifyBtn").click(function() {
		
		var cnt = $("input:checkbox[class='rowChk']:checked").length;
		
		if(cnt>1) {
			$(this).prop('checked',false);
			$('#checkErrorMsg').css('display','block');
		}
	});

	<%-- 본점,지점 선택시  폐업일 비활성화 / 폐점 선택시 개업일 비활성화 --%>
	$('.fChk').on('click',function(){
		
		var checkValue = $("input:radio[name='radio-name']:checked").val();
		
		if( checkValue != 'close') {
			$('.openDate').prop('disabled',false);
			$('.openDate').focus();
			$('.closeDate').prop('disabled',true);
		} else {
			$('.openDate').prop('disabled',true);
			$('.closeDate').prop('disabled',false);
			$('.closeDate').focus();
		}
	});
	
	
	<%-- 지점등록 버튼 클릭시 submit --%>
	
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


	
/* 	function addStore() {
		
		if(("input:text[class='closeDate']").val()==null) {
			$('#closeErrorMsg').css('display','block');
		}
	}
	 */
	
</script>











