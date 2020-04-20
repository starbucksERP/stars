<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">배송요청조회</button>
				</li>
				<li>
					<button class="dropdown-btn">배송조회</button>
				</li>
				
			</ul>
		</div>

		<div class="main">
		
			<h3>배송요청조회</h3>
			<br />
			<div class="right">
				<button type="button" class="a-button black medium" id="chk" style="float: left;">전체 선택 / 해제</button>
				<select>
					<option value="">검색조건 선택</option>
					<option value="">1. 요청번호</option>
					<option value="">2. 매장코드</option>
					<option value="">-------</option>
				</select>&nbsp;
				<input type="search" />&nbsp;
				<button type="button" class="a-button" style="padding: 3px 20px">검색</button>
			</div>
			
			<br />
			<hr />
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>요청번호</th>
							<th>매장코드</th>
							<th>배송처리현황</th>
						</tr>
						<tr>
						<c:choose>
								<c:when test="${empty(deliveryReqList) }">
									<tr align="center">
										<td colspan="5">검색된 배송요청이 없습니다.</td>		
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="deliveryReq" items="${deliveryReqList }">
									<tr>
										<td><input type="checkbox" class="rowChk" value="${deliveryReq.deliverySeq }"></td>
										<td>${deliveryReq.deliverySeq }</td>				
										<!-- 팝업창 뜨는거 만들어야 함  -->
										<td>${deliveryReq.requestNum }</td>				
										<td>${deliveryReq.storeId }</td>
										<td>${deliveryReq.deliveryState }</td>
									</tr>	
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"><div class="message center red-font" ></div></td>
						</tr>
					</tfoot>
				</table>
				
				<div class="right">
					<button type="button" class="a-button medium" id="reqConfirmationBtn" >
					요청확인처리
					</button>
				</div>
				
			</div>
		
		</div>

	</div>
</div>

<script type="text/javascript">

// 배송요청을 확인처리하기 위한 함수 
$("#reqConfirmationBtn").click(function() {
		
		var delivery = [];
		
		if($(".rowChk:checked").length==0) {
			$(".message").text("요청 확인할 배송정보를 체크 해주세요.")
		} else {
			$(".rowChk:checked").each(function(i) {
				delivery = {
						deliverySeq:$(".rowChk").val()
				};
			});	
			
			  $.ajax({
					type: "POST",
					url: "delReqConfirm",
					headers: {"content-type":"application/json"},
					data: JSON.stringify(delivery),
					dateType: "text",
					success: function(text) {
						if(text=="success") {
							alert("배송요청이 확인 되었습니다.")
							location.href="/deliveryReq"
						}
					},
					error: function(xhr) {
						alert("에러코드 = "+xhr.status)
					}
					, error:function(request,status,error){
			             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			          }
    
				});
		}
	});
			
			

</script>





























