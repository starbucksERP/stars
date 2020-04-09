<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">지점 등록<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">지점 현황<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">지점 정보<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">점주 정보<i class="fa fa-caret-down"></i></button>
				</li>
			</ul>
		</div>

		<div class="main">
			<h3>지점 등록 / 수정</h3>
			<hr />
			<div class="information-left staff-left" >
				<div class="brown staff-head">[다산점] 점주 정보</div>
				<div class="information-left" style="width: 32%">
					<img src="../star.png" alt="" align="middle" style="margin-top: 20px;">
				</div>
				<div class="information-right" style="width: 60%">
					<button type="button" class="a-button green medium" style="margin-left: 20px;">윤제니</button>
					<div>
						<div class="staff" style="font-weight: bold;">주소</div><span class="gray-font">경기도 남양주시 어딘가</span>
					</div>
					<div>
						<div class="staff" style="font-weight: bold;">연락처</div><span class="gray-font">010-0000-0000</span>
					</div>
					<div>
						<div class="staff" style="font-weight: bold;">이메일</div><span class="gray-font">dooly@daru.com</span>
					</div>
				</div>
			</div>
			
			<div class="information-right">
				<h3>[매장명 검색]</h3>
				<div>
					<span class="staff">매장명 :&nbsp;</span>
					<input type="search" />&nbsp;
					<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
				</div>
				<br />
				<hr />
				<div class="right">
					<span class="red-font">매장명</span>을 클릭하시면 점주 정보를 확인할수 있습니다.
				</div>
				<table class="table">
					<tbody>
						<tr>
							<th>매장명</th>
							<th>주소</th>
						</tr>
						<tr>
							<td>강남 1호점</td>
							<td>인천시 연수구 해송로 143</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</div>

	</div>
</div>
