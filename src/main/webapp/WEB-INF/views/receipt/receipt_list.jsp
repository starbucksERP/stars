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
			
				<h3>입출하기록</h3>
				<div class="right"><button type="button" class="a-button big">검색</button></div>
				<hr />
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<th>날짜</th>
								<td><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								&nbsp;~&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
								<th>발주/구매 번호</th>
								<td><input type="search" /></td>
							</tr>
							<tr>
								<th>물품코드</th>
								<td><input type="text">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
								<th>진행상태</th>
								<td>
									<label class="gLabel"><input type="checkbox" class="fChk" >준비</label>
									<label class="gLabel"><input type="checkbox" class="fChk" >대기</label>
									<label class="gLabel"><input type="checkbox" class="fChk" >출고</label>
									<label class="gLabel"><input type="checkbox" class="fChk" >완료</label>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				
				<div class="right">
					<button type="button" class="a-button black">전체</button>
					<button type="button" class="a-button gray">입고</button>
					<button type="button" class="a-button gray">출고</button>
					<button type="button" class="a-button gray">요청확인</button>
				</div>
				
				<hr  style="margin-top: -2px;"/>
			<br />
			<div class="date-output right">최근 2주간의 기록 입니다.2020/02/18 - 2020/03/03</div>
			<br />
		<!-- 	<div>
					<button type="button" class="a-button padding-button">출고</button>&nbsp;<button type="button" class="a-button padding-button red">취소</button>
					<span style="float: right;"><button type="button" class="a-button"><i class="fas fa-plus"></i>&nbsp;신규 발주</button></span>
			</div> -->
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th>번호</th>
							<th>날짜</th>
							<th>발주/구매번호</th>
							<th>품목(코드)</th>
							<th>수량</th>
							<th>자동/수정</th>
							<th>담당자</th>
							<th>입하/출하</th>
						</tr>
						<tr class="blue">
							<td>4</td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>스타벅스 머그컵</td>
							<td>500</td>
							<td>H</td>
							<td>김대리</td>
							<td>입하</td>
						</tr>
						<tr class="pink">
							<td>3</td>
							<td>2020-03-02</td>
							<td>2020123131234</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td>1500</td>
							<td>H</td>
							<td>김대리</td>
							<td>출하</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			
		
		
		</div>

	</div>
</div>

