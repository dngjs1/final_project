<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<% 
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 3);
	SimpleDateFormat simpleDate = new SimpleDateFormat("MM/dd E요일");
	String strdate = simpleDate.format(cal.getTime());
	
%>

<script>
	var sell_price;
	var amount;
	$(function(){
       	init();
   	});
	function init () {
		sell_price = parseInt($('#price').text());
		amount = document.form.amount.value;
		$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(sell_price>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function add () {
		hm = document.form.amount;
		hm.value ++ ;
		var result = parseInt(hm.value) * sell_price;
		$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(result>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function del () {
		hm = document.form.amount;
		if (hm.value > 1) {
			hm.value -- ;
			var result = parseInt(hm.value) * sell_price;
			$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			if(result>=20000){
				$("#del_price").text("무료");
			}else{
				$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
			}
		}
	}
	
	$(window).scroll(function() {
		var $el = $('.show-on-scroll');

		if ($(this).scrollTop() >= 549)
			$el.addClass('shown');
		else
			$el.removeClass('shown');
	});
	
	
	
</script>

<div class="container">

	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">${joinCategory.p_category_name}</span></p>
<div class="row">
	<div class="col-6">
		<img style="width:100%;" alt="상품사진" src="http://www.oasekorea.com/00_ADMIN/Code/goodsimg_PIC01/AAAA00120141218008MM-1.jpg">
	</div>
	<div class="col-6">
		<hr style="border: 1.5px solid black;margin-top: 0px;">
		<div style="margin-left:10px">
			<p style="font-size:25px;font-weight:bold">${joinCategory.product_name}</p>
			<p>별점 들어갈부분</p>
			<hr>
			<div style="font-size:20px;color:#B9062F;font-weight:bold"><span id="price">${joinCategory.price}</span><span> 원</span></div>
			<hr>
			<p><span style="font-size:18px;color:#148CFF;"><%=strdate%></span> 도착 예정</p>
			<hr>
			<span>배송방법 : 택배</span><br>
			<span>배송비 : </span><span id="del_price" style="color:#148CFF;"></span>
			<hr>
			<form name="form" id="frm" method="get">
				<input type="hidden" value="${joinCategory.product_code}"/>
				<c:if test="${optionList!=null && optionList.size()>0}">
					<span>사이즈 </span>
					<select name="size" style="font-size:15px;height:28px;" >
						<c:forEach var="option" items="${optionList}">
							<option value="${option.product_option_code}">${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
						</c:forEach>
		            </select>
		            &emsp;&emsp;&emsp;
	            </c:if>
				<span>수량 </span><input type="text" name="amount" value="1" size="2" style="height:25px;" readonly/>
				<input type="button" value="+" style="width:25px;" onclick="add();"/><input type="button" value="-" style="width:25px;" onclick="del();"/>
				<hr>
				<div style="float:right;">
					<button class="btn btn-primary" type="button" id="buy">구매</button>
					<button class="btn btn-primary" type="button" id="cart">장바구니</button>
				</div>
			</form>
			<script>
			$(function(){
				$('#cart').click(function(){
					var frm=$("#frm");
					var url="${pageContext.request.contextPath }/cartView.do";
					frm.attr("action",url);
					frm.submit();
				});
				$('#buy').click(function(){
					var frm=$("#frm");
					var url="${pageContext.request.contextPath }/buyForm.do";
					frm.attr("action",url);
					frm.submit();
				});
			});
			</script>
    	</div>
	</div>
</div>
</div>
<br><br>


<div class="container">

  <ul class="nav nav-tabs" role="tablist">
     <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#section1">상품 상세</a>
    </li>
    <li class="nav-item">
       <a class="nav-link" data-toggle="tab" href="#section2">상품평</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#section3">상품문의</a>
    </li>
  </ul>

 <div class="tab-content">
  <div id="section1" class="container tab-pane active">
			
  
	
  <b>필수 표기정보</b>
  <table class="table table-bordered">
  	<tr>
  		<td width="15%" style="background-color:#D5D5D5">품명 및 모델명</td>
  		<td width="35%">gg</td>
  		<td width="15%" style="background-color:#D5D5D5">출시일</td>
  		<td width="35%">gg</td>
  	</tr>
  	<tr>
  		<td width="15%" style="background-color:#D5D5D5">제조국 (원산지)</td>
  		<td width="35%">gg</td>
  		<td width="15%" style="background-color:#D5D5D5">크기</td>
  		<td width="35%">gg</td>
  	</tr>
  </table>
  
  	<div>
  	<img src="//thumbnail12.coupangcdn.com/thumbnails/remote/q89/image/vendor_inventory/images/2018/05/11/11/9/d758f18b-6718-4ad3-ab4d-97b7b5cc5495.jpg" onerror="this.src='//t1a.coupangcdn.com/thumbnails/remote/622x622/image/coupang/common/no_img_1000_1000.png'" width="100%" alt="">
 	</div>
  </div>
  <div id="section2" class="container tab-pane fade">
			
 
 <hr>
 <h4>상품평</h4> <input type="button" value="테스트" onclick="fn_productReview()"/>
 <script>
	function fn_productReview(){
		location.href="${pageContext.request.contextPath}/productReviewTest.do?product_code=${joinCategory.product_code}";
	}
</script>
 <div> 
 <c:set var="total" value="0"/>
 <c:forEach var="review" items="${reviewList}" varStatus="vs">
	<%-- <tr>
		<td>${review.review_star }</td><br>
	</tr> --%>
	<c:set var="total" value="${(total+review.review_star)}"/>
	<c:set var="count" value="${vs.count }"/>
 </c:forEach>
 <c:out value="${total/count}"/>
 <span class="star-prototype">${total/count}</span>
 참여인원:<c:out value="${count }"/>
 </div>
 <div>상품평 이미지</div>
   <c:forEach var='imgList' items='${reviewImgList}' varStatus="vs">
		<img width="10%" height="10%" src="${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}"/>				
	</c:forEach>
  
 <hr>
 <div> 
 <c:forEach var="review" items="${reviewList}">
 	
	 작성자:${review.member_id}<br>
	별점:<span class="star-prototype">${review.review_star }</span><br>
	 작성일:${review.review_date} <br> 
	
	 <c:forEach var='imgList' items='${reviewImgList}' varStatus="vs">
		<c:if test="${review.review_code eq imgList.review_code }">
			<img width="10%" height="10%" src="${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}"/>				
		</c:if>
	</c:forEach>
		<br>	 	 
	 내용 :${review.review_content} <br>	
	 <hr>
 </c:forEach>
 
 <script>
//별점
$.fn.generateStars = function() {
 return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};

//숫자 평점을 별로 변환하도록 호출하는 함수
$('.star-prototype').generateStars();
 
 </script>
 </div>
  상품평 페이징 처리
  
   </div>
   <div id="section3" class="container tab-pane fade">
			
  
  <hr>
  상품문의
  <form name='productQuestion' action="${path }/question.do" method='post'
			style='margin-left:25px; width:550px'>
			<!-- 	<input type='hidden' name='boardCommentLevel' value='1'/>
				<input type='hidden' name='boardCommentRef' value='0' /> -->
				<textarea name='boardCommentContent' style='width:450px; height:50px;'></textarea>
				<button class='btn btn-warning btn-sm' onclick='return validate()' type='submit'>등록</button>
			</form>
  <div> 문의자  , 문의날짜, 문의내용</div>
	</div>
</div>
 
  
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />