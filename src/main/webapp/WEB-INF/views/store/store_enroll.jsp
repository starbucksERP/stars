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
			<div class="information-left">
			
				<div class="right"><button type="button" class="a-button purple medium">수정</button></div>
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>매장코드</th>
							<th>매장명</th>
							<th>점주명</th>
							<th>구분</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>02134567</td>
							<td>강남점</td>
							<td>박잠실</td>
							<td>본점</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>23424427</td>
							<td>강남점</td>
							<td>윤제니</td>
							<td>지점</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td>235232362</td>
							<td>강남점</td>
							<td>이강남</td>
							<td>지점</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			
			<div class="information-right">
				<ul class="enroll-ul">
					<li>매장정보</li>
					<li>점주정보</li>
				</ul>
				<div class="enroll-div">
				<fieldset class="enroll-fieldset">
					<label>
						<span>매장코드  </span><input type="text" />
					</label>
					&nbsp;<button type="button" class="a-button purple">중복 검사</button><br />
					<label>
						<span>매장명 </span><input type="text" />
					</label><br />
					<label>
						<span>매장주소 </span><input type="text" />
					</label><br />
					<label>
						<span>점주명 </span><input type="text" />
					</label><br />
					<span class="staff">매장구분 </span>	
					<label class="gLabel"><input type="radio" class="fChk" >본점</label>
					<label class="gLabel"><input type="radio" class="fChk" >지점</label>
					<label class="gLabel"><input type="radio" class="fChk" >폐점</label>
					<br />
					<label>
						<span>점주명 </span><input type="text" />
					</label><br />
					<span class="staff">매장 이미지 </span>&nbsp;
					<img src="../star.png" alt="" align="top">
				</fieldset>
					<br />
						
					<div class="center">
						<button type="button" class="a-button medium">등 록</button>
						<button type="button" class="a-button purple medium">초기화</button>
					</div>
				</div>
			</div>
		
		</div>

	</div>
</div>