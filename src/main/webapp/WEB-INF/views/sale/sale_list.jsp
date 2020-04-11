<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">판매 현황<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">판매 등록<i class="fa fa-caret-down"></i></button>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>판매 현황</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>기준일자</th>
						<td colspan="3">
							<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
						</td>
					</tr>
					<tr>
						<th>대분류</th>
						<td></td>
						<th>소분류</th>
						<td></td>
					</tr>
					<tr>
						<th>품목명</th>
						<td colspan="3"><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
					</tr>
				</thead>
			</table>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th ><input type="checkbox" class="allChk"></th>
							<th>지점</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>상품명</th>
							<th>수량</th>
							<th>판매 날짜</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>