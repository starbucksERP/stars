<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
   <div class="row">
      <div class="sidebar">
         <ul class="side-menu">
            <li>
               <button class="dropdown-btn">발주관리<i class="fa fa-caret-down"></i></button>
               <div class="dropdown-container">
                  <a href="${pageContext.request.contextPath}/sic/storeOrderReq">발주요청조회</a><br /><br />
                  <a href="${pageContext.request.contextPath}/sic/storeOrderSta">발주현황조회</a><br /><br />
                  <a href="${pageContext.request.contextPath}/sic/storeOrderInput">발주입력</a>
               </div>
            </li>
            <li>
               <button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
               <div class="dropdown-container">
                  <a href="${pageContext.request.contextPath}/sic/storeReceipt">입출하조회</a>
                  <a href="${pageContext.request.contextPath}/delivery/deliveryList">배송조회</a>
               </div>
            </li>
            
         </ul>
      </div>

      <div class="main">
      
         <h3>발주현황조회</h3>
         <form:form action="storeOrderSta" method="post" id="form" modelAttribute="orderItem">
            <div class="right"><button type=button class="a-button big search" onclick="startState()">검색</button><input type="hidden"/></div>
            <hr />
            <div class="information">
                  <table class="table">
                     <thead>
                        <tr>
                           <th>발주일</th>
                           <td>
                           <label class="gLabel"><input type="text" name="requestDate" class="datepicker" value=""/>&nbsp;<i class="far fa-calendar-alt"></i></label> &nbsp;-&nbsp;
                           <label class="gLabel"><input type="text" name="requestDatePair"  class="datepicker"  value=""/>&nbsp;<i class="far fa-calendar-alt"></i></label></td>
                           <th>발주지점</th>
                           <td><form:input path="storeId" id="storeId" name="storeId" value="1021"/></td>
                        </tr>
                        <tr>
                           <th>품목명</th>
                           <td>
                           		<input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a>
                           </td>
                           <th>품목코드</th>
                           <td>
                           		<form:input path="itemNum" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a>
                          	</td>
                        </tr>
                        <tr>
                           <th>진행상태</th>
                           <td>	
                           		<form:checkbox path="states" class="fChk" label="발주요청" value="10" />
                           		<form:checkbox path="states" class="fChk" label="발주완료" value="20" />
                           		<form:checkbox path="states" class="fChk" label="배송중"   value="60" />
                           		<form:checkbox path="states" class="fChk" label="입고완료" value="70" />
                           </td>
                           <th>가격 범위</th>
                           <td><form:input path="price1"/>&nbsp;-&nbsp;<form:input path="price2"/></td>
                        </tr>
                     </thead>
                  </table>
            </div>
         </form:form>
      
      <!--    <div class="right" style="float: right;">
            <ul class="order-sta">
               <li class="blackgray" id="All">전체</li>
               <li id="Ing">발주진행</li>
               <li id="End">완료</li>
            </ul>
         </div> -->
         <br />
         <hr style="margin-top: 14px;" />
         <br />
         <div class="date-output right"><c:choose><c:when test="${empty(orderItem.requestDate)}"></c:when><c:otherwise>${orderItem.requestDate}&nbsp;~&nbsp;${orderItem.requestDatePair}</c:otherwise></c:choose></div>
         <br />
         <div>
               <button type="button" class="a-button padding-button" id="checkStoreOrder">입고확인</button>&nbsp;<button type="button" class="a-button padding-button red" id="cancelStoreOrder">취소요청</button>
         </div>
         <div class="information">
            <table class="table">
               <tbody>
                  <tr>
                     <th><input type="checkbox" class="allChk"></th>
                     <th>발주일자</th>
                     <th>요청번호</th>
                     <th>품목</th>
                     <th>총 수량</th>
                     <th>총 금액</th>
                     <th>진행상태</th>
                     <th>요청</th>
                  </tr>
                  <c:choose>
                     <c:when test="${empty(orderItemList) }">
                        <tr align="center">
                           <td colspan="8">검색된 발주정보가 없습니다.</td>      
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="oi" items="${orderItemList }">
                        <tr>
                           <td><input type="checkbox" class="rowChk" value="${oi.requestState}"></td>
                           <td>${fn:substring(oi.requestDate,0,10)}</td>            
                           <td>${oi.requestNum }</td>            
                           <td>${oi.itemNum }</td>
                           <td>${oi.orderQty }</td>
                           <td>${oi.itemSprice }</td> 
                           <c:choose>
                              <c:when test="${oi.requestState==20}">
                                 <td class="darkgreen-font">발주완료</td>
                              </c:when>
                              <c:when test="${oi.requestState==60}">
                                 <td class="beige-font">배송중</td>
                              </c:when>
                              <c:when test="${oi.requestState==70}">
                                 <td class="blue-font">입고완료</td>
                              </c:when>
                               <c:when test="${oi.requestState==99}">
                                 <td class="red-font">발주취소</td>
                              </c:when>
                              <c:otherwise>
                                 <td class="green-font">발주요청</td>
                              </c:otherwise>
                           </c:choose>
                           <td><form action="" method="post"><button type="button" class="a-button blackgray inner-button storeOrderCancel">취소</button></form></td>   
                        </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </tbody>
            </table>
         </div>
            
      </div>

   </div>
</div>


<script type="text/javascript">
	
	var param = [];
 	var storeOrder=[];
 	
 	function check() {
 	 	
 	 	if($('.rowChk:checked').length==0){
			$(".message").text("처리할 리스트를 체크해주세요")
		}else{
		    $(".rowChk:checked").each(function(i) {
		 
		    	var tr=$(this).parents('tr');
		    	
		    	
		    	storeOrder = {
		    		requestState	: $(this).val(),
		    		requestNum		: tr.find("td:eq(2)").text(),	
	        		itemNum       	: tr.find("td:eq(3)").text(),
		    		orderQty		: tr.find("td:eq(4)").text(),
		    		itemSprice		: tr.find("td:eq(5)").text(),
		        	storeId			: $("#storeId").val()
	        	};
		    	
		        param.push(storeOrder);
		    });
		}
	}
 	
 	
	
	$("#checkStoreOrder").click(function() {
		if(confirm("입고처리 하시겠습니까?")){
			check();
			
		    $.ajax({
				type: "POST",
				url: "checkStoreOrder",
				headers: {"content-type":"application/json"},
				data: JSON.stringify(param),
				dateType: "text",
				success: function(text) {
					if(text=="success") {
						alert("입고완료 처리되었습니다.");
						location.href="${pageContext.request.contextPath }/sic/storeOrderSta"
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}else{
			return;
		}
	});
	
	$("#cancelStoreOrder").click(function() {
		if(confirm("발주 취소 처리 하시겠습니까?")){
			check();
			
		    $.ajax({
				type: "POST",
				url: "cancelStoreOrder",
				headers: {"content-type":"application/json"},
				data: JSON.stringify(param),
				dateType: "text", 
				success: function(text) {
					if(text=="success") {
						alert("발주가 취소되었습니다.");
						location.href="${pageContext.request.contextPath }/sic/storeOrderSta"
					}
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
		    
			});
		}else{
			return;
		}
	});
	
	
		
	function startState(){
		
		var states=[];
			
		 $(".fChk:checked").each(function(i) {
			 if($(this).val()=='10'){
				 states.push(10);
			 }else if($(this).val()=='20'){
				 states.push(20);
			 }else if($(this).val()=='60'){
				 states.push(60);
			 }else{
				 states.push(70);
			 }
		 });
			 
		 if(states.length==0){
			 states.push(10);
			 states.push(20);
			 states.push(60);
			 states.push(70);
		 }
		 
		 $("input[type='hidden']").val(states);
		 $("#form").submit();
	}
	
	
	
</script>
