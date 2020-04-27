<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.details{
   display: none;
}
</style>
<div class="container">
   <div class="row">
      <div class="sidebar">
         <ul class="side-menu">
            <li>
                  <button class="dropdown-btn">발주관리<i class="fa fa-caret-down"></i></button>
                  <div class="dropdown-container">
                     <a href="${pageContext.request.contextPath}/sic/storeOrderRequestList">발주요청조회</a><br /><br />
                     <a href="${pageContext.request.contextPath}/sic/storeOrderStateList">발주현황조회</a><br /><br />
                     <a href="${pageContext.request.contextPath}/sic/storeOrderInput">발주입력</a>
                  </div>
               </li>
               <li>
                  <button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
                  <div class="dropdown-container">
                     <a href="${pageContext.request.contextPath}/sic/storeReceipt">입출하조회</a><br /><br />
                     <a href="${pageContext.request.contextPath}/delivery/deliveryList">배송조회</a>
                  </div>
               </li>
            
         </ul>
      </div>

      <div class="main">
      
         <h3>발주입력</h3>
         <br />
         <hr />
         <div class="information">
            <table class="table">
               <thead>
                  <tr>
                     <th>발주요청일</th>
                     <td style="width: 38%"><input type="hidden" id="storeId" value="1021"/><label class="gLabel"><input type="date" readonly="readonly"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
                     <th>대분류</th>
                     <td>
                        <label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="A" id="repMain">원재료</label>
                        <label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="B" >푸드</label>
                        <label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="C" >MD상품</label>
                        <label class="gLabel"><input type="radio" class="fChk category1" name="category1" value="D" >기타</label>
                     </td>
                  </tr>
                  <tr>
                     <th>소분류</th>
                     <td colspan="3">
                        <span class="ddd">대분류를 선택해주세요.</span>
                        <span id="detailA" class="details">
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="01-" id="repA">원두</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="02-" >티백</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="03-" >부재료</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryA" name="category2" value="04-" >기타</label>
                        </span>
                        <span id="detailB" class="details">
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="05-" id="repB">베이커리</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="06-" >케이크</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="07-" >샌드위치</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="08-" >디저트</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="09-" >아이스크림</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="10-" >병음료</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryB" name="category2" value="11-" >기타</label>
                        </span>
                        <span id="detailC" class="details">
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="12-" id="repC">머그컵</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="13-" >글라스컵</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="14-" >텀블러</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="15-" >콜드컵</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="16-" >악세서리</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="17-" >커피용품</label>
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryC" name="category2" value="18-" >기타</label>
                        </span>
                        <span id="detailD" class="details">
                           <label class="gLabel"><input type="radio" class="fChk category2 categoryD" name="category2" value="00-" id="repD">선택사항없음</label>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <th>상품정보</th>
                     <td>
                        <select name="" id="CategoryListOption" style="width: 300px;">
                           <option value="">소분류를 선택해주세요.</option>
                        </select>
                     </td>
                     <th>상품명</th>
                     <td><span id="itemName">상품정보를 선택해주세요</span>&nbsp;<span id="itemNum"></span></td>
                  </tr>
                  <tr>
                     <th>구매단가</th>
                     <td>￦<span id="itemSprice"></span></td>
                     <th>수량</th>
                     <td colspan="3"><input type="number" id="orderQty"/>  &nbsp;개 <input type="hidden" id="itemSprice" /></td>
                  </tr>
               </thead>
            </table>
            <div class="right"><button type="button" class="a-button darkgreen large padding-button addTr">항목추가</button>&nbsp;</div>
         </div>
         <hr/>
         <br />
            <button type="button" class="a-button padding-button red delTr">항목삭제</button>
         <div class="information">
            <table class="table">
               <tbody id="removePosi">
                  <tr>
                     <th style="width:1%;"><input type="checkbox" class="allChk"></th>
                     <th style="width:9%;">날짜</th>
                     <th style="width:7%;">발주요청매장</th>
                     <th style="width:7%;">상품코드</th>
                     <th style="width:18%;">품목</th>
                     <th style="width:8%;">수량</th>
                     <th style="width:10%;">단가</th>
                     <th style="width:12%;">총합</th>
                  </tr>
               </tbody>
               <tfoot>
                  <tr>
                     <td colspan="8"><div class="message center red-font"></div></td>
                  </tr>
               </tfoot>
            </table>
            <div class="center">
               <button type="button" class="a-button big" id="storeOrderInput" >발주 입력</button>
               <button type="button" class="a-button sea big" onclick="reset()">다시 작성</button>
            </div>
         </div>
            
         
         
      </div>

   </div>
</div>


<script type="text/javascript">
   var today = new Date();
   var dd = today.getDate();
   var mm = today.getMonth()+1; //January is 0!
   var yyyy = today.getFullYear();
   var time = today.getTime();
   
   if(dd<10) {
       dd='0'+dd
   } 
   
   if(mm<10) {
       mm='0'+mm
   } 
   
   today = yyyy+'-'+mm+'-'+dd;
   
   
   $("input[type='date']").val(today);
   
   
   function reset(){
      $(".storeId").parents('tr').remove();
   }
   
   $(".addTr").click(function() {
      $(".message").text(" ");
      
      if($('#itemName').text()=='' || $('#itemName').text()=="상품정보를 선택해주세요."){
         alert("상품정보를 선택하지 않았습니다.");
         return false;
      }
      if($('#itemNum').text()==''){
         alert("상품정보를 선택하지 않았습니다.");
         return false;
      }
      if($('#itemSprice').text()==''){
         alert("상품정보를 선택하지 않았습니다.");      
         return false;
      }
      if($('#orderQty').val()=='' ){
         alert("발주할 재고 개수를 선택하지 않았습니다.");
         return false;
      }else if(Number($('#orderQty').val())<=0){
         alert("음수 또는 0개는 발주할 수 없습니다.");
         return false;
      }
      
      
      var html="<tr>"+
         "<td><input type='checkbox' class='rowChk'/></td>"+
         "<td><input type='text' readonly='readonly'style='border:none; text-align:center;' class='requestDate' value='"+$("input[type='date']").val()+"'/></td>"+
         "<td><span style='text-align:center;' class='storeId'>"+$('#storeId').val()+"</span></td>"+
         "<td><span style='text-align:center;' class='itemNum'>"+$('#itemNum').text().substr(1, $('#itemNum').text().length-2)+"</span></td>"+
         "<td><span style='text-align:center; ' class='itemNames'>"+$('#itemName').text()+"</span></td>"+
         "<td><span style='text-align:center; ' class='orderQty'>"+$('#orderQty').val()+"</span>개</td>"+
         "<td>￦<span style='text-align:center; ' class='itemSprice'>"+$('#itemSprice').text()+"</span></td>"+
         "<td>￦<span style='text-align:center; '>"+($('#orderQty').val()*$('#itemSprice').text())+"</span></td>"+
      "</tr>";
      
      $(".table>tbody").append(html);
      
   });
   
   
   $("#storeOrderInput").click(function(){
       
       var param = [];
       var storeOrder=[];
       
       if($('.rowChk:checked').length==0){
         $(".message").text("발주할 물품 리스트를 체크해주세요")
      }else{
          $(".rowChk:checked").each(function(i) {
          //   {orderSeq}, {requestNum}, {storeId}, {itemNum},  {orderQty}
             storeOrder = {
                 requestNum   : time+"-"+$("#storeId").val().substring(0, 2),
                 storeId         : $("#storeId").val(),
                 itemNum        : $(this).parents('tr').find(".itemNum").text(),
                  itemName      : $(this).parents('tr').find(".itemNames").text(),
                 itemSprice      : $(this).parents('tr').find(".itemSprice").text(),
                 orderQty        : $(this).parents('tr').find(".orderQty").text()
              };
              
          // param 배열에 storeOrder 오브젝트를 담는다.
              param.push(storeOrder);
          });
          
   
          $.ajax({
            type: "POST",
            url: "storeOrderInput",
            headers: {"content-type":"application/json"},
            data: JSON.stringify(param),
            dateType: "text",
            success: function(text) {
               if(text=="success"){
                  location.href="${pageContext.request.contextPath }/sic/storeOrderRequestList"
                  alert("발주가 성공적으로 신청되었습니다.");
               }
            },
            error: function(xhr) {
               alert("에러코드 = "+xhr.status)
            }
          
         });
      }
   });
   
   
   
/*    $("#itemName").change(function() {
      
      var itemName = $(this).val();
      
      $.ajax({
         type: "GET",
         url: "searchItem/"+itemName,
         dateType: "json",
         success: function(json) {
            $("#itemNum").val(json.item.itemNum);
            $("#itemSprice").val(json.item.itemSprice);
            
         },
         error: function(xhr) {
            alert("에러코드 = "+xhr.status) 
         }
       
      });
      
   });  */
   
   
   $("input[name='category1']").change(function() {
      $(".ddd").hide();
      var category=$(".category1:checked").val();
      $(".details").hide();
      $('.category2').removeAttr('checked');
      if(category == 'A') {
         $('#detailA').show();
         $("#repA").prop("checked", true);
      } else if(category == 'B') {
         $('#detailB').show();
         $("#repB").prop("checked", true);
      } else if(category == 'C') {
         $('#detailC').show();
         $("#repC").prop("checked", true);
      } else {
         $('#detailD').show();
         $("#repD").prop("checked", true);
      }
      
   });
   
   
   $("input[name='category2']").change(function() {
      var category1=$(".category1:checked").val();
      var category2=$(".category2:checked").val();
      var itemNum=category1+category2;

      $.ajax({
         type: "POST",
         url: "${pageContext.request.contextPath }/item/product",
         headers: {"content-type":"application/json"},
         data: JSON.stringify({"itemNum":itemNum,"itemUsage":1}),
         dataType: "json",
         success: function(json) {
            $("#CategoryListOption").empty();
            if(json.length==0) {
               $("#CategoryListOption").append("<option value=''>해당품목이 존재하지 않습니다. </option>"); 
               return;
            }
         
                $(json).each(function() {
                   $("#CategoryListOption").append("<option value="+this.itemNum+">"+this.itemName+"</option>"); 
            });    
                
         },
         error: function(xhr) {
            alert("에러코드 = "+xhr.status)
         }
      });
      
   });
   
   
   
   $("#CategoryListOption").change(function() {
      var itemNum = $(this).val();
      
      $.ajax({
         type: "GET",
         url: "${pageContext.request.contextPath }/item/getItem/"+itemNum,
         dataType: "json",
         success: function(json) {
            $("#itemNum").text("("+json.itemNum+")");
            $("#itemName").text(json.itemName);
            $("#itemSprice").text(json.itemSprice);
         },
         error: function(xhr) {
            alert("에러코드 = "+xhr.status)
         }
      });
      
      
   });
   
   
</script>