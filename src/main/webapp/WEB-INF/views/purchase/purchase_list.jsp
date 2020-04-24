<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/order/orderRequestList">발주요청조회</a><br /><br />
							<a href="${pageContext.request.contextPath}/order/orderStateList">발주현황조회</a></div>
					</li>
					<li>
						<button class="dropdown-btn">구매<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/purchase/purchasePlan">구매계획</a><br /><br />
							<a href="${pageContext.request.contextPath}/purchase/purchaselist">구매현황</a><br /><br />
							<a href="${pageContext.request.contextPath}/purchase/purchaseAdd">구매입력</a>
						</div>
					</li>
					<li>
						<button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="${pageContext.request.contextPath}/order/history">입출하조회</a>
						</div>
					</li>
				</ul>
			</div>

			<div class="main">
			
				<h3>구매현황조회</h3>
				<div class="right">
				<button type="button" class="a-button medium" onclick="location.href='${pageContext.request.contextPath }/purchase/purchaseList'"><i class="fas fa-search"></i>&nbsp;검색 초기화</button>
				<button type="button" class="a-button medium" onclick="location.href='${pageContext.request.contextPath }/purchase/futureList'">구매예약현황</button>
				<button type="button" class="a-button medium"><i class="fas fa-search"></i>&nbsp;검색</button>
				</div>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th>구매일</th>
							<td><label class="gLabel"><input type="date" id="purchaseDate" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" id="purchaseDateTwo" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th>구매번호</th>
							<td><input type="search" id="requestNum" /></td>
						</tr>
						<tr>
							<th>거래처명</th>
							<td><input type="search" id="itemVendor"/>&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							<th>구매타입</th>
							<td>
								<label class="gLabel"><input type="radio" class="fChk purType" value="0"  >전체</label>
								<label class="gLabel"><input type="radio" class="fChk purType" value="1" >대리점</label> 
								<label class="gLabel"><input type="radio" class="fChk purType" value="2" >본사 자동</label> 
								<label class="gLabel"><input type="radio" class="fChk purType" value="3" >본사 수동</label>
							</td>
						</tr>
						<tr>
							<th>물품코드</th>
							<td><input type="search" id="itemNum">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
							<th>가격범위</th>
							<td><input type="text" id="itemPprice" class="number"/>&nbsp;-&nbsp;<input type="text" id="itemPpriceTwo" class="number"/></td>
						</tr>
					</thead>
				</table>
				
				<div class="right" style="float: right;">
		            <ul class="order-sta">
		               <li id="purchaseTap" onclick="location.href='${pageContext.request.contextPath }/purchase/purchaseList'">전체</li>
		               <li id="purchaseTapReq" value="30" onclick="location.href='${pageContext.request.contextPath }/purchase/purchaseReq'">구매요청</li>
		               <li id="purchaseTap" onclick="location.href='${pageContext.request.contextPath }/purchase/inProcess'">구매진행</li>
		               <li >구매종결</li>
		            </ul>
	        	 </div>
				<br />
				<hr  style="margin-top: 14px;"/>
				<br />
				<!-- <div class="date-output right">2020/02/18 - 2020/03/03</div>-->
				 <br />
				<div>
					<button type="button" class="a-button green padding-button">구매확인</button>&nbsp;
					<button type="button" class="a-button green padding-button">구매종결</button>
				<div class="right"  id="countDiv">출력검사</div>
				</div>
				<div class="information">
					<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>요청번호</th>
							<th>구매방식</th>
							<th>구매일자</th>
							<th>거래처</th>
							<th>물품코드</th>
							<th>물품명</th>
							<th>구매수량</th>
							<th>총 금액</th>
							<th>진행상태</th>
							<th>취소여부</th>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
	// number 가격 범위에 숫자만 입력 및 콤마 입력
	
		//3자리 단위마다 콤마 생성
		function addCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	 
		//모든 콤마 제거
		function removeCommas(x) {
		    if(!x || x.length == 0) return "";
		    else return x.split(",").join("");
		}
		
		$(".number").on("focus", function() {
		    var x = $(this).val();
		    x = removeCommas(x);
		    $(this).val(x);
		}).on("focusout", function() {
		    var x = $(this).val();
		    if(x && x.length > 0) {
		        if(!$.isNumeric(x)) {
		            x = x.replace(/[^0-9]/g,"");
		        }
		        x = addCommas(x);
		        $(this).val(x);
		    }
		}).on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		
		
		// ================================================================== 여기부터
		displayPurchaseList();
		
		function displayPurchaseList() {
			
			/* 
			var purchaseSeq=$("#purchaseSeq").val();
			var requestNum=$("#requestNum").val();
			var purchaseType=$("#purchaseType").val();
			var purchaseDate=$("#purchaseDate").val();
			var purchaseDateTwo=$("#purchaseDateTwo").val();
			var itemVendor=$("#itemVendor").val();
			var itemNum=$("#itemNum").val();
			var itemName=$("#itemName").val();
			var itemQty=$("#itemQty").val();
			var itemPprice=$("#itemPprice").val();
			var itemPpriceTwo=$("#itemPpriceTwo").val();
			// 버튼으로 있어서 추후 수정해함
			var purchaseState=$("#purchaseTapReq").val();
			
			var pType=[];
			
			$(".purType:checked").each(function(i) {
				pType.push($(this).val());
			});
			 // json편집으로 추후수정
			if(pType.length==0){
				pType.push(10);
				pType.push(20);
				pType.push(99);
			}
			 */ 
			
			
			$.ajax({
				type: "GET",
				url: "pList",
				/*
				headers: {"content-type":"application/json"},
				data: JSON.stringify(
						{"purchaseSeq":purchaseSeq,"requestNum":requestNum,"purchaseType":purchaseType,"purchaseDate":purchaseDate,
							"itemVendor":itemVendor,"itemNum":itemNum,"itemName":item.itemName,"itemQty":itemQty,
							"itemPprice":itemPprice, "purchaseState":purchaseState
							}),*/
				dataType: "json",
				success: function(json) {
					//$("#displayList").empty();
					//$("#periodDiv").html("[ "+requestDate+" ~ "+requestDatePair+" ]"); // 맨처음, 날짜없는 경우 null
					$("#countDiv").html("총 검색결과 : "+json.purchaseResult.length+"건");
					
					if(json.purchaseResult.length==0) {
						var html="<tr><td colspan='11'>검색된 구매기록이 없습니다.</td><tr>";
						$("#displayList").html(html);
						return;
					}
					
					var html="";
		       		$(json.purchaseResult).each(function(i) {
		       			var totalPrice=Number(json.purchaseResult[i].itemQty)*Number(json.purchaseResult[i].itemPprice);
		       			
		       			html+="<tr>";
		       			html+="<td><input type='checkbox' class='rowChk' value='"+json.purchaseResult[i].requestNum+"'></td>";
		       			html+="<td>"+json.purchaseResult[i].requestNum+"</td>";
		       			
		       			if (json.purchaseResult[i].purchaseType == 1) {
		       				html+="<td class='blue-font'>대리점</td>";
		       			} else if (json.purchaseResult[i].purchaseType == 2) {
		       				html+="<td style='color:green'>본사 자동</td>";
		       			} else if (json.purchaseResult[i].purchaseType == 3) { 
		       				html+="<td class='red-font' >본사 수동</td>";
		       			}
		       			
		        		html+="<td>"+json.purchaseResult[i].purchaseDate+"</td>"
						+"<td>"+json.purchaseResult[i].itemVendor+"</td>"
						+"<td>"+json.purchaseResult[i].itemNum+"</td>"
						+"<td>"+json.purchaseResult[i].item.itemName+"</td>"
						+"<td>"+json.purchaseResult[i].itemQty+"</td>"
						+"<td>"+totalPrice+"</td>";
						
						if(json.purchaseResult[i].purchaseState==30) {
							html+="<td style='color:green'>구매 요청</td>";
						} else if(json.purchaseResult[i].purchaseState==31) {
							html+="<td class='blue-font'>구매중</td>";
						} else if(json.purchaseResult[i].purchaseState==32) {
							html+="<td class='red-font'>구매 완료</td>";
						} else if(json.purchaseResult[i].purchaseState==33) {
							html+="<td class='red-font'>본사 입고완료</td>";
						} else if(json.purchaseResult[i].purchaseState==99) {
							html+="<td>구매 취소</td>";
						} 
						if(json.purchaseResult[i].purchaseType==2 && json.purchaseResult[i].purchaseState==30){
							html+="<td><button type='button' class='a-button red inner-button'>취소</button></td>";
						}else if(json.purchaseResult[i].purchaseType==3 && json.purchaseResult[i].purchaseState==30){
							html+="<td><button type='button' class='a-button red inner-button'>취소</button></td>";
						}else {
							html+="<td>취소 불가</td>";
						}
						
						html+="</tr>";
						
					});    
		       			$(".table > tbody").append(html);
		       		
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status)
				}
			});
		}
		
		
		

	
</script>


							<%-- <tr>
							<c:choose>
								<c:when test="${empty(purchaseList) }">
									<tr align="center">
										<td colspan="11">검색된 구매기록이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="purchaseList" items="${purchaseList }">
									<tr>
										<td><input type="checkbox" class="rowChk"  value="${purchaseList.purchaseSeq }"></td>
										<td>${purchaseList.requestNum }</td>
										<c:choose>
										<c:when test="${purchaseList.purchaseType==1 }">
										<td class="blue-font">대리점</td>
										</c:when>
										<c:when test="${purchaseList.purchaseType==2 }">
										<td style="color:green">본사 자동</td>
										</c:when>
										<c:when test="${purchaseList.purchaseType==3 }">
										<td class="red-font" >본사 수동</td>										
										</c:when>
										</c:choose>	
										<c:set var="purchaseDate" value="${purchaseList.purchaseDate }"/>
										<td>${fn:substring(purchaseDate,0,10) }</td>
										<td>${purchaseList.itemVendor }</td>
										<td>${purchaseList.itemNum }</td>				
										<td>${purchaseList.item.itemName }</td>				
										<td>${purchaseList.itemQty }</td>
										<c:set var="itemQty" value="${purchaseList.itemQty }"/>
										<c:set var="totalPrice" value="${purchaseList.itemPprice }"/>
										<td>${itemQty*totalPrice }</td>
										<c:choose>
										<c:when test="${purchaseList.purchaseState==30 }">
										<td style="color:green">구매 요청</td>
										</c:when>
										<c:when test="${purchaseList.purchaseState==31 }">
										<td class="blue-font">구매중</td>
										</c:when>
										<c:when test="${purchaseList.purchaseState==32 }">
										<td class="red-font">구매 완료</td>
										</c:when>
										<c:when test="${purchaseList.purchaseState==33 }">
										<td class="red-font">본사 입고완료</td>
										</c:when>
										<c:when test="${purchaseList.purchaseState==99 }">
										<td>구매 취소</td>
										</c:when>
										</c:choose>
										<c:choose>
										<c:when test="${purchaseList.purchaseType=='2' && purchaseList.purchaseState=='30'}">
										<td><button type="button" class="a-button red inner-button">취소</button></td>
										</c:when>
										<c:when test="${purchaseList.purchaseType=='3' && purchaseList.purchaseState=='30'}">
										<td><button type="button" class="a-button red inner-button">취소</button></td>
										</c:when>	
										<c:otherwise>
										<td>취소 불가</td>
										</c:otherwise>
										</c:choose>		
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr> --%>

