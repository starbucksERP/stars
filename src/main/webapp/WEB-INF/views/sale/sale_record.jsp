<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="sidebar">
			<ul class="side-menu">
				<li>
					<button class="dropdown-btn">판매 기록<i class="fa fa-caret-down"></i></button>
				</li>
				<li>
					<button class="dropdown-btn">판매 현황<i class="fa fa-caret-down"></i></button>
				</li>
			</ul>
		</div>

		<div class="main">
			
			<h3>판매 등록</h3>
			<br />
			<hr />
			<div class="information">
				<table class="table">
					<thead>
						<tr>
							<th>판매등록일</th>
							<td><label class="gLabel"><input type="date" readonly="readonly" />&nbsp;<i class="far fa-calendar-alt"></i></label>
							<th>판매등록매장</th>
							<td><input type="text" value="강남점" readonly="readonly"/></td>
						</tr>
					</thead>
				</table>
			</div>
			<hr/>
			<br />
			<div>
				<button type="button" class="a-button padding-button addTr">항목추가</button>&nbsp;
				<button type="button" class="a-button padding-button red delTr">항목삭제</button>
			</div>
			<div class="information">
				<table class="table">
					<tbody>
						<tr>
							<th><input type="checkbox" class="allChk"></th>
							<th>판매날짜</th>
							<th>지점</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>상품명</th>
							<th>수량</th>
							<th>판매액</th>
						</tr>
						<tr>
							<td><input type="checkbox" class="rowChk"></td>
							<td><span id="dateSale"></span></td>
							<td>A6516</td>
							<td>
								<select name="category">
									<option value="A">음료</option>
									<option value="B">푸드</option>
									<option value="C">상품</option>
								</select>
							</td>
							<td >
								<select name="subcategory">
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
								</select>
							</td>
							<td >
								<select name="product" style="min-width: 150px;">
									<option value="">제품명</option>
								</select>
							</td>
							<td>
								<input type="number" name="qty" style="width: 50px;"/><span>&nbsp;개</span>
							</td>
							<td><span id="productSum">1000000000000000</span></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8"><div class="message center red-font"></div></td>
						</tr>
					</tfoot>
				</table>
				<div class="center">
					<button type="button" class="a-button big">판매 등록</button>
					<button type="button" class="a-button sea big">다시 작성</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	
	 
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	today = yyyy+'-'+mm+'-'+dd;
	today2 = yyyy+'년 '+mm+'월 '+dd+'일';
	
	$("input[type='date']").val(today);
	$("#dateSale").text(today2)
	
</script>
