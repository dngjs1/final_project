<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">	
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

    <div id="carouselExampleIndicators " class="carousel slide " data-ride="carousel ">
<ol class="carousel-indicators ">
  <li data-target="#carouselExampleIndicators " data-slide-to="0 " class="active "></li>
  <li data-target="#carouselExampleIndicators " data-slide-to="1 "></li>
  <li data-target="#carouselExampleIndicators " data-slide-to="2 "></li>
</ol>
<div class="carousel-inner ">
  <div class="carousel-item active ">
    <img class="d-block w-100 " src="https://t1.daumcdn.net/cfile/tistory/231235395466C11011 " style="height:350px; " alt="첫번째 슬라이드 ">
  </div>
  <div class="carousel-item ">
    <img class="d-block w-100 " src="https://t1.daumcdn.net/cfile/tistory/231235395466C11011 " style="height:350px; " alt="두번째 슬라이드 ">
  </div>
  <div class="carousel-item ">
    <img class="d-block w-100 " src="https://t1.daumcdn.net/cfile/tistory/231235395466C11011 " style="height:350px; " alt="세번째 슬라이드 ">
  </div>
</div>
<a class="carousel-control-prev " href="#carouselExampleIndicators " role="button " data-slide="prev ">
  <span class="carousel-control-prev-icon " aria-hidden="true "></span>
  <span class="sr-only ">이전</span>
</a>
<a class="carousel-control-next " href="#carouselExampleIndicators " role="button " data-slide="next ">
  <span class="carousel-control-next-icon " aria-hidden="true "></span>
  <span class="sr-only ">다음</span>
</a>
</div>


<!-- 슬라이드 쇼 코드 끝 -->


<div id = "container">
		<div class = "empty-box" style = "height:40px;">
		`<!-- 위 아래 여백을 위한 빈 박스 생성 -->
		 <!-- 추후 위 아래 여백 간격 조절할 때 활용하기 위해 생성함 -->
		</div>

	</div>
<!-- 슬라이드 쇼 코드 끝 -->



<!-- 첫 번째 메뉴 시작 -->
<style>
	#menu1{
		text-align : center;

		border:1px solid #e8e9eb;

		padding : 22px 10px;
	}
</style>

<!-- 1번째 메뉴 -->
<style>

	.main-section{
    background-color: #f1f1f1;
    padding: 20px 20px 0px 20px;
}
.image-main-section{
    margin-bottom:20px;
}
.img-part{
    border-radius: 5px;
    margin:0px;
    border:1px solid #DDDDDD;
    background-color: #fff;
    padding-bottom: 20px;
}
.img-section{
    padding: 5px;
}
.img-section img{
    width: 100%;
}
.image-title h3{
    margin:0px;
    color:#4C4C4C;
    padding: 15px 0px 8px 0px;
}
.image-description p{
    color:#848484;
}
.add-cart-btn{
    border-radius:0px;
    font-size: 11px;
}

</style>

<div id = "container">

	<div id = "empty-box2" style = "height:40px;">
		<!-- 여백을 위한 빈 박스 생성 div -->
	</div>
</div>


 <style>

 .hover-box {
  position: relative;
}
.hover-box *, .hover-box *:before, .hover-box *:after {
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.hover-box:before {
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
  content: '';
  background-color: #232323;
  opacity: 0;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.hover-box .icons {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}
.hover-box a {
  opacity: 0;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}
.hover-box a i {
  font-size: 23px;
  line-height: 40px;
  width: 40px;
  background-color: #fff;
  color: #EB4960;
  border-radius: 2px;
}
.hover-box a i:hover {
  background-color: #EB4960;
  color: #fff;
  cursor: pointer;
}
.hover-box:hover:before, .hover-box.hover:before {
  opacity: 0.5;
}
.hover-box:hover a, .hover-box.hover a {
  opacity: 1;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}
.hover-box:hover a:nth-child(2), .hover-box.hover a:nth-child(2) {
  -webkit-transition-delay: 0.1s;
  transition-delay: 0.1s;
}
.hover-box:hover a:nth-child(3), .hover-box.hover a:nth-child(3) {
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}
.hover-box:hover a:nth-child(4), .hover-box.hover a:nth-child(4) {
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;


}

 /* <!--링크 걸린 부분 밑줄 및 색상 제어 css--> */
 a:link { color: #1c1c1c; text-decoration: none;}
 a:visited { color: #1c1c1c; text-decoration: none;}
 a:hover { color: #1c1c1c; text-decoration: underline;}

 </style>

 <!-- 슬라이드 다음 최신 상품순 정렬하는 메뉴 코드 시작 -->
 <!-- 왼쪽 여백 메뉴 시작<스크롤 스파이 부분> -->
	<script>
$(document).ready(function(){

    $('#hover2').popover({content: "가방", trigger: "hover", placement: "right"});
    $('#hover3').popover({content: "셔츠", trigger: "hover", placement: "right"});

});

$(window).scroll(function() {
	  var $el = $('.show-on-scroll');
	  
	  if($(this).scrollTop() >= 549) $el.addClass('shown');
	  else $el.removeClass('shown');
	});
</script>

<style>

  ul.nav-pills {
		top : 0.1px;
		left: 100px;
   		position : fixed;		
  }
 
.show-on-scroll { visibility: hidden; }
.show-on-scroll.shown { visibility: visible; }

	</style>
	
<div class="container" >
	
	<div class ="row">
		<div class = "col-1">
			<nav class="col-1  show-on-scroll" id="myScrollspy">
      <ul class="nav nav-pills flex-column " style = "border:1px solid; background-color:#fafafa">
        <li class="nav-item">
          <a class="nav-link active" href="#section1" title = "여행"><i class="fas fa-swimmer"> 수영</i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section2"><i class="fab fa-free-code-camp"><b> 캠프</b></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#section3"><i class="fas fa-fish"></i><b> 낚시</b></a>
        </li>
      </ul>
    </nav>
</div>


		<div id ="#section1">
			<!-- 왼쪽 리모콘 기능을 활용하기 위한 빈 공간 -->
		</div>
		
		<div class ="col-10 Main-Category-View">
		<div class = "swim-menu">
    <div class = "menu-title" id = "section1" style = "border-bottom: 2px solid blue;">
        <span><h3><i class="fas fa-swimmer"></i>수영</h3></span>
    </div>
				<div class="row">
					<div class="offset-lg-3 col-lg-4  col-4 ">
          <div class="card">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                  <img class="d-block img-fluid" src="./resources/images/photo-7.jpg">
                </div>
                <div class="carousel-item">
                  <img class="d-block img-fluid" src="./resources/images/photo-7.jpg">
                </div>
                <div class="carousel-item">
                  <img class="d-block img-fluid" src="./resources/images/photo-7.jpg">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
              <div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
                <h4 class="card-title text-info">Designer Bag</h4>
              </div>
              <div class = "price ml-2 mt-2 mb-4">
              	<span style="font-size:20px; font-weight:bold;">240.000원</span>
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	 <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>
              	
              </div>

          </div>
      </div>

					<!--갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->

					<div class="col-4">
						<div class="hover-box">
						  	<img src="./resources/images/photo-2.jpg" alt="photo-2.jpeg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">헤어지는 커플컵</span></a>
              </div>
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">115.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 119P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>

            <div class="hover-box">
						  	<img src="./resources/images/photo-3.jpg" alt="photo-2.jpeg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">Canvas Bag</span></a>
              </div>
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">115.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 119P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_font{
              				
              		}
              		.item_icon1{
              			color : #b3b3b5;
              			font-size : 20px;
              		}
              		.item_icon2{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon2"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon2"><i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon2"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>







					</div>

<div class="col-4">
						<div class="hover-box">
						  	<img src="./resources/images/photo-6.jpg" alt="photo-2.jpeg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">휴가가는 고양이</span></a>
              </div>
              
             <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">67.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 64P</B></span>
              </div>
              
              </div>
              
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>

            <div class="hover-box">
						  	<img src="./resources/images/photo-2.jpg" alt="photo-2.jpeg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">Double Bag</span></a>
              </div>
              
              <!-- 가격 들어가는 곳 -->
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">123.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 124P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>







					</div>

          






			</div><!-- ㄴㄴㄴ -->
			</div> 
			<!-- 수영 메뉴 끝 -->


			
			<hr>
			<div id = "section2">
			
			</div>
			<!-- 캠프 메뉴 시작 -->
			<div class = "camp-menu">
    <div class = "menu-title"  style = "border-bottom: 2px solid green;">
        <span><h3><i class="fab fa-free-code-camp"></i>캠프</h3></span>
    </div>
				<div class="row">
					<div class="offset-lg-3 col-lg-4  col-4 ">
          <div class="card">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                  <img class="d-block img-fluid" src="./resources/images/camp-1.jpg">
                </div>
                <div class="carousel-item">
                  <img class="d-block img-fluid" src="./resources/images/camp-1.jpg">
                </div>
                <div class="carousel-item">
                  <img class="d-block img-fluid" src="./resources/images/camp-1.jpg">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
              <div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
                <h4 class="card-title text-info">캠프용 바베큐</h4>
              </div>
              <div class = "price ml-2 mt-2 mb-4">
              	<span style="font-size:20px; font-weight:bold;">50.000원</span>
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	 <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>
              	
              </div>

          </div>
      </div>

					<!--갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->

					<div class="col-4">
						<div class="hover-box">
						  	<img src="./resources/images/camp-2.jpg" alt="photo-2.jpeg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">장작</span></a>
              </div>
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">22.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 19P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>

            <div class="hover-box">
						  	<img src="./resources/images/camp-3.jpg" alt="camp-3.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="텐트" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">2~3인용 텐트</span></a>
              </div>
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">54.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 23P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_font{
              				
              		}
              		.item_icon1{
              			color : #b3b3b5;
              			font-size : 20px;
              		}
              		.item_icon2{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon2"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon2"><i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon2"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>







					</div>

<div class="col-4">
						<div class="hover-box">
						  	<img src="./resources/images/camp-5.jpg" alt="camp-5.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--2번째 세로 상품 갤러리 코드 시작-->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">설거지 하는 고양이</span></a>
              </div>
              
             <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">400.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 400P</B></span>
              </div>
              
              </div>
              
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>

            <div class="hover-box">
						  	<img src="./resources/images/camp-4.jpg" alt="camp-4.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="손전등" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">손전등</span></a>
              </div>
              
              <!-- 가격 들어가는 곳 -->
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">23.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 23P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>


					</div>


			</div>
			</div>
			<!-- 캠프 메뉴 끝 -->
			
			<hr>
			<div id = "section3">
			
			</div>
			<div class = "camp-menu">
    <div class = "menu-title"  style = "border-bottom: 2px solid green;">
        <span><h3><i class="fas fa-fish"></i>낚시</h3></span>
    </div>
				<div class="row">
					<div class="offset-lg-3 col-lg-4  col-4 ">
          <div class="card">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                  <img class="d-block img-fluid" src="./resources/images/swim-1.jpg">
                </div>
                <div class="carousel-item">
                  <img class="d-block img-fluid" src="./resources/images/swim-1.jpg">
                </div>
                <div class="carousel-item">
                  <img class="d-block img-fluid" src="./resources/images/swim-1.jpg">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
              <div class="card-block mt-4 ml-2 mr-2  mt-4 mb-4">
                <h4 class="card-title text-info">Oh My God</h4>
              </div>
              <div class = "price ml-2 mt-2 mb-4">
              	<span style="font-size:20px; font-weight:bold;">92.000원</span>
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	 <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>
              	
              </div>

          </div>
      </div>

					<!--갤러리 이미지 중 첫 번째 갤러리 사진 등록 코드부분  -->

					<div class="col-4">
						<div class="hover-box">
						  	<img src="./resources/images/swim-2.jpg" alt="swim-2.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="조끼" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">구명조끼</span></a>
              </div>
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">85.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 85P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>

            <div class="hover-box">
						  	<img src="./resources/images/swim-4.jpg" alt="swim-4.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">낚시용 바지</span></a>
              </div>
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">47.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 47P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_font{
              				
              		}
              		.item_icon1{
              			color : #b3b3b5;
              			font-size : 20px;
              		}
              		.item_icon2{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon2"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon2"><i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon2"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>







					</div>

<div class="col-4">
						<div class="hover-box">
						  	<img src="./resources/images/swim-3.jpg" alt="swim-3.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="고양이" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">회 떠주는 고양이</span></a>
              </div>
              
             <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">500.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 500P</B></span>
              </div>
              
              </div>
              
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>

            <div class="hover-box">
						  	<img src="./resources/images/swim-5.jpg" alt="swim-5.jpg" class="img-thumbnail" />
						  	<div class="icons">
                  <a class="m-1"><i class="text-center fas fa-search" data-toggle = "tooltip" title ="상품자세히 보기"></i></a>
						  		<a class="m-1"><i class="text-center fas fa-cart-plus" data-toggle = "tooltip" title ="장바구니에 담기"></i></a>
						  	</div>
						</div>


			<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
            <div class = "proudct-item-details">
              <div class = "product-title">
                <a href = "#" title="신발" style="text-decoration:none;"><span class = "ml-2" style="font-size:16px;">간지나는고글</span></a>
              </div>
              
              <!-- 가격 들어가는 곳 -->
              <div class = "row">
              
              <div class = "price col-6 ml-2">
              	<span style="font-size:20px; font-weight:bold;">182.000원</span>
              </div>
              
              <div class = "point col-5 ml-1" style = "text-align:center">
              	<span class = "item_font" ><i class="fas fa-hand-holding-usd item_icon1"></i><B> : 182P</B></span>
              </div>
              
              </div>
              <div class = "product-detail" style = "background-color:#fafafa">

              	<div class = "row mt-2 mb-2">
              	<div class = "product-rating col-6 ml-2 mt-1 ">
              	  <i class="fas fa-star" ></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
                  <i class="far fa-star"></i>
              	</div>

              	<style>
              		.item_icon{
              			color : #b3b3b5;
              			cursor: pointer;
              			font-size : 20px;
              		}
              	</style>

              	<div class = "col-5 item_icon text-right ">
              		<span class = "item_icon"><i class="fas fa-shopping-cart mr-1" data-toggle = "tooltip" title ="장바구니에 담기"></i></span>
              		<span class = "item_icon"></i> <i class="far fa-kiss-wink-heart mr-1" data-toggle = "tooltip" title ="좋아요"></i></span>
              		<span class = "item_icon"><i class="fas fa-external-link-alt mr-1" data-toggle = "tooltip" title ="상세보기"></i></span>
              	</div>
              	</div>

              </div>
            </div>







					</div>

          






			</div>
			</div>
			<!-- 낚시 메뉴 끝 -->
			


				

          



			</div><!-- div col-10 코드 끝 -->

			
			<div class = "col-1">





</div>



			</div>
<hr>

      </div> <!-- row 코드 끝 -->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />