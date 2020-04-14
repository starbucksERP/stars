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
		
			<h3>발주현황조회</h3>
			<div class="right"><button type="button" class="a-button big">검색</button></div>
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th>발주일</th>
							<td><label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							&nbsp;-&nbsp;<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label></td>
							<th>발주번호</th>
							<td><input type="search" /></td>
						</tr>
						<tr>
							<th>지점명 / 지점코드</th>
							<td><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							<th>담당자</th>
							<td><input type="search" /></td>
						</tr>
						<tr>
							<th>품목</th>
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
				<button type="button" class="a-button gray">진행중</button>
				<button type="button" class="a-button gray">미입고</button>
				<button type="button" class="a-button gray">완료</button>
			</div>
			
			<hr  style="margin-top: -2px;"/>
			<br />
			<div class="date-output right">2020/02/18 - 2020/03/03</div>
			<br />
			<div>
					<button type="button" class="a-button padding-button">출고</button>&nbsp;<button type="button" class="a-button padding-button red">취소</button>
					<span style="float: right;"><button type="button" class="a-button"><i class="fas fa-plus"></i>&nbsp;신규 발주</button></span>
			</div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>발주일</th>
							<th>발주번호</th>
							<th>지점명(코드)</th>
							<th>담당자</th>
							<th>품목</th>
							<th>진행상태</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-03</td>
							<td>2020341128124</td>
							<td>강남역점(2124121233)</td>
							<td>홍홍이</td>
							<td>스타벅스 머그컵 외 1건</td>
							<td class="green-font">발주확인</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>2020-03-04</td>
							<td>2020191519484</td>
							<td>서초역점(2124121233)</td>
							<td>꾹꾹이</td>
							<td>리저브_노브크릭위스키배럴과테말라</td>
							<td class="red-font">대기-미입고</td>
						</tr>
						
					</tbody>
				</table>
			</div>
				
			
			
		</div>

	</div>
</div>