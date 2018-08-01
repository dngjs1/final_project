<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />

</jsp:include>



<!-- start menu -->


<%-- <div class="container">
	<div class="login">
		<div class="wrap">

			<div class="cont span_2_of_3">
				<div class="mens-toolbar">
					<div class="sort">
						<div class="sort-by">
							<label>Sort By</label> <select>
								<option value="">인기순</option>
								<option value="">높은 가격부터</option>
								<option value="">낮은가격부터</option>
							</select> 
						
								<c:if test="${memberLoggedIn.member_level eq 'admin'}">
								
								<input style="float:right" type="button" value="상품 추가" id='btn-add' 
								class='btn btn-outline-success' onclick='fn_goboardForm();'/>
								</c:if>
						<script>
							function fn_goboardForm(){
								location.href="${pageContext.request.contextPath}/productupload.do";
							}
						</script>
						
						</div>
						
				
					
				</div>
				<div class="row">
				
					<c:forEach var='image' items='${list }' varStatus="vs">
						<div style=" cursor: pointer;" onclick="location.href='${pageContext.request.contextPath }/productView.do?productCode=${image.product_code}'" class="col-3">
							<div>
								<div  class="css3">
									<img style="width: 100%; height: 100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${image.new_p_img_path }" />
								</div>
									<div>
										상품이름: ${image.product_name }
									</div>
									<div>
										별점										
									</div>
									<div>
										가격 : ${image.price }
									</div>
								<!-- </a> -->
							</div>
						<!-- </a> -->
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div> --%>

<!-- 판메화면 전체 부분을 감싸는 container 부분 시작 -->
<div class = "container">

	<!-- 화면을 3개로 분할하는 row코드 시작 -->
	
	
	<!-- 전체화면 왼쪽 영역 부분 1로 비율 설정 -->
	
	
	<!-- 판매화면 가운데 영역 부분 10로 비율 설정 -->
	
	
	
	
	<!-- 검색부분 시작 -->
	
	<!-- 검색 전체를 감싸는 div -->
	<div class = "smartSearch" style = "background-color : purple;">
	
	<!-- 품목 카테고리 나오는 부분 감싸는 div -->
	<div class = "ssSection" id = "subbrandList">
	
	<!-- 카테고리라는 이름 넣는  공간 -->
	<div class = "ssTitle">
		<span>검색영역</span>
	</div><!-- 카테고리라는 이름 넣는 div 끝 -->
	

	
	
	</div><!-- 품목 카테고리 나오는 부분 감싸는 div 끝 -->
	
	</div><!-- 검색 전체를 감싸는 div 끝 -->
	
	<style>
		.view_type_box{
			margin-top : 17px;
			margin-bottom : 17px;
			height : 68px;
			border : 1px solid #e0e0e0;
			background : #fff;
			}
			
		.view_type_box .total_count {
			float:left;
			margin-left : 20px;
			font-size : 16px;
			line-height:68px;
		}
		
		.view_type_box .view_type{
			float: right;
			margin-right: 20px;
			font-size : 12px;
			line-height : 68px;
		}
		.view_type_box .view_type a:first-child {
			background:none;
		}
		
		.view_type_box .view_type a {
			padding: 0 12px;
			color : #000;		
		}
		
		.Seller_item_secion{
			padding-top: 14px;
			padding-bottom: 14px;
		}
	</style>
	<!-- 인기상품순  ~ 상품평점순까지 볼 수 있게 해주는 옵션 div 박스 시작 -->
	
	<div class = "view_type_box">
		
		<!-- 총 상품 수 보여주는 카운팅 <p> 시작 -->
		<p class = "total_count">
			총 <em>  </em>개의 상품이 있습니다
		</p>
		<div class = "view_type opacity" id = "listsort">
			<a href ="#">인기상품순</a>
			<a href ="#">신상품순</a>
			<a href ="#">낮은가격순</a>
			<a href ="#">높은가격순</a>
			<a href ="#">상품평점순</a>
		</div>
	</div><!-- 옵션 박스 div 끝 -->
	


<div class = "row">
	<div class="col-3 Seller_item_secion">
	<!-- 상품 이미지에 마우스를 올렸을 시 나오는 부분 -->
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
						<!-- 상품 이미지에 마우스를 올렸을 때 나오는 부분 코드 끝 -->


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
					</div>
					
					
					
					
					
					
					
					</div><!-- 상품  진열하는  row코드 부분 끝 -->
	
	
	
	
	
	<!-- 전체화면 오른쪽 영역 부분 1로 비율 설정 -->
	
	
	
	
	
	
</div><!-- 전체 div 를 감싸는 container  끝 -->




<jsp:include page="/WEB-INF/views/common/footer.jsp" />