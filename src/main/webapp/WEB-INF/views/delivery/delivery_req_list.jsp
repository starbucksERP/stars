<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<td><input type="checkbox" class="rowChk"></td>
							<td>1</td>
							<td>req1234567</td>
							<td>021234567</td>
							<td>배송 준비중</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2</td>
							<td>req1234567</td>
							<td>021234567</td>
							<td>배송 준비중</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>3</td>
							<td>req1234567</td>
							<td>021234567</td>
							<td>배송 준비중</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>4</td>
							<td>req1234567</td>
							<td>021234567</td>
							<td>배송 준비중</td>
						</tr>
					</tbody>
				</table>
				
				<div class="right">
					<button type="button" class="a-button medium">요청확인처리</button>
				</div>
				
			</div>
		
		</div>

	</div>
</div>