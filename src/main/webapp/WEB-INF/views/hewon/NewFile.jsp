<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이광희 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>



<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">

<style type="text/css">
td{
   border:1px solid #000000;
   border-collapse:collapse;
}
</style>
 
 <script type="text/javascript">

//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/


var birthJ = false;

var address = $('#mem_detailaddress');

$(document).ready(function() {
   var address = $('#mem_detailaddress');

 
      $("#hewon_id").blur(function() {
          if($('#hewon_id').val()==''){
             $('#id_check').text('아이디를 입력하세요.');
             $('#id_check').css('color', 'red');                     
      
             } else if(idJ.test($('#hewon_id').val())!=true){
                $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
                $('#id_check').css('color', 'red');
             } else if($('#hewon_id').val()!=''){
                
               var mem_id=$('#hewon_id').val();
                 $.ajax({
                     async : true,
                        type : 'POST',
                      data : mem_id,
                      url : 'idcheck.do',
                        dateType: 'json',
                        contentType: "application/json; charset=UTF-8",
                        success : function(data) {

             if(data.cnt > 0){
                $('#id_check').text('중복된 아이디 입니다.');
                      $('#id_check').css('color', 'red');
                      $("#usercheck").attr("disabled", true);
             }else{
                if(idJ.test(hewon_id)){
                   $('#id_check').text('사용가능한 아이디 입니다.');
                   $('#id_check').css('color', 'blue');
                   $("#usercheck").attr("disabled", false);
                }
                else if(hewon_id==''){
                $('#id_check').text('아이디를 입력해주세요.');
                      $('#id_check').css('color', 'red');
                      $("#usercheck").attr("disabled", true);
                }
                else{
                   $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                   $('#id_check').css('color', 'red');
                   $("#usercheck").attr("disabled", true);
                }
             }

           }

                });
             }
    });
    
     $('form').on('submit',function(){
         var inval_Arr = new Array(8).fill(false);
         if (idJ.test($('#hewon_id').val())) {
            inval_Arr[0] = true;   
         } else {
            inval_Arr[0] = false;
            alert('아이디를  확인하세요.');
            return false;
         }
        
         if (($('#hewon_password').val() == ($('#hewon_password2').val()))
               && pwJ.test($('#hewon_password').val())) {
            inval_Arr[1] = true;
         } else {
            inval_Arr[1] = false;
            alert('비밀번호를 확인하세요.');
            return false;
         }
     
         if (nameJ.test($('#hewon_name').val())) {
            inval_Arr[2] = true;   
         } else {
            inval_Arr[2] = false;
            alert('이름을 확인하세요.');
            return false;
         }
      
          if (birthJ) {
            console.log(birthJ);
            inval_Arr[3] = true; 
         } else {
            inval_Arr[3] = false;
            alert('날짜를 확인해주세요.');
            return false;
         } 
     
         if (mailJ.test($('#hewon_email').val())){
            console.log(phoneJ.test($('#hewon_email').val()));
            inval_Arr[4] = true;
         } else {
            inval_Arr[4] = false;
            alert('이메일을 확인하세요.');
            return false;
         }
       
         if (phoneJ.test($('#hewon_phone').val())) {
            console.log(phoneJ.test($('#hewon_phone').val()));
            inval_Arr[5] = true;
         } else {
            inval_Arr[5] = false;
            alert('휴대폰 번호를 확인하세요.');
            return false;
         }
      
          if(member.hewon_grade[0].checked==false&&member.hewon_grade[1].checked==false){
                 inval_Arr[6] = false;
               alert('회원 등급을 확인하세요.');
               return false;
             
         } else{
            inval_Arr[6] = true;
         } 
   
        
         if(address.val() == ''){
            inval_Arr[7] = false;
            alert('주소를 확인하세요.');
            return false;
         }else
            inval_Arr[7] = true;
      
        
         var validAll = true;
         for(var i = 0; i < inval_Arr.length; i++){
            if(inval_Arr[i] == false){
               validAll = false;
            }
         }
         if(validAll == true){ 
            alert('회원가입이 완료되었습니다.');      
         } else{
            alert('정보를 다시 확인하세요.')
         }
       });


   $('#hewon_id').blur(function() {
      if (idJ.test($('#hewon_id').val())) {
         console.log('true');
         $('#id_check').text('');
      } else {
         console.log('false');
         $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
         $('#id_check').css('color', 'red');
      }
   });
   $('#hewon_password').blur(function() {
      if (passwordJ.test($('#hewon_password').val())) {
         console.log('true');
         $('#password_check').text('');
      } else {
         console.log('false');
         $('#password_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
         $('#password_check').css('color', 'red');
      }
   });


   $('#hewon_password2').blur(function() {
      if ($('#hewon_password').val() != $(this).val()) {
         $('#password2_check').text('비밀번호가 일치하지 않습니다.');
         $('#password2_check').css('color', 'red');
      } else {
         $('#password2_check').text('');
      }
   });

 
   $("#hewon_name").blur(function() {
      if (nameJ.test($(this).val())) {
         console.log(nameJ.test($(this).val()));
         $("#name_check").text('');
      } else {
         $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
         $('#name_check').css('color', 'red');
      }
   });
   $("#hewon_email").blur(function() {
      if (mailJ.test($(this).val())) {
         $("#email_check").text('');
      } else {
         $('#email_check').text('이메일 양식을 확인해주세요.');
         $('#email_check').css('color', 'red');
      }
   });
   

       
           var birthJ = false;
           
           $('#hewon_regDate').blur(function(){
              var dateStr = $(this).val();      
               var year = Number(dateStr.substr(0,4)); 
               var month = Number(dateStr.substr(4,2)); 
               var day = Number(dateStr.substr(6,2)); 
               var today = new Date(); 
               var yearNow = today.getFullYear(); 
              
               if (dateStr.length <=8) {
                  if (year > yearNow || year < 1900 ){
                     
                     $('#regDate_check').text('날짜를 확인해주세요');
                    $('#regDate_check').css('color', 'red');
                  }  
                  else if (month < 1 || month > 12) {
                        
                     $('#regDate_check').text('날짜를 확인해주세요 ');
                    $('#regDate_check').css('color', 'red'); 
                  
                  }else if (day < 1 || day > 31) {
                     
                     $('#regDate_check').text('날짜를 확인해주세요 ');
                    $('#regDate_check').css('color', 'red'); 
                     
                  }else if ((month==4 || month==6 || month==9 || month==11) && day==31) { 
                     $('#regDate_check').text('날짜를 확인해주세요 ');
                    $('#regDate_check').css('color', 'red'); 
                  }else if (month == 2) {
                        var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
                        
                      if (day>29 || (day==29 && !isleap)) {
                         
                         $('#regDate_check').text('날짜를 확인해주세요 ');
                       $('#regDate_check').css('color', 'red'); 
                     
                    }else{
                       $('#regDate_check').text('');
                       birthJ = true;
                    }
                  }else{
                     $('#regDate_check').text(''); 
                    birthJ = true;
                 }
                 }else{
                   
                    $('#regDate_check').text('날짜를 확인해주세요 ');
                    $('#regDate_check').css('color', 'red');  
                 }
              }); 
            
              $('#hewon_phone').blur(function(){
                 if(phoneJ.test($(this).val())){
                    console.log(nameJ.test($(this).val()));
                    $("#phone_check").text('');
                 } else {
                    $('#phone_check').text('휴대폰번호를 확인해주세요 ');
                    $('#phone_check').css('color', 'red');
                 }
              });
});


function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
           
            var fullRoadAddr = data.roadAddress; 
            var extraRoadAddr = ''; 

          
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
           
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
          
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
          
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

          
            console.log(data.zonecode);
            console.log(fullRoadAddr);
       
            
            $("[name=mem_oaddress]").val(data.zonecode);
            $("[name=mem_address]").val(fullRoadAddr);
            
            document.getElementById('mem_oaddress').value = data.zonecode;
            document.getElementById('mem_address').value = fullRoadAddr;

            
        }
     }).open();
 }

</script> 
</head>
<body>

   <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
              
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form action="memberjoinpro.do" method="post" role="form" id="usercheck" name="member">
                
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="hewon_id" name="hewon_id" placeholder="ID">
                        <div class="eheck_font" id="id_check"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" class="form-control" id="hewon_password" name="hewon_password" placeholder="PASSWORD">
                        <div class="eheck_font" id="password_check"></div>
                    </div>
                    <div class="form-group">
                        <label for="password2">비밀번호 확인</label>
                        <input type="password" class="form-control" id="hewon_password2" name="hewon_password2" placeholder="Confirm Password">
                          <div class="eheck_font" id="password2_check"></div>
                    </div>
                    
                       <div class="form-group">
                        <label for="hewon_name">이름</label>
                        <input type="text" class="form-control" id="hewon_name" name="hewon_name" placeholder="Name">
                         <div class="eheck_font" id="name_check"></div>
                    </div>
                    
                        <div class="form-group">
                        <label for="hewon_regDate">가입 일</label>
                        <input type="tel" class="form-control" id="hewon_regDate" name="hewon_regDate" placeholder="ex) 20200101">
                       <div class="eheck_font" id="regDate_check"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="hewon_email">이메일 주소</label>
                        <input type="email" class="form-control" id="hewon_email" name="hewon_email" placeholder="E-mail">
                       <div class="eheck_font" id="email_check"></div>
                    </div>
                    
             
                    <div class="form-group">
                        <label for="hewon_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label>
                        <input type="tel" class="form-control" id="hewon_phone" name="hewon_phone" placeholder="Phone Number">
                         <div class="eheck_font" id="phone_check"></div>
                    </div>
                    <form name="sendForm" method="get" >


                    <div class="form-group">
                        <label for="hewon_grade">회원 등급 </label>
                        <input type="checkbox" id="hewon_grade" name="hewon_grade" value="A" onclick="oneCheckbox">A
                        <input type="checkbox" id="hewon_grade" name="hewon_grade" value="B" onclick="oneCheckbox">B
                        <input type="checkbox" id="hewon_grade" name="hewon_grade" value="C" onclick="oneCheckbox">C
                   
                    </div>
</form>
                    
<div class="form-group">                   
<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="hewon_oaddress" id="hewon_oaddress" type="text" readonly="readonly" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>

<div class="form-group">
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="hewon_address" id="hewon_address" type="text" readonly="readonly" />
</div>

<div class="form-group">
    <input class="form-control" placeholder="상세주소" name="hewon_detailaddress" id="hewon_detailaddress" type="text"  />
</div>


  <div class="form-group text-center">
       <button type="submit" class="btn btn-primary">회원가입</button> 
  </div>
                </form>
            </div>
        </article>
</body>
</html>