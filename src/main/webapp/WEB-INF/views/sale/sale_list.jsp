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
					<a href="">품목관리</a><br /><br />
					<a href="">재고관리</a><br /><br />
				</div>
			</li>
			<li>
				<button class="dropdown-btn">판매관리<i class="fa fa-caret-down"></i></button>
				<div class="dropdown-container">
					<a href="">판매기록</a><br /><br />
					<a href="">판매현황</a>
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
                           	<td>asdf</td>
                        </tr>
                        <tr>
                            <th>대분류</th>
                            <td>
	                            <select name="category" class="category">
	                            	<option value="">전체</option>
	                            	<option value="A">제조음료 재료</option>
	                            	<option value="B">푸드</option>
	                            	<option value="C">상품</option>
	                            </select>
                            </td>
                           	<th>소분류</th>
                           	<td>
                         		<select name="subCategory" class="subCategory">
                         		</select>
                           	</td>
                        </tr>
                        <tr>
                           <th>판매상품명</th>
                           <td>
                           		<select name="saleProduct" class="saleProduct">
                           		</select>
                           	</td>
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
                     <th>판매지점</th>
                     <th>판매날짜</th>
                     <th>대분류</th>
                     <th>소분류</th>
                     <th>판매상품명</th>
                     <th>판매량</th>
                     <th>총판매액</th>
                     <th>옵션</th>
                  </tr>
                  <c:choose>
                     <c:when test="${empty(saleList) }">
                        <tr align="center">
                           <td colspan="8">검색된 판매정보가 없습니다.</td>      
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="saleItem" items="${saleList }">
                        <tr>
                           <td>${saleItem.sale.storeId }</td>            
                           <td>${fn:substring(saleItem.sale.saleDate,0,10)}</td>            
                           <c:choose>
                           		<c:when test="${fn:startsWith(saleItem.storeItem.itemNum,'A')}">
                          		   <td>커피</td>
                          		   <c:choose>
                           				<c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==01}"><td>원두</td></c:when>
                           				<c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==02}"><td>티백</td></c:when>
                           				<c:otherwise><td>부재료</td></c:otherwise>
                           			</c:choose>
                           		</c:when>
                           		<c:when test="${fn:startsWith(saleItem.storeItem.itemNum,'B')}">
                           			 <td>푸드</td>
                           			 <c:choose>
                           			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==01}"><td>베이커리</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==02}"><td>케이크</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==03}"><td>샌드위치</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==04}"><td>디저트</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==05}"><td>아이스크림</td></c:when>
                           			 <c:otherwise><td>병음료</td></c:otherwise>
                           			 </c:choose>
                           		</c:when>
                           		<c:otherwise>
                           			  <td>상품</td>
                           			  <c:choose>
                           			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==01}"><td>머그</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==02}"><td>글라스</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==03}"><td>텀블러</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==04}"><td>보온병</td></c:when>
                         			 <c:when test="${fn:substring(saleItem.storeItem.itemNum,1,3)==05}"><td>액세서리</td></c:when>
                           			 <c:otherwise><td>커피용품</td></c:otherwise>
                           			 </c:choose>
                           		</c:otherwise> 
                           </c:choose>
                           <td>${fn:substring(saleItem.sale.saleProduct,1,3)}</td>      
                           <td class="qty"><fmt:parseNumber integerOnly= "true" value="${saleItem.sale.saleQty }"/></td>     
                           <td class="price">${saleItem.sale.saleQty }</td> 
                           <td><form action="sale_delete" method="post"><button type="button" class="a-button blackgray inner-button deleteSale">삭제</button><input type="hidden" name="saleSeq" value="${saleItem.sale.saleSeq }"/></form></td>   
                        </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               		<tr>
               			<td colspan="5">총 합계</td>
               			<td colspan="1" id="qtySum"></td>
               			<td colspan="1" id="priceSum">123</td>
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
	
	
	qtySum();
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
	}
	

</script>
