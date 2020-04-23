<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">지점<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">매입현황</a><br /><br />
						<a href="">매출현황</a><br /><br />
						<a href="">손익분석</a>
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>매입 현황 - 지점</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>기준일자</th>
						<td>
							<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
						</td>
					</tr>
					<tr>
						<th>품목명</th>
						<td><input type="search" /></td>
					</tr>
					<tr>
						<th>거래처</th>
						<td><input type="text" readonly="readonly" disabled="disabled" value="본 사" style="text-align: center;"/></td>
					</tr>
				</thead>
			</table>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th>일자</th>
							<th>거래처명</th>
							<th>품목명</th>
							<th>매입금액</th>
							<th>부가세액</th>
							<th>총금액</th>
						</tr>
						<tr>
							<td>2020-01-03</td>
							<td>강남1호점</td>
							<td>원두 - 블랙 퍼스트 마일드</td>
							<td>40,000</td>
							<td>4,000</td>
							<td>40,000</td>
						</tr>
						<tr>
							<td colspan="3" class="center">합계</td>
							<td>134,000</td>
							<td>1,3400</td>
							<td>147,400</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>