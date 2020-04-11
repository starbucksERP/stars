<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">본사<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">매입현황</a><br /><br />
						<a href="">매출현황</a>
						<a href="">손익분석</a>
					</div>
				</li>
				<li>
					<button class="dropdown-btn">지점<i class="fa fa-caret-down"></i></button>
					<div class="dropdown-container">
						<a href="">매입 월별현황</a><br /><br />
						<a href="">매출 월별현황</a><br /><br />
						<a href="">손익분석</a>
					</div>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>손익분석 - 본사</h3>
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
				</thead>
			</table>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th style="min-width: 70px;">과목</th>
							<th>1월</th>
							<th>2월</th>
							<th>3월</th>
						</tr>
						<tr class="blue">
							<td>매출액</td>
							<td>1234234</td>
							<td>1235</td>
							<td>40,000</td>
						</tr>
						<tr>
							<td>매출원가</td>
							<td>1221341243</td>
							<td>12342341</td>
							<td>40,000</td>
						</tr>
						<tr class="beige">
							<td>매출원가율(%)</td>
							<td>1234123512</td>
							<td>123412341</td>
							<td>40,000</td>
						</tr>
						<tr class="pink">
							<td>매출총이익</td>
							<td>1234123424</td>
							<td>1232351235</td>
							<td>40,000</td>
						</tr>
						<tr class="beige">
							<td>매출총익율(%)</td>
							<td>215123532</td>
							<td>125325235</td>
							<td>40,000</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>