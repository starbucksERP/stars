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
			<h3>지점 정보</h3>
				<hr />
				<div class="information-left" >
				
				
				
					<div id="map" style="width:100%;height:70vh;"></div>
				
					<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1218df4c9336caa2696a0130fe7677f3"></script>
					<script>
				
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(36.332283, 127.434168), // 지도의 중심좌표
				        level: 13 // 지도의 확대 레벨
				    };
				
				    var map = new kakao.maps.Map(mapContainer, mapOption);
				
				    var data =[
				            [37.497950, 127.026840, '<div style="padding:5px;">강남역 지점</div>'],  
				            [35.114488, 129.039292, '<div style="padding:5px;">부산역 지점</div>'],
				            [35.165537, 126.909174, '<div style="padding:5px;">광주역 지점</div>'],
				            [37.763994, 128.901646, '<div style="padding:5px;">강릉역 지점</div>'],
				            [36.332283, 127.434168, '<div style="padding:5px;">대전역 지점</div>']
				        ];
				
				    for(var i=0; i<data.length; i++){
				        // 마커를 생성합니다
				        var marker = new kakao.maps.Marker({
				            position: new kakao.maps.LatLng(data[i][0], data[i][1])
				        });
				
				        // 마커가 지도 위에 표시되도록 설정합니다
				        marker.setMap(map);
				
				        // 인포윈도우를 생성합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content : data[i][2]
				        });
				        
				        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				        infowindow.open(map, marker); 
				
				    }
				
				
					</script>
									
				
				
				
				
				
				</div>
				
				<div class="information-right">
					<h3>[매장 검색]</h3>
					<div>
						<span class="staff">지역 검색 :&nbsp;</span>
						<select>
							<option value="">시/도</option>
						</select>&nbsp;
						<select>
							<option value="">구/군</option>
						</select>&nbsp;
						<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
					</div>
					<div>
						<span class="staff">매장명 :&nbsp;</span>
						<input type="search" />&nbsp;
						<button type="button" class="a-button black"><i class="fas fa-search"></i>&nbsp;검색</button>
					</div>
					<br />
					<hr />
					<div class="right">
						<span class="red-font">매장명</span>을 클릭하시면 더 자세한 정보를 확인할수 있습니다.
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