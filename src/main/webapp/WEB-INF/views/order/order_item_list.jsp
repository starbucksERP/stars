<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
		<div class="row">
			<div class="sidebar">
				<ul class="side-menu">
					<li>
						<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="">발주요청조회</a><br /><br />
							<a href="">발주요청조회</a>
						</div>
					</li>
					<li>
						<button class="dropdown-btn">구매<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="">구매계획</a><br /><br />
							<a href="">구매현황</a><br /><br />
							<a href="">구매입력</a>
						</div>
					</li>
					<li>
						<button class="dropdown-btn">입출하기록<i class="fa fa-caret-down"></i></button>
						<div class="dropdown-container">
							<a href="">입출하조회</a>
						</div>
					</li>
					
				</ul>
			</div>

		<div class="main">
		
			<h3>발주현황조회</h3>
			<div class="right"><button type="button" class="a-button big">검색</button></div>
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th width="10%">발주요청일</th>
							<td width="40%"><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th width="10%">발주요청번호</th>
							<td width="40%"><input type="search" /></td>
						</tr>
						<tr>
							<th>지점명 / 지점코드</th>
							<td><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							<th>품목</th>
							<td><input type="text">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						</tr>
						<tr>
							<th>진행상태</th>
							<td>
								<label class="gLabel"><input type="checkbox" class="fChk" >배송준비</label>
								<label class="gLabel"><input type="checkbox" class="fChk" >대기(미입고)</label>
								<label class="gLabel"><input type="checkbox" class="fChk" >출고</label>
								<label class="gLabel"><input type="checkbox" class="fChk" >종결</label>
							</td>
							<th>발주요청타입</th>
							<td>
								<label class="gLabel"><input type="radio" class="fChk" >전체</label>&nbsp;&nbsp;&nbsp;|
								<label class="gLabel"><input type="radio" class="fChk" >자동발주</label>
								<label class="gLabel"><input type="radio" class="fChk" >수동발주</label>
							</td>
						</tr>
					</thead>
				</table>
			</div>
			
		   	<div class="right" style="float: right;">
	            <ul class="order-sta">
	               <li class="blackgray">전체</li>
	               <li >진행중</li>
	               <li >미입고</li>
	               <li >종결</li>
	            </ul>
        	 </div>
			
			<br />
			<hr  style="margin-top: 14px;"/>
			<br />
			
			<div class="date-output right">2020/02/18 - 2020/03/03</div>
			<br />
			
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th>발주타입</th>
							<th>발주요청일</th>
							<th>발주번호</th>
							<th>지점명(코드)</th>
							<th>품목</th>
							<th>진행상태</th>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="green-font">&nbsp;발주확인</td>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="red-font">취소완료</td>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="gray-font">대기-미입고</td>
						</tr>
						<tr>
							<td>D</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td class="green-font">종결</td>
						</tr>
						<tr>
							<td>A</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>리저브 노브리틱스와 과테말라</td>
							<td>출고</td>
						</tr>
						
						
					</tbody>
				</table>
			</div>
				
			
			
		</div>


	</div>
</div>