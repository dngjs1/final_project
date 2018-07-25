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
<hr>
<!-- 슬라이드 쇼 코드 끝 -->


<!-- 2번째 메뉴 -->
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
<div class="container main-section">
	<div class="row">
	<div class = "col-12">
		<h2>판매메뉴</h2>
	</div>
		<div class="col-md-3 col-sm-3 col-xs-12 image-main-section">
			<div class="row img-part">
				<div class="col-md-12 col-sm-12 colxs-12 img-section">
					<img src="https://dummyimage.com/200x150/000/ebecf5.png&text=++++image+++">
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-title">
					<h3>킹갓엠퍼러가방</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 ml-1 image-description">
					<p> 내용</p>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class = "row">
						<div class = "col-7">
							<i class="fas fa-cart-plus"> </i>
							&nbsp;|&nbsp;
							<i class="far fa-heart"> </i>
						<div>
						
						
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						<i aria-hidden="true" class="fa fa-star"></i>
						4.0
						</div>
						</div>
						
						<div class = "col-5 mt-4">
						
							<a href="#" class="btn btn-success add-cart-btn">자세히 보기</a>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 image-main-section">
			<div class="row img-part">
				<div class="col-md-12 col-sm-12 colxs-12 img-section">
					<img src="https://dummyimage.com/200x150/000/ebecf5.png&text=++++image+++">
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-title">
					<h3>상품제목</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-description">
					<p>간략한 내용정보</p>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<a href="#" class="btn btn-success add-cart-btn">자세히 보기</a>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 image-main-section">
			<div class="row img-part">
				<div class="col-md-12 col-sm-12 colxs-12 img-section">
					<img src="https://dummyimage.com/200x150/000/ebecf5.png&text=++++image+++">
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-title">
					<h3>상품제목</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-description">
					<p>간략한 내용정보</p>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<a href="#" class="btn btn-success add-cart-btn">자세히 보기</a>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 image-main-section">
			<div class="row img-part">
				<div class="col-md-12 col-sm-12 colxs-12 img-section">
					<img src="https://dummyimage.com/200x150/000/ebecf5.png&text=++++image+++">
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-title">
					<h3>상품제목</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 image-description">
					<p>간략한 내용정보</p>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
						
					<a href="#" class="btn btn-success add-cart-btn">자세히 보기</a>
				</div>
			</div>
		</div>
	</div>
</div>



<hr>


<!-- 바텀 4개 박스부분 시작-->
<div class = "container ">
  <div class = "row ">
    <div class = "col-3 " style = " ">
      <h5>대여마켓 고객센터</h5>
          <table class="table table-hover table-bordered ">
              <tr>
                <td><i class="fas fa-truck "></i> 주문/배송 조회</td>
              </tr>

              <tr>
                <td><i class="fas fa-times-circle "></i> 교환/반품 신청</td>
              </tr>

              <tr>
                <td><i class="fab fa-rocketchat "></i> 1:1 문의하기</td>
              </tr>

              <tr>
                <td><i class="fas fa-question "></i> 자주하는 질문보기</td>
              </tr>


          </table>

    </div>

    <div class = "col-3 ">
          <h5>02-000-0000</h5>
        <table class = "table table-border-0 ">


          <tr>
            <td>운영시간 AM 09:00~PM 18:00</td>
          </tr>

          <tr>
            <td>점심시간 AM 12:00~PM 13:00</td>
          </tr>

          <tr>
            <td>토, 일, 공휴일 휴무</td>
          </tr>

    </table>
    </div>

    <div class = "col-3 ">
        3번째 공간 들어올 곳
    </div>

    <div class = "col-3 ">
        4번째 공간 들어올 곳
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />