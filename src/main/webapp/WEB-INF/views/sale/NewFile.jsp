<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
   <div class="row">
      <div class="sidebar">
         <ul class="side-menu">
           <li>
				<button class="dropdown-btn">재고관리<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-container">
					<a href="${pageContext.request.contextPath}/item/productList">품목현황</a><br /><br />
					<a href="${pageContext.request.contextPath}/item/itemList">재고현황</a>
				</div>
			</li>
			<li>
				<button class="dropdown-btn">판매관리<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-container">
					<a href="${pageContext.request.contextPath}/storeItem/sale_list">판매조회</a><br /><br />
					<a href="${pageContext.request.contextPath}/storeItem/sale_record">판매등록</a>
				</div>
			</li>
         </ul>
      </div>

      <div class="main">
      
         <h3>판매기록조회</h3>
         <form action="sale_list" method="post" id="saleListForm">
            <div class="right"><button type="button" class="a-button big" onclick="submitSale()">검색</button></div>
            <hr />
            <div class="information">
                  <table class="table">
                     <thead>
                        <tr>
                            <th>판매일자</th>
                            <td style="width: 40%;"><label class="gLabel"><input type="text" name="saleDate1" class="datepicker" readonly="readonly" value="${sale.saleDate1}"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
                           &nbsp;-&nbsp;<label class="gLabel"><input type="text" name="saleDate2"  class="datepicker" readonly="readonly" value="${sale.saleDate2}"/>&nbsp;<i class="far fa-calendar-alt"></i></label></td>
                           	<th>지점명</th>
                           	<td><input type="search" value="1021" readonly="readonly" id="storeId" class="storeId"/></td>
                        </tr>
                        <tr>
                           <th>판매상품명</th>
                           <td><input type="search" value="${sale.saleProduct}"  name="saleProduct"/></td>
	                       <th>판매량 범위</th>
	                       <td><input type="number" name="saleQty1" value="${sale.saleQty1}"/> 개&nbsp;&nbsp;-&nbsp;&nbsp;<input type="number" name="saleQty2" value="${sale.saleQty2}"/> 개</td>
                        </tr>
                     </thead>
                  </table>
            </div>
         </form>
      
         <hr/>
         <br />
         <div class="date-output right"><c:choose><c:when test="${empty(sale.saleDate1)}"></c:when><c:otherwise>${sale.saleDate1}&nbsp;~&nbsp;${sale.saleDate2}</c:otherwise></c:choose></div>
         <br />
         <div class="information">
            <table class="table">
               <tbody>
                  <tr>
                     <th>판매날짜</th>
                     <th>판매지점</th>
                     <th>판매상품명</th>
                     <th>판매량</th>
                     <th>총판매액</th>
                     <th width="10%">옵션</th>
                  </tr>
                  <c:choose>
                     <c:when test="${empty(saleList) }">
                        <tr align="center">
                           <td colspan="8">검색된 판매정보가 없습니다.</td>      
                        </tr>
                     </c:when>
                     <c:otherwise>
                   	  <c:set var = "qtyTotal" value = "0" />
                   	  <c:set var = "priceSum" value = "0" />
                        <c:forEach var="sale" items="${saleList }">
                        <tr>
                           <td>${fn:substring(sale.saleDate,0,10)} </td>            
                           <td>${sale.storeId }</td>            
                           <td>${sale.saleProduct}</td>      
                           <td class="qty"><fmt:formatNumber value="${sale.saleQty }" type="number"/> 개 </td>     
                           <td class="price"><fmt:formatNumber value="${(sale.salePrice)*(sale.saleQty)}" type="currency"/></td> 
                           <td><form action="sale_delete" method="post"><button type="button" class="a-button blackgray inner-button deleteSale">삭제</button><input type="hidden" name="saleSeq" value="${sale.saleSeq }"/></form></td>   
                        </tr>
                        <c:set var="qtyTotal" value="${qtyTotal+sale.saleQty}"/>
                        <c:set var="priceSum" value="${priceSum+(sale.salePrice)*(sale.saleQty)}"/>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               		<tr class="blue">
               			<td colspan="3">총 합계</td>
               			<td colspan="1"><fmt:formatNumber value="${qtyTotal}" type="number"/><c:if test="${qtyTotal!=0}">개</c:if> </td>
               			<td colspan="1" ><fmt:formatNumber value="${priceSum}" type="currency"/></td>
               			<td colspan="1"></td>
               		</tr>
               </tbody>
            </table>
         </div>
            
      </div>

   </div>
</div>


<script type="text/javascript">
	$(".deleteSale").click(function() {
		if(confirm("선택하신 판매기록을 삭제하시겠습니까?")){
			$(this).closest("form").submit();
			alert("판매기록이 삭제됬습니다.");
		}
	}); 
	
	
	function submitSale() {
		$("#saleListForm").submit();
	}
	
	
	/* qtySum();
	priceSum();
	
	//테이블 행에 qty 클래스 부여후 그 행들의 합 qtySum 아이디에 구현
	function qtySum(){
		var qtyAdd=0;
		$(".qty").each(function(i) {
			qtyAdd+=Number(($(this).text()));
		})
		$("#qtySum").text(qtyAdd);
	}
	
	// 테이블 행에 price 클래스 부여후 그 행들의 합 priceSum 아이디에 구현
	function priceSum(){
		var priceAdd=0;
		$(".price").each(function(i) {
			priceAdd+=Number(($(this).text()));
		})
		$("#priceSum").text(priceAdd);
	} */
	

	
</script>
