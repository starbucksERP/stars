<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
#content{
    position: relative;
    background-image: url("${pageContext.request.contextPath }/images/starbucks-4620637_1920.jpg"); 
    height: 110vh;
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
     top:52%;
     left:55%;
     transform: translate(-60%, -55%);                                                                   
     z-index: 2;
}


.main{
	z-index: 999; 
	background: rgba(0,0,0,0.6);
	color: white; 
	border: 1px solid #79726a;
	
}

.a-button{
	border-radius: 0px !important;
}

</style>

<script type="text/javascript">

//아이디 정규식
var idJ =/^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ =/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
// 이름 정규식
var nameJ =/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ =/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
		
$('document').ready(function(){
	var address1=$("#hewonAddress").val().split('(');
	$("#sample4_roadAddress").val(address1[0])
	var address2=address1[1].split(')');
	$("#sample4_jibunAddress").val(address2[0])
	$("#sample4_detailAddress").val(address2[1]); 
});
	
	
	
		
function hewonModify() {
	
	var hewonAddress=$("#sample4_roadAddress").val()+" ("+$("#sample4_jibunAddress").val()+") "+$("#sample4_detailAddress").val();
	$("#hewonAddress").val(hewonAddress);
	
     if (idJ.test($('#hewonId').val())) {
        $("#id_check").text(" ");
     } else {
        $("#id_check").text("아이디를 형식을 확인하세요.");
        $('#hewonId').focus();
        return false;
     }
    
     if (($('#hewonPassword').val() == ($('#hewonPassword2').val())) && pwJ.test($('#hewonPassword').val())) {
        $("#password_check").text(" ");
     } else {
        $("#password_check").text("비밀번호를 확인하세요.");
        $('#hewonPassword').focus();
        return false;
     }
 
     if (nameJ.test($('#hewonName').val())) {
        $("#name_check").text(" ");
     } else {
        $("#name_check").text("이름을 확인하세요.");
        $('#hewonName').focus();
        return false;
     }
  
    if (mailJ.test($('#hewonEmail').val())){
        $("#email_check").text(" ");
     } else {
        $("#email_check").text("이메일을 확인하세요.");
        $('#hewonEmail').focus();
        return false;
     }  
   
     if (phoneJ.test($('#hewonPhone').val())) {
        $("#phone_check").text(" ");
     } else {
        $("#phone_check").text("휴대폰 번호를 확인하세요.");
        $('#hewonPhone').focus();
        return false;
     } 
     
     if(($("#sample4_roadAddress").val()== ''|| $("#sample4_jibunAddress").val()== '') && $("#sample4_detailAddress").val()== ''){
         $("#address_check").text("주소를 확인하세요.");
         return false;
      }
     $("#address_check").text("");
     
    f.action = "${pageContext.request.contextPath}/hewon/modify";
 	f.submit();
 	alert("정보 수정이 이루어졌습니다."); 
  
}


function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guidetextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guidetextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guidetextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guidetextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guidetextBox.style.display = 'block';
            } else {
                guidetextBox.innerHTML = '';
                guidetextBox.style.display = 'none';
            }
        }
    }).open();
}

</script>

	<div class="content">
			<div class="row">
				<div class="main">
					<div style="font-size: 2em;" class="center">회원관리 - 회원정보수정</div>
					<form name="f" method="post">
					<br />
						<br />
							<h3>'${hewon.hewonName}[${hewon.hewonId }]' 님의 이용정보 수정</h3>
							<hr />
							<br />
							<br />
							<input type="text" style="width:250px; margin:10px; margin-bottom: 0px; " id="hewonEmail" name="hewonEmail" value="${hewon.hewonEmail }" placeholder="이메일"><br />
							<span style="margin-left: 10px; font-size:12px;" class="coral-font" id="email_check"></span>
						<br />
							<input type="text" style="width:250px; margin:10px; margin-bottom: 0px; " id="hewonPhone" name="hewonPhone" value="${hewon.hewonPhone }" placeholder="전화번호 ('-'없이 번호만 입력해주세요)"><br />
							<span style="margin-left: 10px; font-size:12px;" class="coral-font" id="phone_check"></span>
						<br />
							<input type="text" style="margin:10px;" id="sample4_postcode" placeholder="우편번호">
							<button type="button" class="a-button gray" onclick="sample4_execDaumPostcode()"><i class="fa fa-search"></i> 우편번호 찾기</button><br>
							<input type="text" style="margin:10px; width:230px;" id="sample4_roadAddress" placeholder="도로명주소">
							<input type="text" style="margin:10px; width:230px;" id="sample4_jibunAddress" placeholder="지번주소"><br />
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" style="margin:10px; width:250px;;" id="sample4_detailAddress" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br />
							<span style="margin-left: 10px; font-size:12px;" class="coral-font" id="addres_check"></span>
							<input type="hidden"  id="hewonAddress" name="hewonAddress" value="${hewon.hewonAddress}"/>
						<br />
							<%-- 관리자만 볼 수 잇음 --%>
							<c:if test="${hewon.hewonGrade=='9'}">
								<br/>
									<input type="text" style="width:250px; margin:10px; margin-bottom: 0px; " id="hewonGrade" name="hewonGrade" value="${hewon.hewonGrade }" placeholder="회원등급"><br />
									<span style="margin-left: 10px; font-size:12px;" class="coral-font" id="phone_check"></span>
								<br>
								 	<input type="text" style="width:250px; margin:10px; margin-bottom: 0px; " id="hewonStId" name="hewonStId" value="${hewon.hewonStId }" placeholder="매장 코드"><br />
									<span style="margin-left: 10px; font-size:12px;" class="coral-font" id="phone_check"></span>
							</c:if>
						<br />
						<hr />
						<br />
							<h4>비밀번호 확인</h4>
							<input type="password" style="width:250px; margin:10px; height :24px" id="hewonPassword" name="hewonPassword" value="${hewon.hewonPassword }" placeholder="비밀번호">
							<input type="password" style="width:250px; margin:10px; height:24px" id="hewonPassword2" name="hewonPassword2" value="" placeholder="비밀번호확인"><br />
							<span style="margin-left: 10px; font-size:12px;" class="coral-font" id="password_check"></span>
						<br />
						<br />
					</form>
					<br />
					<div class="center">
						<button type="button" class="a-button big purple" onClick="hewonModify();">수정</button>&nbsp;&nbsp;
						<button type="button" class="a-button big sea" onClick="location.href='${pageContext.request.contextPath}/hewon/list';">목록</button>
					</div>
				</div>
			</div>
      </div>
	<div class="img-cover"></div>


