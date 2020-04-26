<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#popupBox {
	width: 400px;
	height: 160px;
	border: 3px solid #4C4C4C;
	background-color: white;
	text-align: center; 
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -40px;
	padding: 5px;
	z-index: 100;
	display: none;
}
.innerMessage {
	width:80%;
	margin:0 auto;
	padding-top: 35px;
	text-align: center;
	z-index: 101;
	color: #4C4C4C;
	font-size: 15px;
}
#popup_mask { 
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none; 
	background-color:#000;
	z-index: 99;
	opacity: 0.5;
}
</style>

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
							<a href="${pageContext.request.contextPath}/storeItem/saleList">판매조회</a><br /><br />
							<a href="${pageContext.request.contextPath}/storeItem/sale_record">판매등록</a>
						</div>
					</li>
				</ul>
			</div>

		<div class="main">
		
			<h3>판매기록조회</h3>
			<div class="right"><button type="button" class="a-button big" onclick="saleList(1)">검색</button></div>
			<hr />
			<div class="information" id="searchBoxDiv">
				<table class="table" >
					<thead>
						<tr>
							<th width="10%">판매일자</th>
							<td width="40%"><label class="gLabel"><input type="date" id="saleDate" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" id="saleDatePair" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th>지점명 / 지점코드</th>
							<td><input type="text" id="storeId" value="1021"/></td>
						</tr>
						<tr>
						   <th>판매상품명</th>
                           <td><input type="search" id="saleProduct"/></td>
	                       <th>판매량 범위</th>
	                       <td><input type="number" id="saleQty"/> 개&nbsp;&nbsp;-&nbsp;&nbsp;<input type="number" id="saleQtyPair"/> 개</td>
						</tr>
					</thead>
				</table>
			</div>
			<div id="popup_mask"></div>
				<div id="popupBox">
					<div class="innerMessage"></div>
					<div><button type='button' class='a-button green inner-button' onclick="closeBox()">확인</button></div>
				</div>
			
			
			<br />
			<hr  style="margin-top: 14px;"/>
			<br />
			
			<div class="date-output right"  id="periodDiv"></div>
			<div class="right"  id="countDiv"></div>
			<br />
			
			
			<div class="information" >
				<table class="table">
					<thead style="line-height: 20px;">
						<tr>
							<th>판매번호</th>
							<th>판매날짜</th>
							<th>판매지점</th>
							<th>판매상품명</th>
							<th>판매량</th>
							<th>총 판매액</th>
							<th width="25%">옵션</th>
						</tr>
					</thead>
					<tbody id="resultSale"></tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var today=new Date();
	var period=new Date();
	period.setDate(today.getDate()-14);
	
	var storeId=$("#storeId").val();
	
	saleList(0);
	
	function saleList(welcome) {
		if (welcome==0) {
			var saleDate=period;
			var saleDatePair=today;
			var saleQty=0;
			var saleQtyPair=100000;
			
		} else {
			var saleDate=$("#saleDate").val();
			var saleDatePair=$("#saleDatePair").val();
			if (saleDate=="" && saleDatePair!="") {
				saleDate=saleDatePair;
			} else if (saleDatePair=="" && saleDate!="") {
				saleDatePair=saleDate;
			} 
			
			var saleQty=$("#saleQty").val();
			var saleQtyPair=$("#saleQtyPair").val();
			if (saleQty==0 && saleQtyPair!=0) {
				saleQty=saleQtyPair;
			} else if (saleQtyPair==0 && saleQty!=0) {
				saleQtyPair=saleQty;
			} 
		}
		
		var saleProduct=$("#saleProduct").val();
		
		$.ajax({
			type: "POST",
			url: "saleList",
			headers: {"content-type":"application/json"},
			data: JSON.stringify({"saleDate":saleDate,"saleDatePair":saleDatePair,"saleProduct":saleProduct,"storeId":storeId,"saleQty":saleQty ,"saleQtyPair":saleQtyPair}),
			dataType: "json",
			success: function(json) {
				$("#resultSale").empty();
				$("#countDiv").html("총 검색결과 : "+json.length+"건");
				
				if(json.length==0) {
					var html="<tr><td colspan='7'>검색된 판매정보가 존재하지않습니다.</td><tr>";
					$("#resultSale").html(html);
					return;
				}
				
				var html="";
	       		$(json).each(function() {
	       			var total=Number(this.saleQty)*Number(this.salePrice);
	       			
	       			html+="<tr><td>"+this.saleSeq+"</td>";
	       			
	        		html+="<td>"+this.saleDate+"</td>"
					+"<td>"+this.storeId+"</td>"
					+"<td class='saleProduct'>"+this.saleProduct+"</td>"
					+"<td class='saleQty'>"+this.saleQty+"</td>"
					+"<td>"+total+"</td>"
					+"<td class='green-font'><button type='button' class='a-button blackgray inner-button' onclick='saleDelete("+this.saleSeq+")'>판매취소</button></td></tr>";
					
				});    
	       		
	       		
				$("#resultSale").html(html);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
	
	
	
	function saleDelete(saleSeq) {
		
		var saleQty=Number($(this).parents('tr').find(".saleQty").text());
		var saleProduct=$(this).parents('tr').find(".saleProduct").text();
		
		$.ajax({
			type: "PUT",
			url: "saleCancel",
			headers: {"content-type":"application/json","X-HTTP-Method-override":"PUT"},
			data: JSON.stringify({"saleQty":saleQty, "saleSeq":saleSeq,"storeId":storeId, "saleProduct":saleProduct}),
			dataType: "text", 
			success: function(text) {
				if(text=="success") {
					openModal("선택된 판매기록이 삭제되었습니다.<br><br><br>");
					saleList(1);
				}
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	
		 
	}

	

	function openModal(message) {
		var message=message;
		$("#popupBox").css({
			"top": (($(window).height()-$("#popupBox").outerHeight())/2+$(window).scrollTop())+"px",
			"left": (($(window).width()-$("#popupBox").outerWidth())/2+$(window).scrollLeft())+"px"
		});
		
		//$("#popup_mask").css("display","block"); //팝업 뒷배경 display block
       // $("#popupBox").css("display","block"); //팝업창 display block
        $(".innerMessage").html(message);
		$("#popup_mask").show();
		$("#popupBox").show(300);  
		$("body").css("overflow","hidden");//body 스크롤바 없애기
		
	}
	
	
	function closeBox() {
		$(".innerMessage").val("");    
		$("#popupBox").hide();
		$("#popup_mask").hide(300); 
		//$("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
        //$("#popupDiv").css("display","none"); //팝업창 display none
        $("body").css("overflow","auto");//body 스크롤바 생성
	}
	
</script>