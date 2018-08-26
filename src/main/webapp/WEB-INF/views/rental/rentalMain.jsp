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
	  left: 0px;
	  right: 0px;
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
	  /* overflow-y:scroll; */
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
	
	#mapadd{
	    display: block;
	    position: absolute;
	    left: 57px;
	    top: 43px;
	    z-index: 100;
	    padding: 15px;
	    background: white;
	    width: 100px;
	    border: 1px solid #e1e1e1;
	    box-shadow: 
	}
	
	.map-list{
		height:90%
	}
</style>
<div class="container-fluid">
	<div class="map-container">
		<div class="map-area">
			<div id="map">
			</div>
			<form onsubmit="searchPlaces(); return false;">
					<label>동 이름 : </label>
					<label><input type="text" id="keyword" size="15" class="form-control" ></label>
                    <label><button type="submit" class="btn btn-primary">검색하기</button></label> 
                </form>
			<c:if test="${memberLoggedIn != null }">
				<a href="${path }/shop/rentalWrite.do"><button class="btn" id="mapadd">등록</button></a>
			</c:if>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d47acf86cf9d33e239ad720ebd24f4a&libraries=services,clusterer,drawing"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new daum.maps.LatLng(35.829024062214266, 127.88727134463655), // 지도의 중심좌표
				        level: 12 // 지도의 확대 레벨
				    };
		
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다z
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
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
		
				<c:forEach items="${list2 }" var="rental" varStatus="status">
				 // 주소로 좌표를 검색합니다
					geocoder.addressSearch('${rental.address}', function(result, status) {
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {
					    	
					        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new daum.maps.Marker({
					            map: map,
					            position: coords,
					            clickable:true
					        });
					
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new daum.maps.InfoWindow({
					            content: '<a href="./rentalDetail.do?rental_obj_code=${rental.rental_obj_code }">'+
					            		'<div id="iw-container">'+
					            			'<div class="iw-title">${rental.p_category_name}</div>'+
					            				'<img src=${rental.imgUrl} style="width:100%; height:150px;"/><br>'+
					            				'<span><strong>물품명 : </strong></span> <span>"${rental.title}"</span><br><span><strong>주소 : </strong></span><span>"${rental.address}"</span><br><span><strong>연락처 : </strong></span><span>"${rental.phone}"</span></a>'
					        });
						    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
						    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						    daum.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
						    daum.maps.event.addListener(infowindow, 'click', makeOutListener(infowindow));

					        clusterer.addMarker(marker);
					    } 
					}); 
			 	</c:forEach>
		
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
		<style>
			#iw-container {
				margin-bottom: 10px;
				width:200px;
			}
			#iw-container .iw-title {
				font-family: 'Open Sans Condensed', sans-serif;
				font-size: 22px;
				font-weight: 400;
				padding: 10px;
				background-color: #48b5e9;
				color: white;
				margin: 0;
				border-radius: 2px 2px 0 0;
			}
			#iw-container .iw-content {
				font-size: 13px;
				line-height: 18px;
				font-weight: 400;
				margin-right: 1px;
				padding: 15px 5px 20px 15px;
				max-height: 140px;
				overflow-y: auto;
				overflow-x: hidden;
			}
		</style>
		<div class="map-content">
	        <!-- search -->
	        <div class="map-search">
	            <div class="item-type">
	                <h4>카테고리</h4>
	                <label><input type="checkbox" name="rentalSearch" value="p1" checked /> 카테고리2 </label>
	                <label><input type="checkbox" name="rentalSearch" value="p2" checked /> 카테고리2 </label>
	                <label><input type="checkbox" name="rentalSearch" value="p3" checked /> 카테고리2 </label>
	                <label><input type="checkbox" name="rentalSearch" value="p4" checked /> 카테고리2 </label>
	                <label><input type="checkbox" name="rentalSearch" value="p5" checked /> 카테고리2 </label>
        </div>
	        	
	        </div>
	        <div class="map-list" style="overflow: scroll;">
				<c:forEach items="${list }" var="rental" varStatus="status">
				<c:if test="${empty rental }">
					상품이 존재하지 않습니다.
				</c:if>
				<c:if test="${status.index % 6 == 0 }">
				<div class="list-item">
				</c:if>
					<div style="text-align: -webkit-center;">
				      	<a href="./rentalDetail.do?rental_obj_code=${rental.rental_obj_code }">
					      <div class="thumbnail" style="overflow: hidden;">      
					      	<c:choose>	 
						      <c:when test="${rental.imgUrl == null }">
						   		<img src="https://placehold.it/160x100?text=Not Image" class="media-object" alt="Rental" style="float:left">
						      </c:when>
						      <c:when test="${rental.imgUrl == './img' }">
						   		<img src="https://placehold.it/160x100?text=Not Image" class="media-object" alt="Rental" style="float:left">
						      </c:when>
					          <c:when test="${rental.imgUrl != null}">
					          	<img src="${rental.imgUrl }" class="media-object" style="float:left; width:160px; height:100px;" alt="Rental">
					          </c:when>
					        </c:choose>
					      
					      <div class="context">
					      	<h4 class="desc_content" style="color: white; text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;"></h4>
					        <strong>[${rental.p_category_name }] ${rental.title }</strong>
					        <p> ${rental.price } 원</p>
					       </div>      
					      </div>
				        </a>
					</div>
					<br>
				<c:if test="${status.index % 6 == 5 }">
				</div>
				</c:if>
				</c:forEach>
			
				${pageBar }
			</div>
		</div>
	</div>
    

</div>

