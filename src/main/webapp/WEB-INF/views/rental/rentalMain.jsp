<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.map-container {
	  position: absolute;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  top: 160px;
	  width: 100%;
	  background: white;
	}
	.map-area {
	  position: absolute;
	  left: 0;
	  top: 0;
	  right: 400px;
	  bottom: 0;
	  background: repeat 0 0;
	  border-right: 1px solid #bbbbbb;
	}
	.map-area #map {
	  width: 100%;
	  height: 100%;
	  *position: absolute;
	  *bottom: 0;
	}
	.map-content {
	  position: absolute;
	  right: 0;
	  top: 0;
	  bottom: 0;
	  width: 400px;
	  height: 100%;
	  overflow-x: hidden;
	  /*overflow-y:scroll;*/
	  overflow: hidden;
	  background: none;
	}
		
	.map-search {
	  position: relative;
	  width: 100%;
	  height: 100px;
	  background: #f8f6f3;
	  border-bottom: 1px solid #d9d3c8;
	}
	.map-search h4 {
	  padding-bottom: 5px;
	  color: #333333;
	  font-weight: bold;
	  font-size: 13px;
	}
	.map-search .item-type {
	  position: relative;
	  width: 100%;
	  padding: 15px 15px 0 70px;
	  clear: both;
	  box-sizing: border-box;
	  *width: 315px;
	}
	.map-search .item-type h4 {
	  position: absolute;
	  left: 15px;
	  top: 15px;
	  font-size: 13px;
	}
	.map-search .item-type label {
	  display: inline-block;
	  width: 30%;
	  margin-bottom: 3px;
	  font-size: 13px;
	}
</style>
<div class="container-fluid">
	<div class="map-container">
		<div class="map-area">
			<div id="map"></div>
		</div>
		<div class="map-content">
	        <!-- search -->
	        <div class="map-search">
	            <div class="item-type">
	                <h4>카테고리</h4>
	                <label><input type="checkbox" name="room" class="item_room" value="01" checked /> 오픈형 원룸</label>
	                <label><input type="checkbox" name="room" class="item_room" value="02" checked /> 분리형 원룸 </label>
	                <label><input type="checkbox" name="room" class="item_room" value="03" checked /> 복층형 원룸</label>
	                <label><input type="checkbox" name="room" class="item_room" value="04" checked /> 투룸</label>
	                <label><input type="checkbox" name="room" class="item_room" value="05" checked /> 쓰리룸+</label>
	            </div>
	        	
	        </div>
		</div>
	</div>
	
    
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d47acf86cf9d33e239ad720ebd24f4a&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new daum.maps.LatLng(35.829024062214266, 127.88727134463655), // 지도의 중심좌표
		        level: 13 // 지도의 확대 레벨
		    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();		 // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		 // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		 map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	
		 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		 var zoomControl = new daum.maps.ZoomControl();
		 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	    // 마커 클러스터러를 생성합니다 
	    var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });


	    // 데이터를 가져오기 위해 jQuery를 사용합니다
	    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	    $.get("${pageContext.request.contextPath }/resources/data/chicken.json", function(data) {
	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        var markers = $(data.positions).map(function(i, position) {
			    var marker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
	                position : new daum.maps.LatLng(position.lat, position.lng)
	            });
			    
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new daum.maps.InfoWindow({
			        content: '<div>카카오</div>' // 인포윈도우에 표시할 내용
			    });
			    
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    
			    return marker;
	        });

	        // 클러스터러에 마커들을 추가합니다
	        clusterer.addMarkers(markers);
	    });
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
	</script>
</div>

