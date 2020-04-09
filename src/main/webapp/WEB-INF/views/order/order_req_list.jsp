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
			
				<h3>발주요청조회</h3>
				<div class="right"><button type="button" class="a-button big">검색</button></div>
				<hr />
				<table class="table">
					<thead>
						<tr>
							<th>발주요청일</th>
							<td><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th>지점명 / 지점코드</th>
							<td><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
					</tr>
					<tr>
						<th>품목</th>
						<td><input type="search">&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
						<th>발주상태</th>
						<td>
							<label class="gLabel"><input type="checkbox" class="fChk" >발주요청</label>
							<label class="gLabel"><input type="checkbox" class="fChk" >발주완료</label>
							<label class="gLabel"><input type="checkbox" class="fChk" >취소요청</label>
							<label class="gLabel"><input type="checkbox" class="fChk" >취소완료</label>
						</td>
					</tr>
				</thead>
			</table>
			
			<div class="right">
				<button type="button" class="a-button black">전체</button>
				<button type="button" class="a-button gray">발주요청</button>
				<button type="button" class="a-button gray">완료</button>
			</div>
			
			<hr  style="margin-top: -2px;"/>
			<br />
			<div class="date-output right">2020/02/18 - 2020/03/03</div>
			
			<div><button type="button" class="a-button">발주 요청 확인</button>&nbsp;<button type="button" class="a-button red">발주 요청 취소</button></div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>발주타입</th>
							<th>발주요청일</th>
							<th>지점명(코드)</th>
							<th>폼목</th>
							<th>총 수량</th>
							<th>총 금액</th>
							<th>발주확인</th>
							<th>취소</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>A</td>
							<td>2020-03-03</td>
							<td>강남역점(2124121233)</td>
							<td>스타벅스 머그컵 외 1건</td>
							<td>100</td>
							<td>510,000</td>
							<td><button type="button" class="a-button">발주확인</button></td>
							<td><button type="button" class="a-button blackgray">취소확인</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>