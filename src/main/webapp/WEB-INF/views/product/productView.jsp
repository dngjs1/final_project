<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(sell_price>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function add () {
		amount = document.form.cart_quantity;
		amount.value ++ ;
		var result = parseInt(amount.value) * sell_price;
		$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(result>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function del () {
		amount = document.form.cart_quantity;
		if (amount.value > 1) {
			amount.value -- ;
			var result = parseInt(amount.value) * sell_price;
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
				<input type="hidden" name="member_id" id="member_id" value="${memberLoggedIn.member_id}"/>
				<input type="hidden" name="product_code" value="${joinCategory.product_code}"/>
				<c:if test="${optionList!=null && optionList.size()>0}">
					<span>사이즈 </span>
					<select name="size" style="font-size:15px;height:28px;" >
						<c:forEach var="option" items="${optionList}">
							<c:choose>
							<c:when test="${option.left_amount<=0}">
								<option value="${option.product_option_code}" disabled>${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
							</c:when>
							<c:otherwise>
								<option value="${option.product_option_code}">${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
		            </select>
		            &emsp;&emsp;&emsp;
	            </c:if>
				<span>수량 </span><input type="text" name="cart_quantity" value="1" size="2" style="height:25px;" readonly/>
				<input type="button" value="+" style="width:25px;" onclick="add();"/><input type="button" value="-" style="width:25px;" onclick="del();"/>
				<hr>
				<div style="float:right;">
					<button class="btn btn-primary" type="button" id="buy">구매</button>
					<button class="btn btn-primary" type="button" id="cart">장바구니</button>
				</div>
			</form>
			<script>
			$(function(){
				$('#cart').click(function(e){
					var member_id=$('#member_id').val();
					if(member_id==null||member_id.length<1){
						alert("로그인 후 이용해주시기 바랍니다.");
						e.preventDefault();
					}else{
						var productInfo={
								member_id:member_id,
								product_option_code:$("[name=size]").val(),
								product_code:$("[name=product_code]").val(),
								cart_quantity:$("[name=cart_quantity]").val()
						};
						$.ajax({
							url:"${pageContext.request.contextPath}/cartInsert.do",
							data:productInfo,
							success:function(data){
								if(data.trim()=='0'){
									alert("장바구니 추가에 실패하였습니다.");
									e.preventDefault();
								}else{
									if (confirm('장바구니로 이동하시겠습니까?')) {
										location.href="${pageContext.request.contextPath}/cartView.do?member_id=${memberLoggedIn.member_id}";
						            } else {
						                return;
								    }
								}
							},
							error:function(jpxhr,textStatus,errormsg){
								console.log("ajax전송실패.");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
						});
					}
				});
				$('#buy').click(function(){
					var member_id=$('#member_id').val();
					if(member_id==null||member_id.length<1){
						alert("로그인 후 이용해주시기 바랍니다.");
						e.preventDefault();
					}else{
						var frm=$("#frm");
						var url="${pageContext.request.contextPath }/buyForm.do";
						frm.attr("action",url);
						frm.submit();
					}
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
 <h4>상품평</h4> <input type="button" value="별점테스트" onclick="fn_star()"/>
 <script>
	function fn_star(){
		location.href="${pageContext.request.contextPath}/review_star.do";
	}
</script>
 <div>별점 이미지    ,참여인원
 <c:choose>
	<c:when test="${review.review_star eq '10' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '9' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
	</c:when>
	<c:when test="${review.review_star eq '8' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '7' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '6' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '5' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '4' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '3' }" >
 	<i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '2' }" >
 	<i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '1' }" >
 	<i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
	<c:when test="${review.review_star eq '0' }" >
 	<i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
	</c:when>
 </c:choose>
 </div>
 <div>상품평 이미지</div>
  
  
 <hr>
 <div> 작성자, 작성일, 내용</div>
  상품평 페이징 처리
  
   </div>
   <div id="section3" class="container tab-pane fade">
			
  
  <hr>
  상품문의
  <div> 문의자  , 문의날짜, 문의내용</div>
	</div>
</div>
 
  
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />