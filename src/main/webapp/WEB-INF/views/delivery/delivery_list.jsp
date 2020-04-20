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
			
				<h3>배송조회</h3>
				<div class="right"><button type="button" class="a-button big">상세 검색</button></div>
				<hr />
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<th>요청번호</th>
								<td colspan="1"><input type="search" />&nbsp;<a href="${pageContext.request.contextPath }/delivery/choice_store_code.jsp" onClick="window.open(this.href, '', 'width=400, height=430'); return false;" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
								<th>매장코드</th>
								<td colspan="1"><input type="search" />&nbsp;<a href="" class="a-button white" style="font-size: 15px;"><i class="fas fa-file-alt"></i></a></td>
							</tr>
							<tr>
								<th>배송 시작일</th>
								<td colspan="1">
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
								
								<th>배송 완료일</th>
								<td colspan="1">
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;&nbsp;~&nbsp;&nbsp;</label>
									<label class="gLabel"><input type="date" />&nbsp;<i class="far fa-calendar-alt"></i></label>
								</td>
							</tr>
							<tr>
								<th>배송처리 현황</th>
								<td colspan="3">
									<select>
										<option value="">배송처리 현황 선택</option>
										<option value="">1. 배송 준비중</option>
										<option value="">2. 배송중</option>
										<option value="">3. 배송완료</option>
									</select>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				
				<br />
				<br />
				<div class="right">
					<button type="button" class="a-button big black" id="chk" style="float: left;">전체 선택 / 해제</button>
					<button type="button" class="a-button big">배송 시작</button>
				</div>
				<br />
				<br />
				<hr >
				
				<div class="information">
					<table class="table">
						<tbody>
							<tr>
								<th style="width: 10px;"><input type="checkbox" class="allChk"></th>
								<th>번호</th>
								<th>요청번호</th>
								<th>매장코드</th>
								<th>배송처리현황</th>
								<th>배송 시작일</th>
								<th>배송 종료일</th>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>1</td>
								<td>req1234567</td>
								<td>021234567</td>
								<td>배송 준비중</td>
								<td>2020-02-18</td>
								<td>2020-03-23</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>2</td>
								<td>req1234567</td>
								<td>021234567</td>
								<td>배송 준비중</td>
								<td>2020-02-18</td>
								<td>2020-03-23</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>3</td>
								<td>req1234567</td>
								<td>021234567</td>
								<td>배송 준비중</td>
								<td>2020-02-18</td>
								<td>2020-03-23</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="rowChk"></td>
								<td>4</td>
								<td>req1234567</td>
								<td>021234567</td>
								<td>배송 준비중</td>
								<td>2020-02-18</td>
								<td>2020-03-23</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			
			</div>

		</div>
	</div>