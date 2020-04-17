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
			
				<div class="right"><button type="button" class="a-button purple medium">수정</button></div>
				<div id="checkErrorMsg" style="color:red; display: none;">하나만 체크해 주세요.</div>
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>매장코드</th>
							<th>매장명</th>
							<th>점주명</th>
							<th>구분</th>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${empty(storeList) }">
									<tr>
										<td colspan="5">지점이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="store" items="${storeList }">
									<tr>
										<td><input type="checkbox" class="rowChk"></td>
										<td>${store.storeId }</td>
										<td>${store.storeName }</td>
										<td>${store.storeOwner }</td>
									<c:if test="${store.state==0 }">
										<td>본사</td>
									</c:if>	
									<c:if test="${store.state==1 }">
										<td>지점</td>
									</c:if>
									<c:if test="${store.state==9 }">
										<td>폐점</td>
									</c:if>						
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
				
			</div>
			
			<div class="information-right">
				<!-- 탭 메뉴 영역 -->
				<ul class="enroll-ul">
					<li class="tab1" >매장정보</li>
					<li class="tab2" >점주정보</li>
				</ul>
				<!-- 탭 컨텐츠 영역 -->
				<div class="enroll-div">
				<!-- 매장정보 -->
				<fieldset id="tab1" class="enroll-fieldset" style="display: block">
					<label>
						<span>매장코드 </span><input type="text" readonly="readonly" />
					</label><br/>
					<label>
						<span>매장명 </span><input type="text" />
					</label><br />
					<label>
						<span>매장주소 </span><input type="text" />
					</label><br />
					<label>
						<span>점주명 </span><input type="text" />
					</label><br />
					<label>
						<span>매장 번호 </span><input type="text" />
					</label><br />					
					<span class="staff">매장구분 </span>	
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="head">본점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="branch">지점</label>
					<label class="gLabel"><input type="radio" name="radio-name" class="fChk" value="close">폐점</label>
					<br />
					<label>
						<span>개업일 </span><input type="text" class="openDate"/>
					</label><br />
					<label>
						<span>폐업일 </span><input type="text" class="closeDate"/>
					</label><br />
					<span class="staff">매장 이미지 </span>&nbsp;
					<img src="../star.png" alt="" align="top">
				</fieldset>
				<!-- 점주 정보 -->
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
					<br />
						
					<div class="center">
						<button type="button" class="a-button medium">등 록</button>
						<button type="button" class="a-button purple medium">초기화</button>
					</div>
				</div>
			</div>
		
		</div>

	</div>
</div> 

<script type="text/javascript">

	<%-- 매장정보 / 점주정보 탭이동 --%>
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
	$('input:checkbox[class=rowChk]').click(function() {
		
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
	
</script>





