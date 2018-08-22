
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>

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
				src="http://img2.travelmate.co.kr/img/event/0908/packtravel2_1100_04.jpg"
				style="width:1210px; height: 350px;" alt="첫번째 슬라이드 ">
		</div>
		<div class="carousel-item ">
			<img class="d-block w-100 "
				src="http://img2.travelmate.co.kr/img/event/0908/packtravel2_1100_04.jpg"
				style="width:1210px; height: 350px;" alt="두번째 슬라이드 ">
		</div>
		<div class="carousel-item ">
			<img class="d-block w-100 "
				src="http://img2.travelmate.co.kr/img/event/0908/packtravel2_1100_04.jpg"
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
					<div class="offset-lg-3 col-lg-4  col-4 ">
						<div class="card">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active">
										<img class="d-block img-fluid"
											src="./resources/images/camp-1.jpg">
									</div>
									<div class="carousel-item">
										<img class="d-block img-fluid"
											src="./resources/images/camp-1.jpg">
									</div>
									<div class="carousel-item">
										<img class="d-block img-fluid"
											src="./resources/images/camp-1.jpg">
									</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleControls"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleControls" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
							


							<div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
								<h4 class="card-title">Pork Belly</h4>
							</div>
							<div class="price ml-2 mt-2 mb-4">
								<span style="font-size: 20px; font-weight: bold;">40.000원</span>
							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>

						</div>
					</div>

					<!--4개의  갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->

					<div class="col-4">
						<div class="hover-box">
							<img src="./resources/images/camp-2.jpg" alt="camp-2.jpg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">Fire Tree</span></a>
							</div>
							<div class="row">
							
							<!-- 가격 등록부분 -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">25.000원</span>
								</div>
								
							<!-- 포인트 등록부분 -->
								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 25P</B></span>
								</div>

							</div>
							
							<!-- 평점 등록부분 -->
							<div class="product-detail" style="background-color: #fafafa">
	
								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="far fa-star"></i>
									</div>


							<!-- 장바구니, 좋아요, 상세보기 부분 -->
									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
									
								</div>

							</div>
							
						</div>
						
						<!-- 사진은 위에서 아래의 순서대로 차례로 등록되어진다. -->
						<!--4개의 갤러리 이미지 중 두 번째 갤러리 사진 등록 코드부분  -->
						<div class="hover-box">
							<img src="./resources/images/camp-3.jpg" alt="camp-3.jpg"
								class="img-thumbnail" />
								
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--4개의 갤러리 이미지 중 두 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="텐트" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">Tent</span></a>
							</div>
							<div class="row">
						<!--4개의 갤러리 이미지 중 두 번째 갤러리 가격 등록 코드부분  -->
								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">185.000원</span>
								</div>
						<!--4개의 갤러리 이미지 중 두 번째 갤러리 포인트 등록 코드부분  -->
								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 18P</B></span>
								</div>
				
							</div>
						<!--4개의 갤러리 이미지 중 두 번째 갤러리 평점 등록 코드부분  -->
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon2"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon2"><i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon2"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>







					</div>

					<div class="col-4">
						<div class="hover-box">
							<img src="./resources/images/photo-6.jpg" alt="photo-2.jpeg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">휴가가는 고양이</span></a>
							</div>

							<div class="row">

								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">67.000원</span>
								</div>

								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 64P</B></span>
								</div>

							</div>

							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>

						<div class="hover-box">
							<img src="./resources/images/photo-2.jpg" alt="photo-2.jpeg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">Double Bag</span></a>
							</div>

							<!-- 가격 들어가는 곳 -->
							<div class="row">

								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">123.000원</span>
								</div>

								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 124P</B></span>
								</div>

							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>

					</div>

				</div>
			
			</div>
			<!-- 수영 메뉴 끝 -->
			
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
					<div class="offset-lg-3 col-lg-4  col-4 ">
						<div class="card">
							<div id="carouselExampleControls" class="carousel slide"
								data-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active">
										<img class="d-block img-fluid"
											src="./resources/images/photo-7.jpg">
									</div>
									<div class="carousel-item">
										<img class="d-block img-fluid"
											src="./resources/images/photo-7.jpg">
									</div>
									<div class="carousel-item">
										<img class="d-block img-fluid"
											src="./resources/images/photo-7.jpg">
									</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleControls"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleControls" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
							


							<div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
								<h4 class="card-title">Designer Bag</h4>
							</div>
							<div class="price ml-2 mt-2 mb-4">
								<span style="font-size: 20px; font-weight: bold;">240.000원</span>
							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>

						</div>
					</div>

					<!--갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->

					<div class="col-4">
						<div class="hover-box">
							<img src="./resources/images/photo-2.jpg" alt="photo-2.jpeg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">헤어지는 커플컵</span></a>
							</div>
							<div class="row">

								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">115.000원</span>
								</div>

								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 119P</B></span>
								</div>

							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="far fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>

						<div class="hover-box">
							<img src="./resources/images/photo-3.jpg" alt="photo-2.jpeg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">Canvas Bag</span></a>
							</div>
							<div class="row">

								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">115.000원</span>
								</div>

								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 119P</B></span>
								</div>

							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon2"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon2"><i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon2"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>







					</div>

					<div class="col-4">
						<div class="hover-box">
							<img src="./resources/images/photo-6.jpg" alt="photo-2.jpeg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">휴가가는 고양이</span></a>
							</div>

							<div class="row">

								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">67.000원</span>
								</div>

								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 64P</B></span>
								</div>

							</div>

							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>

						<div class="hover-box">
							<img src="./resources/images/photo-2.jpg" alt="photo-2.jpeg"
								class="img-thumbnail" />
							<div class="icons">
								<a class="m-1"><i class="text-center fas fa-search"
									data-toggle="tooltip" title="상품자세히 보기"></i></a> <a class="m-1"><i
									class="text-center fas fa-cart-plus" data-toggle="tooltip"
									title="장바구니에 담기"></i></a>
							</div>
						</div>


						<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
						<div class="proudct-item-details">
							<div class="product-title">
								<a href="#" title="신발" style="text-decoration: none;"><span
									class="ml-2" style="font-size: 16px;">Double Bag</span></a>
							</div>

							<!-- 가격 들어가는 곳 -->
							<div class="row">

								<div class="price col-6 ml-2">
									<span style="font-size: 20px; font-weight: bold;">123.000원</span>
								</div>

								<div class="point col-5 ml-1" style="text-align: center">
									<span class="item_font"><i
										class="fas fa-hand-holding-usd item_icon1"></i><B> : 124P</B></span>
								</div>

							</div>
							<div class="product-detail" style="background-color: #fafafa">

								<div class="row mt-2 mb-2">
									<div class="product-rating col-6 ml-2 mt-1 ">
										<i class="fas fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i> <i class="far fa-star"></i> <i
											class="far fa-star"></i>
									</div>



									<div class="col-5 item_icon text-right ">
										<span class="item_icon"><i
											class="fas fa-shopping-cart mr-1" data-toggle="tooltip"
											title="장바구니에 담기"></i></span> <span class="item_icon"></i> <i
											class="far fa-kiss-wink-heart mr-1" data-toggle="tooltip"
											title="좋아요"></i></span> <span class="item_icon"><i
											class="fas fa-external-link-alt mr-1" data-toggle="tooltip"
											title="상세보기"></i></span>
									</div>
								</div>

							</div>
						</div>

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


<jsp:include page="/WEB-INF/views/common/footer.jsp" />