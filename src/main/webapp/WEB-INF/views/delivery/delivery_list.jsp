<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn" style="background-color: #2C2A29;" onclick="location.href='${pageContext.request.contextPath }/deliveryReq'">배송요청조회</button>
					</li>
					<li>
						<button class="dropdown-btn" style="background-color: #669900;" onclick="location.href='${pageContext.request.contextPath }/deliveryList'" >배송조회</button>
					</li>
					
				</ul>
			</div>

			<div class="main">
			
				<h3>배송조회</h3>
				<div class="right"><button type="button" class="a-button big">상세 검색</button></div>
				<hr />
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<th>요청번호</th>
								<td colspan="1"><input type="search" />&nbsp;<a href="${pageContext.request.contextPath }/delivery/choice_store_code.jsp" onClick="window.open(this.href, '', 'width=400, height=430'); return false;" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								<th>매장코드</th>
								<td colspan="1"><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							</tr>
							<tr>
								<th>배송 시작일</th>
								<td colspan="1">
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
								
								<th>배송 완료일</th>
								<td colspan="1">
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
							</tr>
							<tr>
								<th>배송처리 현황</th>
								<td colspan="3">
									<select>
										<option value="">배송처리 현황 선택</option>
										<option value="">1. 배송 준비중</option>
										<option value="">2. 배송중</option>
										<option value="">3. 배송완료</option>
									</select>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				
				<br />
				<br />
				<div class="right">
					<button type="button" class="a-button big black" id="chk" style="float: left;">전체 선택 / 해제</button>
					<button type="button" class="a-button big" id="deliveryStartBtn">배송 시작</button>
				</div>
				<br />
				<br />
				<hr >
				
				<div class="information">
					<table class="table">
						<tbody>
						
							<tr>
								<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
								<th>번호</th>
								<th>요청번호</th>
								<th>매장코드</th>
								<th>배송처리현황</th>
								<th>배송 시작일</th>
								<th>배송 종료일</th>
							</tr>
							<tr>
							<c:choose>
								<c:when test="${empty(deliveryReadyList) }">
									<tr align="center">
										<td colspan="7">검색된 배송요청이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="deliveryReady" items="${deliveryReadyList }">
									<tr>
										<td><input type="checkbox" class="rowChk"  value="${deliveryReady.deliverySeq }"></td>
										<td>${deliveryReady.deliverySeq }</td>				
										<!-- 팝업창 뜨는거 만들어야 함  -->
										<td>${deliveryReady.requestNum }</td>				
										<td>${deliveryReady.storeId }</td>
										<td>${deliveryReady.deliveryState }</td>
										<td>${deliveryReady.deliveryStart }</td>
										<td>${deliveryReady.deliveryEnd }</td>
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
						</tbody>
					</table>
				</div>
				
			
			</div>

		</div>
	</div>
	
	
	
<script type="text/javascript">


// 배송요청을 확인처리하기 위한 함수 //테스팅 확인용 
$("#deliveryStartBtn").click(function() {
		
		
		if($(".rowChk:checked").length==0) {
			alert("배송승인: 배송정보를 선택해 주세요.");
		} else {
			
			var delivery =[];
			var rowChk = $(".rowChk:checked");
			
			rowChk.each(function(i) {
				var tr = rowChk.parent().parent().eq(i);
				var td = tr.children();
				
				var deliverySeq = td.eq(1).text();
				var deliveryState = td.eq(4).text();
				if(deliveryState == 60) {			
				alert(deliverySeq+"번의 배송은 이미 배송중 입니다.");
				} else{
				delivery.push(deliverySeq);					
				}
			});
			
			if(delivery.length!=0) {
				var param={"list":delivery};
			 	 $.ajax({
					type: "POST",
					url: "deliveryStart",
					data: param,
					dateType: "text",
					success: function(text) {
							alert(delivery + "번 배송 = 출하승인 완료")
							location.href="/star/deliveryList"
					},
					error:function(request,status,error){
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			          }
				});  
			} else {
				alert("처리할 배송정보가 없습니다.");
				location.href="/star/deliveryList"
				return;
			}
			
		
		}
	});
			
			

</script>





			
	
	
	
	
	
	
	
	
	
	
	
	
	
	