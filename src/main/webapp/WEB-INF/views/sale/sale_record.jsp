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
			<hr />
			<form action="saleList" method="post" id="saleRecord">
				<div class="information">
					<table class="table">
						<thead>
							<tr>
								<td colspan="7">
										<div class="right">
											<button type="button" class="a-button medium purple" id="saleRecordAdd"><i class="fas fa-search"></i>&nbsp;판매기록 행 추가</button>
										</div>
									</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><input type="checkbox" class="allChk"></th>
								<th>지점</th>
								<th >대분류</th>
								<th >소분류</th>
								<th >상품명</th>
								<th >수량</th>
								 <th>옵션</th>
							</tr>
							<tr class="sale1">
								<td><input type="checkbox" class="rowChk"></td>
								<td >A6516</td>
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
								<td>
									<button type="button" class="a-button red" onclick="reomoveRow(this)"><i class="fas fa-search"></i>&nbsp;삭제</button>
								</td>							
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7"><div class="message center red-font"></div></td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				<div class="right"><button type="submit" class="a-button big sea"><i class="fas fa-search"></i>&nbsp;등록</button></div>
			</form>
			</div>
	</div>
</div>


<script type="text/javascript">
	
	var i=2;
	$('#saleRecordAdd').click(function(){
		var newitem = $(".table>tbody tr:eq(1)").clone();
		newitem.removeClass();
		newitem.addClass("sale"+i);
		$(".table>tbody:last").append(newitem);
		i++;

	});
	
	function reomoveRow(obj) {
	    var tr = $(obj).parent().parent();
	    if(tr.attr('class')=='sale1'){
	    	return;
	    }else{
		    tr.remove();
	    }
	};
	
	$("#saleRecord").submit(function() {
		
		var submitResult=true;
		
		if($('.rowChk').is(":checked")){
			return submitResult=true;
		}else{
			$(".message").text("선택한 판매등록 리스트가 하나도 없습니다.");
			submitResult=false;
		}
		
		return submitResult;
		
	});
	
	
</script>