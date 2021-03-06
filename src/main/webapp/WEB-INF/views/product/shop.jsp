<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

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


<!-- 판메화면 전체 부분을 감싸는 container 부분 시작 -->
<div class = "container">
	<!-- 검색 전체를 감싸는 div -->
	<div class = "smartSearch" style = "background-color : purple;">
	
	<!-- 품목 카테고리 나오는 부분 감싸는 div -->
	<div class = "ssSection" id = "subbrandList">
	
	<!-- 카테고리라는 이름 넣는  공간 -->
	<!-- <div class = "ssTitle">
		<span>검색영역</span>
	</div>카테고리라는 이름 넣는 div 끝 -->
	
	</div><!-- 품목 카테고리 나오는 부분 감싸는 div 끝 -->
	
	</div><!-- 검색 전체를 감싸는 div 끝 -->
	
	<!-- 카테고리 관련 div시작 -->
	
	<style>
		.product_category {
			
			padding : 10px 0 15px;
			background: #fff;
			border-top : 1px solid #000;
			border-bottom : 1px solid #000;
			text-align: left;
			
		}
		
		#category_list {
			height : 48px;
		}
		
		.ct_title {
			float:left;
			width : 130px;
			height : 40px;
			margin : 4px 0;
			color : #000;
			font-size : 17px;
			line-height: 40px;
			font-weight: bold;
			padding-left : 8px;
		}
		
		.ct_box {
			display : table;
			float : left;
			width : 138px;
			height : 40px;
			margin : 4px 10px 4px 0;
		}
		
		.ct_box a {
			display : table-cell;
			position: relative;
			border : 1px solid #2d2e33;
			color : #2d2e33;
			font-size : 16px;
			line-height: 15px;
			text-align: center;
			vertical-align: middle;
			text-decoration: none;
			font-weight: bold;
			
		}
		
		.ct_box a:hover {
			background-color: #e0e0e0;
		}
	</style><!-- 인기상품순  ~ 상품평점순까지 볼 수 있게 해주는 옵션 div 박스 시작 -->
	<div class = "view_type_box">
		
		<!-- 총 상품 수 보여주는 카운팅 <p> 시작 -->
		
		<div class = "view_type opacity" style="display:inline-block;">
			<a href = "${path}/product.do" style = "background-color : 2e2e2e;">전체상품 </a>
			<a href ="${pageContext.request.contextPath}/writeDateOrder.do">신상품순</a>
			<a href ="${pageContext.request.contextPath}/lowPriceOrder.do">낮은가격순</a>
			<a href ="${pageContext.request.contextPath}/highPriceOrder.do">높은가격순</a>
			<a href ="${pageContext.request.contextPath}/reviewStarOrder.do">상품평점순</a>
		</div>
		<div class="add">
			<c:if test="${memberLoggedIn.member_level eq 'admin'}">
				<input type="button" value="상품 추가" class='btn btn-outline-success' onclick='fn_goboardForm();'/>
			</c:if>
		</div>
		<script>
			function fn_goboardForm(){
				location.href="${pageContext.request.contextPath}/productupload.do";
			}
		</script>
		
	</div><!-- 옵션 박스 div 끝 -->
	
	<div class = "product_category">
		<div id = "category_list">
		
			<div class = "ct_title">
				<span>카테고리</span>
			</div>
			
			<div class = "ct_box">
				<a href = "${pageContext.request.contextPath}/categorySort.do?p_category_name=캠핑">캠핑</a>

			</div>			
			
			<div class = "ct_box">
				<a href = "${pageContext.request.contextPath}/categorySort.do?p_category_name=낚시">낚시</a>

			</div>
			
			<div class = "ct_box">
				<a href = "${pageContext.request.contextPath}/categorySort.do?p_category_name=등산">등산</a>

			</div>
			
			<div class = "ct_box">
				<a href = "${pageContext.request.contextPath}/categorySort.do?p_category_name=수영">수영</a>

			</div>
		</div>
	
	
	</div>
	<style>
		.view_type_box{
			margin-top : 50px;
			margin-bottom : 50px;
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
			float: left;
			margin-right: 20px;
			font-size : 16px;
			line-height : 68px;
			font-weight:bold;
		}
		.view_type_box .view_type a:first-child {
			background:none;
		}
		
		.view_type_box .view_type a {
			padding: 0 26px;
			color : #000;		
			text-decoration: none;
		}
		
		.Seller_item_secion{
			padding-top: 14px;
			padding-bottom: 14px;
		}
		.add {
			display:inline-block;
			position: absolute; 
			margin-top: 13px;
		}
	</style>
	

	<div class = "row">
		<c:set var="index" value="0"/>
		<input type="hidden" class="listLength" value="${fn:length(list)}"/>
		<c:forEach var='image' items='${list }' varStatus="vs">
			<c:if test="${image.product_delete eq 'N'}">
			<div class="col-3 Seller_item_secion">
			<!-- 상품 이미지에 마우스를 올렸을 시 나오는 부분 -->
				<div style="height:250px;cursor: pointer;" class="hover-box" onclick="location.href='${pageContext.request.contextPath }/productView.do?product_code=${image.product_code}';">
					<img width="100%" height="100%" src="${pageContext.request.contextPath }/resources/upload/productImg/${image.new_p_img_path }" alt="상품"/>
					<div class="icons">
						<a class="m-1">
							<i class="text-center fas fa-search" data-toggle="tooltip" title="상품자세히 보기"></i>
						</a>
					</div>
				</div>
				<!-- 상품 이미지에 마우스를 올렸을 때 나오는 부분 코드 끝 -->
	<style>
	.point_icon {
					display : inline-block;
					width : 18px;
					height : 18px;
					margin-top : -2px;
					border-radius: 100%;
					background : #b0c976;
					color : #fff;
					font-weight : bold;
					font-size : 12px;
					line-height: 18px;
					
					overflow: hidden;
					vertical-align: middle;
				}
	
	</style>
				<!--갤러리 이미지 중 첫 번째 갤러리 타이틀 등록 코드부분  -->
				<div class="proudct-item-details">
					<div class="product-title">
						<a href="#" style="text-decoration: none;">
							<span class="ml-2" style="font-size: 20px; font-weight:bold;">${image.product_name }</span>
						</a>
					</div>
		
					<div class="row">
						<div class="col-6 ml-2">
							<span style="font-size: 20px; font-weight: bold;">
								<fmt:formatNumber value="${image.price }" type="currency"/>
							</span>
						</div>
						<div class="point col-5 ml-1" style="text-align: center">
							<span class="item_font">
								<span class="point_icon"><center>P</center></span><B> : <B class="point${index}">${image.price }</B>P</B>
							</span>
						</div>
		
					</div><input type="hidden" class="listLength" value="${fn:length(list)}"/>
		
					<div class="product-detail" style="background-color: #fafafa">
		
						<div class="row mt-2 mb-2">
							<div class="product-rating col-6 ml-2 mt-1 ">
							
								<span class="star-prototype">${image.review_star}</span>			
							
							</div>
						</div>
		
					</div>
				</div>
			</div>
			<c:set var="index" value="${index+1}"/>
			</c:if>
		</c:forEach>		
	</div><!-- 상품  진열하는  row코드 부분 끝 -->
	
	<!-- 전체화면 오른쪽 영역 부분 1로 비율 설정 -->

</div><!-- 전체 div 를 감싸는 container  끝 -->
<script>
$(function(){
	for(var i=0;i<parseInt($('.listLength').val());i++){
	var point=parseInt($('.point'+i).html());
	$('.point'+i).html(parseInt(point*0.02));
	}
});
//별점
$.fn.generateStars = function() {
 return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};

//숫자 평점을 별로 변환하도록 호출하는 함수
$('.star-prototype').generateStars();
 
 </script>
<a href="#" id="toTop" style="display: block;"><span id="toTopHover"
	style="opacity: 1;"></span></a>

${pageBar }
<script >

console.log("${list}");

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />