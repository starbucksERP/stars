<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">발주<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">발주계획조회</a><br /><br />
						<a href="">발주현황조회</a><br /><br />
						<a href="">발주입력</a>
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
		
			<h3>발주입력</h3>
			<br />
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th>발주요청일</th>
							<td><label class="gLabel"><input type="date"/>&nbsp;<i class="far fa-calendar-alt"></i></label>
							<th>발주요청매장</th>
							<td><input type="text" value="강남점" readonly="readonly"/></td>
						</tr>
					</thead>
				</table>
			</div>
			
			<hr/>
			<br />
			<div class="date-output right">2020/02/18 - 2020/03/03</div>
			<br />
			<div>
					<button type="button" class="a-button padding-button">항목추가</button>&nbsp;<button type="button" class="a-button padding-button red">항목삭제</button>
					<span style="float: right;"></span>
			</div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>품목코드</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>품목</th>
							<th>수량</th>
							<th>단가</th>
							<th>총액</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>홍홍이</td>
							<td><input type="text" /></td>
							<td>324343</td>
							<td>12415252</td>
							<td class="green-font">발주확인</td>
						</tr>
					</tbody>
				</table>
			</div>
				
			
			
		</div>

	</div>
</div>