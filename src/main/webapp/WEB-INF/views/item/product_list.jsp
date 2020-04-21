<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">품목 현황<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">재고 현황<i class="fa fa-caret-down"></i></button>
				</li>
			</ul>
		</div>

		<div class="main">
		
			<h3>품목 현황</h3>
			<div class="right"><button type="button" class="a-button big"><i class="fas fa-search"></i>&nbsp;검색</button></div>
			<hr />
			<table class="table">
				<thead>
					<tr>
						<th>품목코드</th>
						<td><input type="search" >&nbsp;<a href="" class="a-button gray search-icon"><i class="fas fa-search"></i></a></td>
					</tr>
					<tr>
						<th>품목명</th>
						<td><input type="search" /></td>
					</tr>
					<tr>
						<th>품목 구분</th>
						<td>
							<label class="gLabel"><input type="radio" class="fChk" >전체</label>&nbsp;&nbsp;|
							<label class="gLabel"><input type="radio" class="fChk" >원재료</label>
							<label class="gLabel"><input type="radio" class="fChk" >부재료</label>
							<label class="gLabel"><input type="radio" class="fChk" >비품</label>
							<label class="gLabel"><input type="radio" class="fChk" >푸드</label>
							<label class="gLabel"><input type="radio" class="fChk" >MD상품</label>
						</td>
					</tr>
				</thead>
			</table>
			
			<div class="right">
				<button type="button" class="a-button sea medium"><i class="fas fa-plus-circle"></i>&nbsp;품목 등록</button>
				<button type="button" class="a-button purple medium"><i class="fas fa-edit"></i>&nbsp;품목 수정</button>
				<button type="button" class="a-button red medium"><i class="fas fa-times"></i>&nbsp;품목 삭제</button>
			</div>
			
			<br />
			<hr>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>번호</th>
							<th>품목코드</th>
							<th>폼목명</th>
							<th>단위</th>
							<th>단가</th>
							<th>품목 구분</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>A</td>
							<td>A001</td>
							<td>원두 - 블랙 퍼스트 마일</td>
							<td>1.5kg</td>
							<td>5,000</td>
							<td>[원재료]</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>

