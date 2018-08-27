

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>

<style>
/* 별점 */
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url('http://i.imgur.com/YsyS5y8.png') 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
</style>

<div id="carouselExampleIndicators " class="carousel slide " data-ride="carousel ">
	<ol class="carousel-indicators ">
		<li data-target="#carouselExampleIndicators " data-slide-to="0 "
			class="active "></li>
		<li data-target="#carouselExampleIndicators " data-slide-to="1 "></li>
		<li data-target="#carouselExampleIndicators " data-slide-to="2 "></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active ">
			<img class="d-block w-100 "
				src="./resources/images/main_view.jpg"
				style="width:1210px; height: 350px;" alt="첫번째 슬라이드 ">
		</div>
		<div class="carousel-item ">
			<img class="d-block w-100 "
				src="./resources/images/main_view.jpg"
				style="width:1210px; height: 350px;" alt="두번째 슬라이드 ">
		</div>
		<div class="carousel-item ">
			<img class="d-block w-100 "
				src="./resources/images/main_view.jpg"
				style="width:1210px; height: 350px;" alt="세번째 슬라이드 ">
		</div>
		
	</div>
	<a class="carousel-control-prev " href="#carouselExampleIndicators "
		role="button " data-slide="prev "> <span
		class="carousel-control-prev-icon " aria-hidden="true "></span> <span
		class="sr-only ">이전</span>
	</a> <a class="carousel-control-next " href="#carouselExampleIndicators "
		role="button " data-slide="next "> <span
		class="carousel-control-next-icon " aria-hidden="true "></span> <span
		class="sr-only ">다음</span>
	</a>
</div>


<!-- 슬라이드 쇼 코드 끝 -->


<div id="container">
	<div class="empty-box" style="height: 40px;">
		
		<!-- 위 아래 여백을 위한 빈 박스 생성 -->
		<!-- 추후 위 아래 여백 간격 조절할 때 활용하기 위해 생성함 -->
	</div>

</div>
<!-- 슬라이드 쇼 코드 끝 -->



<!-- 첫 번째 메뉴 시작 -->
<style>
#menu1 {
	text-align: center;
	border: 1px solid #e8e9eb;
	padding: 22px 10px;
}
</style>

<!-- 1번째 메뉴 -->
<style>
.main-section {
	background-color: #f1f1f1;
	padding: 20px 20px 0px 20px;
}

.image-main-section {
	margin-bottom: 20px;
}

.img-part {
	border-radius: 5px;
	margin: 0px;
	border: 1px solid #DDDDDD;
	background-color: #fff;
	padding-bottom: 20px;
}

.img-section {
	padding: 5px;
}

.img-section img {
	width: 100%;
}

.image-title h3 {
	margin: 0px;
	color: #4C4C4C;
	padding: 15px 0px 8px 0px;
}

.image-description p {
	color: #848484;
}

.add-cart-btn {
	border-radius: 0px;
	font-size: 11px;
}
</style>

<div id="container">

	<div id="empty-box2" style="height: 40px;">
		<!-- 여백을 위한 빈 박스 생성 div -->
	</div>
</div>

<!-- 슬라이드 다음 최신 상품순 정렬하는 메뉴 코드 시작 -->
<!-- 왼쪽 여백 메뉴 시작<스크롤 스파이 부분> -->
<script>
	$(document).ready(function() {

		$('#hover2').popover({
			content : "가방",
			trigger : "hover",
			placement : "right"
		});
		$('#hover3').popover({
			content : "셔츠",
			trigger : "hover",
			placement : "right"
		});

	});

	$(window).scroll(function() {
		var $el = $('.show-on-scroll');

		if ($(this).scrollTop() >= 549)
			$el.addClass('shown');
		else
			$el.removeClass('shown');
	});
	
	
	
</script>

<div class="container">

	<div class="row">
		<div class="col-1">
			<nav class="col-1  show-on-scroll" id="myScrollspy">
				<ul class="nav nav-pills flex-column "
					style="border: 1px solid; background-color: #fafafa">
					
					<li class="nav-item"><a class="nav-link" href="#section2"><i
							class="fab fa-free-code-camp"><b> Camp_Item</b></i></a></li>
							
							<li class="nav-item"><a class="nav-link active"
						href="#section1" title="수영"><i class="fas fa-swimmer">
								Swim_Item</i></a></li>
								
								
					<!-- <li class="nav-item"><a class="nav-link" href="#section3"><i
							class="fas fa-fish"></i><b> 낚시</b></a></li> -->
				</ul>
			</nav>
		</div>


		<div id="#section1">
			<!-- 왼쪽 리모콘 기능을 활용하기 위한 빈 공간 -->
		</div>
	
		<div class="col-10 Main-Category-View">
		
		
			<!-- 각 카테고리 별 시작 세션 부분 -->
			
			<!-- 캠프 카테고리 시작 -->
			<div id = "section2">
				<!-- 왼쪽 내비게이션을 위한 빈 div여백 -->
			</div>
			<div class="menu_section">

				<div>
					<h1 class="item_title">Camp Item</h1>
				</div>

				<div id="menu_sider"></div>
	
					
				<div class="row" id="menu_inner">
				<c:forEach var='campList' items='${campList }' varStatus="vs">
				<c:if test="${vs.index == 0 }">
					<div class="offset-lg-3 col-lg-4  col-4 ">
						<div class="card">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${campList.product_code}';">
									<img class="d-block img-fluid"
											src="${pageContext.request.contextPath }/resources/upload/productImg/${campList.new_p_img_path }">
									<div class="icons">
										<a class="m-1"><i class="text-center fas fa-search"
											data-toggle="tooltip" title="상품자세히 보기"></i></a> 
									</div>
									
									</div>
									
								</div>
							
							</div>
							<div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
								<h4 class="card-title">${campList.product_name }</h4>
							</div>
							<div class="price ml-2 mt-2 mb-4">
								<span style="font-size: 20px; font-weight: bold;">
									<fmt:formatNumber value="${campList.price }" type="currency"/>
								</span>
							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${campList.review_star}</span>	
									</div>



								</div>

							</div>
						</div>
					</div>
				</c:if>
				</c:forEach>
					<!--4개의  갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->
			
					<div class="col-4">
					<c:forEach var='campList' items='${campList }' varStatus="vs">
					<c:if test="${0<vs.index and vs.index<3 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${campList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${campList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;">
								<span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${campList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${campList.price }" type="currency"/>
									</span>
								</div>

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${campList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	

					</div>


					<div class="col-4">
						<c:forEach var='campList' items='${campList }' varStatus="vs">
					<c:if test="${2<vs.index and vs.index<5 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${campList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${campList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${campList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${campList.price }" type="currency"/>
									</span>
								</div>
								

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${campList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	
				
					</div>

				</div>
			
			</div>
			<!-- 캠핑 메뉴 끝 -->
			
			<div class = "Padding_Between">
				
			</div>
			
			<!-- 수영 카테고리 시작 -->
			<div id = "section1">
				<!-- 왼쪽 내비게이션을 위한 빈 div여백 -->
			</div>
			<div class="menu_section">
				<div>
					<h1 class="item_title">Swim Item</h1>
				</div>

				<div id="menu_sider"></div>
	
					
				<div class="row" id="menu_inner">
				<c:forEach var='swimList' items='${swimList }' varStatus="vs">
				<c:if test="${vs.index == 0 }">
					<div class="offset-lg-3 col-lg-4  col-4 ">
						<div class="card">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${swimList.product_code}';">
									<img class="d-block img-fluid"
											src="${pageContext.request.contextPath }/resources/upload/productImg/${swimList.new_p_img_path }">
									<div class="icons">
										<a class="m-1"><i class="text-center fas fa-search"
											data-toggle="tooltip" title="상품자세히 보기"></i></a> 
									</div>
									</div>
									
								</div>
							
							</div>
							


							<div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
								<h4 class="card-title">${swimList.product_name }</h4>
							</div>
							<div class="price ml-2 mt-2 mb-4">
								<span style="font-size: 20px; font-weight: bold;">
									<fmt:formatNumber value="${swimList.price }" type="currency"/>
								</span>
							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${swimList.review_star}</span>	
									</div>



								</div>

							</div>

						</div>
					</div>
				</c:if>
				</c:forEach>
					<!--4개의  갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->
			
					<div class="col-4">
					<c:forEach var='swimList' items='${swimList }' varStatus="vs">
					<c:if test="${0<vs.index and vs.index<3 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${swimList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${swimList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a>
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${swimList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${swimList.price }" type="currency"/>
									</span>
								</div>
								

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${swimList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	

					</div>


					<div class="col-4">
						<c:forEach var='swimList' items='${swimList }' varStatus="vs">
					<c:if test="${2<vs.index and vs.index<5 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${swimList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${swimList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${swimList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${swimList.price }" type="currency"/>
									</span>
								</div>
								

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${swimList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	
				
					</div>

				</div>


				
			
			</div>


			<div class = "Padding_Between">
				
			</div>
			
			<!-- 등산 카테고리 시작 -->
			<div id = "section1">
				<!-- 왼쪽 내비게이션을 위한 빈 div여백 -->
			</div>
			<div class="menu_section">
				<div>
					<h1 class="item_title">Climbing Item</h1>
				</div>

				<div id="menu_sider"></div>
	
					
				<div class="row" id="menu_inner">
				<c:forEach var='climbList' items='${climbList }' varStatus="vs">
				<c:if test="${vs.index == 0 }">
					<div class="offset-lg-3 col-lg-4  col-4 ">
						<div class="card">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${climbList.product_code}';">
									<img class="d-block img-fluid"
											src="${pageContext.request.contextPath }/resources/upload/productImg/${climbList.new_p_img_path }">
									<div class="icons">
										<a class="m-1"><i class="text-center fas fa-search"
											data-toggle="tooltip" title="상품자세히 보기"></i></a> 
									</div>
									</div>
									
								</div>
							
							</div>
							


							<div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
								<h4 class="card-title">${climbList.product_name }</h4>
							</div>
							<div class="price ml-2 mt-2 mb-4">
								<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${climbList.price }" type="currency"/>
									</span>
							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${climbList.review_star}</span>	
									</div>



								</div>

							</div>

						</div>
					</div>
				</c:if>
				</c:forEach>
					<!--4개의  갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->
			
					<div class="col-4">
					<c:forEach var='climbList' items='${climbList }' varStatus="vs">
					<c:if test="${0<vs.index and vs.index<3 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${climbList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${climbList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="` 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${climbList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${climbList.price }" type="currency"/>
									</span>
								</div>

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${climbList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	

					</div>


					<div class="col-4">
						<c:forEach var='climbList' items='${climbList }' varStatus="vs">
					<c:if test="${2<vs.index and vs.index<5 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${climbList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${climbList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${climbList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${climbList.price }" type="currency"/>
									</span>
								</div>
							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${climbList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	
				
					</div>

				</div>
	
			</div>


			<div class = "Padding_Between">
				
			</div>
			
			<!-- 낚시 카테고리 시작 -->
			<div id = "section1">
				<!-- 왼쪽 내비게이션을 위한 빈 div여백 -->
			</div>
			<div class="menu_section">
				<div>
					<h1 class="item_title">Fishing Item</h1>
				</div>

				<div id="menu_sider"></div>
	
					
				<div class="row" id="menu_inner">
				<c:forEach var='fishList' items='${fishList }' varStatus="vs">
				<c:if test="${vs.index == 0 }">
					<div class="offset-lg-3 col-lg-4  col-4 ">
						<div class="card">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${fishList.product_code}';">
									<img class="d-block img-fluid"
											src="${pageContext.request.contextPath }/resources/upload/productImg/${fishList.new_p_img_path }">
									<div class="icons">
										<a class="m-1"><i class="text-center fas fa-search"
											data-toggle="tooltip" title="상품자세히 보기"></i></a> 
									</div>
									</div>
									
								</div>
							
							</div>
							


							<div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
								<h4 class="card-title">${fishList.product_name }</h4>
							</div>
							<div class="price ml-2 mt-2 mb-4">
								<span style="font-size: 20px; font-weight: bold;">
									<fmt:formatNumber value="${fishList.price }" type="currency"/>
								</span>
							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${fishList.review_star}</span>	
									</div>



								</div>

							</div>

						</div>
					</div>
				</c:if>
				</c:forEach>
					<!--4개의  갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->
			
					<div class="col-4">
					<c:forEach var='fishList' items='${fishList }' varStatus="vs">
					<c:if test="${0<vs.index and vs.index<3 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${fishList.product_code}';" >
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${fishList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${fishList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
							
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${fishList.price }" type="currency"/>
									</span>
								</div>


							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${fishList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	

					</div>


					<div class="col-4">
						<c:forEach var='fishList' items='${fishList }' varStatus="vs">
					<c:if test="${2<vs.index and vs.index<5 }">
						<div class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${fishList.product_code}';">
							<img src="${pageContext.request.contextPath }/resources/upload/productImg/${fishList.new_p_img_path }" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> 
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="product-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 20px; font-weight:bold;">${fishList.product_name}</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">
										<fmt:formatNumber value="${fishList.price }" type="currency"/>
									</span>
								</div>

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<span class="star-prototype">${fishList.review_star}</span>	
									</div>						
								</div>
							</div>							
						</div>
				

						</c:if>
						</c:forEach>	
				
					</div>

				</div>
	
			</div>





		</div>
		<!-- div col-10 코드 끝 -->


		<div class="col-1"></div>



	</div>
	<hr>

</div>
<!-- row 코드 끝 -->

<script>
//별점
$.fn.generateStars = function() {
 return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};

//숫자 평점을 별로 변환하도록 호출하는 함수
$('.star-prototype').generateStars();
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />