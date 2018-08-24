<%@page import="com.notnull.shop.product.model.vo.ProductQuestion"%>
<%@page import="java.util.List"%>
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
#like_btn{
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: 0 auto;
  width: 90px;
  height: 40px;
  background: #FFFFFF;
  border: 0;
  font-size: .9rem;
  font-family: Futura;
  transition: all .2s ease-in-out;
  cursor: pointer;
  border-radius: 6px;
  box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.1);
  outline: none;
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
	List<ProductQuestion> questionList =(List)request.getAttribute("questionList");
	
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
			$("#del_price").text("무료배송");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
		var point= parseInt(sell_price*0.02);
		$(".point").text(point);
	}
	function add () {
		amount = document.form.cart_quantity;
		amount.value ++ ;
		var result = parseInt(amount.value) * sell_price;
		$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(result>=20000){
			$("#del_price").text("무료배송");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
		var point= parseInt(result*0.02);
		$(".point").text(point);
	}
	function del () {
		amount = document.form.cart_quantity;
		if (amount.value > 1) {
			amount.value -- ;
			var result = parseInt(amount.value) * sell_price;
			$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			if(result>=20000){
				$("#del_price").text("무료배송");
			}else{
				$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
			}
			var point= parseInt(result*0.02);
			$(".point").text(point);
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
	<div class="col-6 images_sum">
	
	<style>
		.sub_images {
			margin-left : 17px;
		}
		.sub_images:hover {
		box-shadow: 10px 10px 20px #b4b2b2;
		
		
		
}
		.main_image {
		
			max-width : 100%;
			
			cursor : pointer;
			overflow: hidden;
			}

		#mainImg {
			max-width:100%;
			max-height : 355px;
			margin-left: auto; 
			margin-right: auto; 
			display: block;
	
		}
	</style>
	<c:forEach var='imgList' items='${imgList }' varStatus="vs">
	
		
		<c:if test="${vs.index==0}">
		<div class = "main_image">
  		<img src="${path }/resources/upload/productImg/${imgList.new_p_img_path }" alt="상세상품" id="mainImg"/>
  		</div>
  		</c:if>
  		
  		
  		
  		<c:if test="${vs.index>=0}">
  		
  		<div class = "sub_images" style = "float:left; padding-right:10px;">
  		<img width="60px" height="60px"  src="${path }/resources/upload/productImg/${imgList.new_p_img_path }" alt="상세상품"
  			 onmouseover="javascript:changeImg('${path}/resources/upload/productImg/${imgList.new_p_img_path }');"/>
  		</div>
  		
  		</c:if>
  		
  	</c:forEach>
	</div>
	
	<style>
	
	.infoBox {
		padding : 0 40px;
		
		}
		
		.infoBox h1 {
			margin:0;
			color : #2e2e2e;
			font-size : 30px;
			line-height: 48px;
			font-weight: bold;
		}
		
		.pdt_price {
			color : #2e2e2e;
			font-size : 42px;
			line-height : 42px;
			font-weight: bold;
		}
		
		.pdt_price_txt {
			color : #2e2e2e;
			font-size : 20px;
			line-height: 42px;
			font-weight: bold;
			
		}
		
		.d_line {
			width: 100%;
			height : 20px;
			background: url("./resources/images/border_line.gif") repeat-x 0 center;
			overflow: hidden;
		}
	</style>
	<div class="col-6">
		
		<!-- 사진 옆 상품에 대 한 상세정보 전체를 감싸는 div -->
		<div class = "infoBox">
		
			<c:if test="${memberLoggedIn.member_level eq 'admin'}">
			<input type= "button" class='btn btn-outline-danger' value="삭제" onclick="deleteProduct(${joinCategory.product_code})"/>		
			<input type= "button" class='btn btn-outline-danger' value="수정" onclick="updateProduct(${joinCategory.product_code})"/>
			</c:if>
			
			
			
			<!-- 삼품명을 불러오는 코드부분 -->
			<h1 style = "box-sizing:border-box;padding-right:150px;position:relative;">${joinCategory.product_name}</h1>
			
			
			<script>
			function deleteProduct(product_code)
		      {
		           location.href="${path}/deleteProduct.do?product_code="+product_code;
		      }
			
			function updateProduct(product_code)
		      {
		           location.href="${path}/updateProduct.do?product_code="+product_code;
		      }
			
			</script>
			
			<div class = pdt_price>
			
			<span id="price">${joinCategory.price}</span>
			
			<span class = "pdt_price_txt"> 원</span>
			
			</div>
			
			
			<!-- <hr>줄 처럼 만든 div -->
			<div class = "d_line">
			
			</div>
			
			<style>
			
			.option_section {
				margin : 0;
				padding : 3px 0;
				font-size : 15px;
				line-height: 33px;
				overflow: hidden;
			}
				.option_section dt {
					float : left;
					color : #000;
					font-weight: bold;
				}
				
				.option_section dd {
					margin : 0;
					padding-left : 68px;
					color : #000;
				}
				
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
			
			<!-- 상품 옵션에 대한 메뉴 카테고리 담은 div -->
			<dl class = "option_section">
			<dt>도착일 :</dt>
			
				<dd> <%=strdate%></dd>

			
			<dt>배송비 : </dt>
			
			<dd id="del_price"></dd>
			
		
			
			<dt>포인트 :</dt>
			
				<dd>
				
				<span class = "point_icon"><center>P</center></span>  
				<strong class="point">100</strong><span> 적립</span>
				</dd>
				
			<dt>제조국 :</dt>
			
				<dd>한국</dd>	
			
			</dl>
			<!--
				상품 평점 남기는 부분 코드 시작
			 -->
	
			 <c:set var="total" value="0"/>
			 <c:forEach var="review" items="${reviewList}" varStatus="vs">
				<c:set var="total" value="${(total+review.review_star)}"/>
				<c:set var="count" value="${vs.count }"/>
			 </c:forEach>
			 
			 
			 <c:choose>
				 <c:when test="${total  == 0}">
					 <b>평점 : </b><span class="star-prototype" style = "margin-left : 24px;">0</span>
				 </c:when>
				 <c:otherwise>
				 	 <b>평점 : </b><span class="star-prototype" style = "margin-left : 24px;">${total/count}</span>
				 </c:otherwise>
			 </c:choose>
			 
			 <c:choose>
				 <c:when test="${count > 0}">
					 <b><c:out value="${count}개 상품평"/></b>
				 </c:when>
				 <c:otherwise>
				 	 <b><c:out value="0개 상품평"/></b>
				 </c:otherwise>
			</c:choose>
			
			<!-- <hr>줄 처럼 만든 div -->
			<div class = "d_line">
			
			</div>
			
			
			<style>
			
				.selected_option {
					position: relative;
					margin-top : -1px;
					padding : 15px 30px 20px 10px;
					border : 1px solid #c4c4c4;
					color : #000;
					font-size : 14px;
					line-height : 20px;
					overflow: hidden;
					box-shadow : 1px 1px 3px #c4c4c4;
					height : 63px;
				}
			</style>
			<div class = "selected_option">
			
			<form name="form" id="frm" method="get">
				<input type="hidden" name="member_id" class="member_id" value="${memberLoggedIn.member_id}"/>
				<input type="hidden" name="product_code" value="${joinCategory.product_code}"/>
				<c:if test="${optionList!=null && optionList.size()>0}">
					<c:choose>
						<c:when test="${optionList.size()<2}">

							<c:forEach var="option" items="${optionList}">
								<input type="hidden" name="product_option_code" value="${option.product_option_code}"/>
							</c:forEach>
							
							<c:forEach var="option" items="${optionList}" varStatus="vs">
								<c:choose>
									<c:when test="${option.option_size == null}">
										<span id="single_left">재고 : ${option.left_amount}</span>
										<input type="hidden" name="product_option_code" value="${option.product_option_code}"/>
									</c:when>
									
									<c:when test="${option.left_amount<=0}">
										<select name="product_option_code" style="font-size:15px;height:28px;" >
											<option value="${option.product_option_code}" disabled>${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
										</select>
									</c:when>
									<c:otherwise>
										<select name="product_option_code" style="font-size:15px;height:28px;" >
											<option value="${option.product_option_code}">${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
										</select>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							
							<select name="product_option_code" style="font-size:15px;height:28px;" >
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
						</c:otherwise>
					</c:choose>
					&emsp;&emsp;&emsp;
	            </c:if>
	            
	            <style>
	            	.selected_option .count_control {
	            		position: absolute;
	            		left: 205px;
	            		top : 16px;
	            	}
	            	
	            	.count_control {
	            		display : inline-block;
	            		border : 1px solid #c4c4c4;
	            		font-size : 0;
	            		line-height: 0;
	            	}
	            	.count_control input {
	            		width : 40px;
	            		height : 25px;
	            		padding : 0 5px;
	            		border : none;
	            		border-right : 1px solid #c4c4c4;
	            		border-left : 1px solid #c4c4c4;
	            		font-size : 14px;
	            		line-height: 21px;
	            		text-align: center;
	            		box-sizing: border-box;
	            		vertical-align: top;
	            	}
	            	
	            	.count_control img {
	            		vertical-align: top;
	            		cursor: pointer;
	            	}
	            
	            </style>
	            <!-- <div class = "count_control">
	            <input type="button" value="-"  onclick="del();"/>
				<input type="text" name="cart_quantity" value="1" size="2" style="height:25px; width:40px;"  readonly/>
				<input type="button" value="+" onclick="add();"/>
				</div> -->
				
				<div class = "count_control">
				
				<span class = "btn_minus">
					<img src ="./resources/images/btn_count_minus.gif" alt ="Minus" onclick="del();">
				</span>
				
					<input type="text" name="cart_quantity" value="1" size="2" readonly/>
			
				
				<span class = "btn_plus">
					<img src ="./resources/images/btn_count_plus.gif" alt ="Plus" onclick="add();">
				</span>
				</div>
				
				
				
			</form>
			</div>
			
			<div class = "d_line">
			
			</div>
			
			<style>
			
			.btn_cart {
				float:left;
				width : 43%;
				height : 70px;
				background : #92979b;
				color : #fff;
				font-size : 18px;
				line-height: 55px;
				text-align: center;
				font-weight : bold;
				cursor: pointer;
			}
			
			.cart_icon {
				display: inline-block;
				margin : -5px 5px 0 0;
				font-size : 35px;
				vertical-align: middle;
			}
			
			.btn_buy {
				float : left;
				width : 56%;
				height : 70px;
				margin-left: 1%;
				background : #2D2E33;
				color : #fff;
				font-size: 18px;
				line-height: 55px;
				text-align: center;
				font-weight: bold;
				cursor: pointer;
			}
			
			.buy_icon {
				display: inline-block;
				margin : -5px 5px 0 0;
				font-size : 35px;
				vertical-align: middle;
			}
			</style>
			
			<div class = "btn_area">
			
			
					<button class="btn btn_cart" type="button" id="cart">
						<span class ="cart_icon fas fa-shopping-cart"></span>
					장바구니
					
					</button>
					<button class="btn btn_buy" type="button" id="buy">
						<span class = "buy_icon far fa-credit-card"></span>
					구매하기
					
					</button>
					
			
			</div>
			
		
			
			<script>
			$(function(){
				$('#cart').click(function(){
					var member_id=$('.member_id').val();
					if(member_id==null||member_id.length<1){
						alert("로그인 후 이용해주시기 바랍니다.");
						location.href="${pageContext.request.contextPath}/memberLoginBefore.do";
					}
					else{
						var left_amount=0;
						if($('#single_left').length){
							var left_amount1=$('#single_left').text().split(':');
							left_amount=parseInt(left_amount1[1]);
						}else{
							var left_amount2=$('[name=product_option_code] option:selected').text().split(':');
							left_amount=parseInt(left_amount2[1]);
						}
						if(left_amount < parseInt($('[name=cart_quantity]').val()) ){
							alert("재고가 부족합니다.");
							return false;
						}
						
						var productInfo={
								member_id:member_id,
								product_option_code:$("[name=product_option_code]").val(),
								product_code:$("[name=product_code]").val(),
								cart_quantity:$("[name=cart_quantity]").val()
						};
						$.ajax({
							url:"${pageContext.request.contextPath}/cartInsert.do",
							data:productInfo,
							success:function(data){
								if(data.trim()=='0'){
									alert("장바구니 추가에 실패하였습니다.");
									return false;
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
						location.href="${pageContext.request.contextPath}/memberLoginBefore.do";
					}else{
						var left_amount=0;
						if($('#single_left').length){
							var left_amount1=$('#single_left').text().split(':');
							left_amount=parseInt(left_amount1[1]);
						}else{
							var left_amount2=$('[name=product_option_code] option:selected').text().split(':');
							left_amount=parseInt(left_amount2[1]);
						}
						if(left_amount < parseInt($('[name=cart_quantity]').val()) ){
							alert("재고가 부족합니다.");
							return false;
						}
					
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

<style>

	.nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
		border-bottom : 4px solid #2D2E33;
		background-color: #e7e7e7;
	}
	.nav-tabs .nav-link {
		border:1px solid #e7e7e7 ;
	}
	.link01 {
		display: table-cell;
		padding : 10px 0;
		border : 1px solid #e7e7e7;
		border-left : 1px solid #e7e7e7;
		background : #fcfcfb;
		color : #2e2e2e;
		font-size : 15px;
		box-sizing: border-box;
		text-align: center;
		font-weight: bold;
		border-bottom: 4px solid #fcfcfb;
		width : 260px;
	}
	
	.link01:hover {
	border-bottom: 4px solid black;
}

	.link02 {
		display: table-cell;
		padding : 10px 0;
		border : 1px solid #e7e7e7;
		border-left : 1px solid #e7e7e7;
		background : #fcfcfb;
		color : #2e2e2e;
		font-size : 15px;
		box-sizing: border-box;
		text-align: center;
		font-weight: bold;
		border-bottom: 4px solid #fcfcfb;
		width : 316px;
	}
	
	.link02:hover {
	border-bottom: 4px solid red;
}
	
	.link03 {
		display: table-cell;
		padding : 10px 0;
		border : 1px solid #e7e7e7;
		border-left : 1px solid #e7e7e7;
		background : #fcfcfb;
		color : #2e2e2e;
		font-size : 15px;
		box-sizing: border-box;
		text-align: center;
		font-weight: bold;
		border-bottom: 4px solid #fcfcfb;
		width : 315px;
	}
	
	.link03:hover {
	border-bottom: 4px solid black;
}
</style>


<div class="container">

  <ul class="nav nav-tabs" role="tablist">
  
     <li class="nav-item">
       <a class="nav-link active link01" data-toggle="tab" href="#section1">상품 상세</a>
    </li>
    
    <li class="nav-item">
       <a class="nav-link link02" data-toggle="tab" href="#section2">상품평</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link link03" data-toggle="tab" href="#section3">상품문의</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link link03" data-toggle="tab" href="#section4">배송/교환/반품</a>
    </li>
    
  </ul>

 <div class="tab-content">
 
 
  <div id="section1" class="container tab-pane active">
			
  
	
  <b>필수 표기정보</b>
  <table class="table table-bordered">
  	<tr>
  		<td width="15%" style="background-color:#D5D5D5">품명 및 모델명</td>
  		<td width="35%">${joinCategory.product_name}</td>
  		<td width="15%" style="background-color:#D5D5D5">출시일</td>
  		<td width="35%">${joinCategory.release_date}</td>
  	</tr>
  	<tr>
  		<td width="15%" style="background-color:#D5D5D5">제조국 (원산지)</td>
  		<td width="35%">${joinCategory.country}</td>
  		<td width="15%" style="background-color:#D5D5D5">크기</td>
  		<td width="35%">${joinCategory.real_size}</td>
  	</tr>
  </table>
  
  <style>
  	.detail_img_container{
  		text-align: center;
  	}
  	.detail_img_container .detail_img{
  		max-width: 835px;
  	}
  	
  	.countCheck td{
  		width : 20px;
  	}
  	
  </style>
  
  	<div class="detail_img_container">
  			<c:forEach var='deImg' items='${detailImgList }' varStatus="vs">
  				<img class="detail_img" src="${path }/resources/upload/productDetailImg/${deImg.new_p_detail_img_path }" alt="상세상품"/><br>
  			</c:forEach>
 	</div>
  </div>
  <div id="section2" class="container tab-pane fade">
 <br>		
 <input type="button" value="테스트" onclick="fn_productReview()"/>
 <hr>
 <h4>상품평</h4> 
 <script>
	function fn_productReview(){
		location.href="${pageContext.request.contextPath}/productReviewTest.do?product_code=${joinCategory.product_code}";
	}
</script>
 <%-- <div> 
	 <c:set var="total" value="0"/>
	 <c:forEach var="review" items="${reviewList}" varStatus="vs">
		<c:set var="total" value="${(total+review.review_star)}"/>
		<c:set var="count" value="${vs.count }"/>
	 </c:forEach>
	 <c:out value="${total/count}"/>
	 <span class="star-prototype">${total/count}</span>
	 참여인원:<c:out value="${count }"/>
 </div> --%>

 <%-- <div>상품평 이미지</div>
   <c:forEach var='imgList' items='${reviewImgList}' varStatus="vs">
		<img width="10%" height="10%" src="${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}"/>				
	</c:forEach> --%>
	<hr>
<script>
$(function(){
	var member_id="${memberLoggedIn.member_id}";
	var reviewLength=$(".reviewLength").val();
	
	var statusList = new Array(); 
	var idList = new Array();
	var codeList = new Array();
	
	<c:forEach items="${likeList}" var="item">
	statusList.push("${item.like_status}");
	idList.push("${item.member_id}");
	codeList.push("${item.review_code}");
	</c:forEach>
	
	for(var i=0;i<reviewLength;i++){
		var y_count=0;
		var n_count=0;
		for(var j=0;j<statusList.length;j++){
			if($('.review_code'+i).val()==codeList[j]){
				if(statusList[j]=='Y'){
					y_count=y_count+1;
				}else{
					n_count=n_count+1;
				}
			}
			if(member_id==idList[j] && $('.review_code'+i).val()==codeList[j]){
				if(statusList[j]=='Y'){
					$('.like'+i).css("color", "#1E96FF");
				}else{
					$('.dislike'+i).css("color", "#FF3232");
				}
			}
		}
		$('.yCount'+i).html(y_count);
		$('.nCount'+i).html(n_count);
	}
});
	
</script>


<style>
/* <!--상품평 미리보기를 위한 스타일-> */
 	#preview{
	position:absolute;
	border:1px solid #ccc;
	background:#333;
	padding:5px;
	display:none;
	color:#fff;
	}
	.review_post_area {
  		background-color : #fff;
  		margin-top : -1px;
  		border:1px solid #ddd;
  		padding: 15px 15px 15px 107px;
  		position: relative;
  	}
  	.area_left {
  		position: absolute;
  		left : 15px;
  		top : 15px;
  	}
  	
  	.area_left img {
  		border: 1px solid #ddd;
  		width : 75px;
  	}
  	
  	.profile {
  		height : 45px;
  		border-bottom : 1px solid #ddd;
  	}
  	
  	.profile p {
  		width : auto;
  		float : left;
  		padding-top : 10px;
  		line-height: 12px;
  		color : #000;
  	
  	}
  	
  	.profile p > span{
  		padding : 0 10px 0 0 ;
  		margin-right : 10px;
  		float : left;
  		display: block;
  		border-right: 1px solid #ddd;  	
  	}
  	
  	.star_review {
  		border-right: 0;
  	}
  	
  	.user_id {
  		font-weight : bold;
  	}
  	
  	.write_date {
  		font-weight: normal;
  		color : #b2b2b2;
  	}
  	
  	.product_name {
  		margin-bottom: 10px
  		padding-bottom : 10px;
  		border-bottom: 1px solid #ddd;
  		color : #000;
  	}
</style>

<!-- 상품평 테이블 만드는 곳 -->
<c:forEach var="review" items="${reviewList}" varStatus="vs">
  	<div class = "review_post_area">
  	
  		<div class = "area_left">
  			<img src = "./resources/images/profile_image.gif">
  		</div>
  		
  		<div class = "area_right">
  		
  		<!-- 구매자에 대한 프로필 정보가 넘어오는 공간 -->
  			<div class = "review_contents">
  				<div class = "profile">
  					<p>
  					<!-- 아이디 넘어오는 공간 -->
  						<span class = "user_id">
  							${review.member_id}
  						</span>
  						<!-- 구매날짜 넘어오는 공간 -->
  						<span class = "write_date">
  							${review.review_date}
  						</span>
  						<!-- 평점 넘오는 공간 -->
  						<span class = "star_review star-prototype" style = "border-right: 0;">
  							${review.review_star }
  						</span>
  					
  					
  					</p>
  					
  				</div>
  			<style>
  				.product_name {
  					padding-top : 10px;
  					margin-bottom: 0;
  					padding-bottom: 10px;
  					border-bottom: 1px solid #ddd;
  					color : #000;
  					font-weight: bold;
  					font-size : 14px;
  				}
  				
  				.write_review {
  					line-height: 20px;
  					padding:15px 0;	
  				}
  				
  				.content_review {
  					color : #b2b2b2;
  					
  				}
  			</style>
  			
  				<!-- 상품명 넘어오는 공간 -->
  				<div class = "product_name">
  					캠핑용품입니다.
  				</div>
  				
  				<!-- 상품평 제목이라고 써져있는 곳 넘어오는 div 공간 -->
  				<div class = "write_review">
  					<span class = "content_review">
  						${review.review_content}
  					</span>
  				</div>
  				
  				<!-- 그림 이미지 넘어오는 div공간 -->
  				<div class = "photo_review">
  				<c:if test="${reviewImgList != null}">
					<c:forEach var='imgList' items='${reviewImgList}'>
						<c:if test="${review.review_code eq imgList.review_code }">
							<a href = "${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}" class = "preview">
							<img src="${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}" style = "width:10%; height:10%;"/>
							</a>			
						</c:if>
					</c:forEach>
				</c:if>
  				</div>
  				
  				<style>
  				.like_dislike {
  					margin-top : 20px;
  					padding : 15px;
  					background-color: #fff;
  					border:1px solid #ddd;
  					width : 30%;
  					}
  				</style>
  				
  				<!-- 좋아요 싫어요 들어가는 div -->
  				<div class = "Like_dislike">
  				<input type="hidden" class="reviewLength" value="${fn:length(reviewList)}"/>
					<table class='countCheck'>
				 	<input type="hidden" name="review_code" class="review_code${vs.index}" value="${review.review_code }"/> 
						<tbody>
							<tr>
								<td>
									<i class="far fa-thumbs-up like like${vs.index}" style="cursor:pointer; font-size:25px; color:#bebebe"></i>	
								</td>
								<td>
									<span class='yCount${vs.index} yCount'>0</span>
								</td>
								<td>
									<i class="far fa-thumbs-down dislike dislike${vs.index}"  style="cursor:pointer; font-size:25px; color:#bebebe"></i>
								</td>
								<td>
									<span class='nCount${vs.index} nCount'>0</span>
								</td>
							</tr>
						</tbody>
					</table>		
  				</div>
  			</div>
  			
  		</div>
  	
  	</div>
</c:forEach>
</div>
<script>
//좋아요
$(function(){
	
$('.like').on('click',function(){
	var thtag=$(this);
	var member_id="${memberLoggedIn.member_id}";
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else{
		var likeInfo={
				member_id:member_id,
				review_code:$(this).parent().parent().parent().siblings("[name=review_code]").val(),
				like_status:'Y'
		};
		$.ajax({
			url:"${pageContext.request.contextPath}/like.do",
			data:likeInfo,
			success:function(data){
				console.log(data);				
				if(data.result==0){
					alert("버튼에러");
					e.preventDefault();
				}else{
					var yCount=thtag.parent().parent().find('.yCount');
					var nCount=thtag.parent().parent().find('.nCount');
					if(data.likeOn==1){
						thtag.css("color", "#1E96FF");
						var count= parseInt(yCount.html())+1;
						yCount.html(count);
						// 좋아요 +1
					}else if(data.likeOn==2){
						thtag.css("color", "#bebebe");
						var count= parseInt(yCount.html())-1;
						yCount.html(count);
						// 좋아요 -1
					}else{
						thtag.css("color", "#1E96FF");
						thtag.parent().parent().find('.dislike').css("color", "#bebebe");
						var count= parseInt(yCount.html())+1;
						yCount.html(count);
						var count= parseInt(nCount.html())-1;
						nCount.html(count);
						// 좋아요 +1 , 싫어요 -1
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
$('.dislike').on('click',function(){
	var thtag=$(this);
	var member_id="${memberLoggedIn.member_id}";
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else{
		var likeInfo={
				member_id:member_id,
				review_code:$(this).parent().parent().parent().siblings("[name=review_code]").val(),
				like_status:'N'
		};
		$.ajax({
			url:"${pageContext.request.contextPath}/dislike.do",
			data:likeInfo,
			success:function(data){
				if(data.result==0){
					alert("버튼에러");
					e.preventDefault();
				}else{
					var yCount=thtag.parent().parent().find('.yCount');
					var nCount=thtag.parent().parent().find('.nCount');
					if(data.likeOn==1){
						thtag.css("color", "#FF3232");
						var count= parseInt(nCount.html())+1;
						nCount.html(count);
						//싫어요 +1
					}else if(data.likeOn==2){
						thtag.css("color", "#bebebe");
						var count= parseInt(nCount.html())-1;
						nCount.html(count);
						//싫어요 -1
					}else{
						thtag.css("color", "#FF3232");
						thtag.parent().parent().find('.like').css("color", "#bebebe");
						var count= parseInt(nCount.html())+1;
						nCount.html(count);
						var count= parseInt(yCount.html())-1;
						yCount.html(count);
						//싫어요 +1 , 좋아요 -1
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


});

//별점
$.fn.generateStars = function() {
 return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};
//숫자 평점을 별로 변환하도록 호출하는 함수
$('.star-prototype').generateStars();
 
</script>

  
<div id="section3" class="container tab-pane fade">
			
  

  상품문의
  <div class="container">
 <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Question</strong></span> 
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea  style="width: 1100px" rows="3" cols="30" id="p_question_content" name="p_question_content" placeholder="문의사항을 입력하세요"></textarea>
                            <br>
                            <div>
                            <input type="hidden" id="product_code" name="product_code" value="${joinCategory.product_code }" />        
							<input type='hidden' id="member_id" name='member_id' value='${memberLoggedIn.member_id}'/>
							<input type='hidden' id="member_level" name='member_level' value='${memberLoggedIn.member_level}'/>							
							<input type='hidden' name='question_level' value='1'/>
							<input type='hidden' name='p_question_code_ref' value='0' />
                            <input type="button" class="btn pull-right btn-success input" value="등록"  />                
                            </div>
                        </td>
                    </tr>
                </table>
                
            </div>
        </div>
  </form>
  
  </div>
		<div id="comment-container">
			<table id="tbl-comment">
				    <%
				    if(questionList != null){
				        for(ProductQuestion productQuestion : questionList)
				        {
				       	 if(productQuestion.getQuestion_level()==1){%>
					    <tr class='level1'>
					        <td>
					            <sub class=comment-writer><%=productQuestion.getMember_id() %></sub>
					            <sub class=comment-date><%=productQuestion.getQuestion_date()%></sub>
						    <br /> <br />
					            <%=productQuestion.getP_question_content() %>
							</td>
					        <td>
					            <button class="btn btn-outline-success btn-sm" value="<%=productQuestion.getP_question_code()%>">답글</button>
					            <button class="btn btn-outline-dark btn-sm delete" value="<%=productQuestion.getP_question_code()%>">삭제</button>
					        </td>
					        
					    </tr>
				  		<%}
				        else
				        {%>
				        	<tr class='level2'>
				        		<td style="padding-left: 40px">
				        			<sub><%=productQuestion.getMember_id()%></sub>
				        			<sub><%=productQuestion.getQuestion_date()%></sub>
				        			<br>
				        			<%=productQuestion.getP_question_content()%>
				        		</td>
				        		<td></td>
				        	</tr>
				        	
				     	<% }
				        
				    	}   
				   } %>
				 	
			        <script>
			      		var logIn="<c:out value='${memberLoggedIn.member_id}'/>";
			        	$(".btn-outline-success").on('click',function(e){
			        		if(logIn!=null){
			        		//화면에 출력될 답글 입력창 만들기
			        		var tr=$("<tr></tr>");	//태그생성
			        		var html="<td style='display:none;text-align:left;' colspan=2>";
			        		html+='<form id="answerForm" name="answerForm" method="post">';
			        		html+="<input type='hidden' name='product_code' value='${joinCategory.product_code }'/>";
			        		html+="<input type='hidden' name='member_id' value='${memberLoggedIn.member_id}'/>";
			        		html+="<input type='hidden' name='question_level' value='2'/>";
			        		html+="<input type='hidden' name='p_question_code_ref' value='"+$(this).val()+"'/>";			        		
			        		html+="<textarea name='p_question_content' cols='60' rows='1'></textarea>";
			        		html+="<input type='button' class='btn-insert2 answer' value='등록'/>";
			        		html+="</form></td>";
			        		//위에서 작성한 html구문을 tr 변수 text노드에 삽입
			        		tr.html(html);
			        		//작성된 tr 태그를 본 html 구문의 (tr class=level1) 뒤에 삽입
			        		tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			        		//이벤트가 1회만 발생하게 제한
			        		$(this).off('click');
			        		//답글달고 버튼을 누르면 해당 서블릿에 데이터 전송
			        		tr.find('form').submit(function(e){
			        			if(logIn==null){
			        				fn_loginAlert();
			        				e.preventDefault();
			        			}	
			        			var len=$(this).children('textarea').val().trim().length;
			        			if(len==0){
			        				e.preventDefault();
			        				tr.find('textarea').focus();
			        			}
			        		});
			        		}
			        	});
			        
			        </script>
   				 </table>
   		</div> 
	</div>
	
	<div id="section4" class="container tab-pane fade">
	
		<table style = "margin : 0px; border-spacing: 0px; border-collapse: collapse; border : 0; width : 100%; cellspacing = "0" cellpadding = "0">
			
			
			<tbody>
			
			<tr>
				<td style = "line-height: 13pt; marin:0px; padding:0px;">
					
				</td>
				
			</tr>
			
			
			<tr>
				<td style = "line-height: 13pt; margin:0px; padding:0px; height:30;">
					<strong>배송정보</strong>
				</td>
			</tr>
			
		
			
			</tbody>
		
		
		
		
		</table>
	</div>
</div>
<script>
//문의사항 등록
$(document).on("click",".input",function(){
	var formData = $("#commentForm").serialize();
	var member_id=$('#member_id').val();
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else{
		
		$.ajax({
			url:"${pageContext.request.contextPath}/addQuestion.do",
			data:formData,
			success:function(data){
				console.log(data);							
				$("#p_question_content").val("");
				$("#comment-container").html(data);
					

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
//삭제
$(document).on("click",".delete",function(e){
	alert("!!!삭제버튼");
	var p_question_code = $(this).val();
	var product_code=$('#product_code').val();
	var member_level=$('#member_level').val();
	var member_id=$('#member_id').val();
	var writer= $(this).parent().parent().find(".comment-writer").html();
	
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else if(member_level=='admin' || member_id==writer){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/deleteQuestion.do",
			data:{ p_question_code:p_question_code,
					product_code:product_code},
			success:function(data){
				console.log(data);							
				$("#p_question_content").val("");
				$("#comment-container").html(data);
					

			},
			error:function(jpxhr,textStatus,errormsg){
				console.log("ajax전송실패.");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		});
	}else{
		
		alert("관리자나 자신의 글만 삭제가능")
	}
});
//답글

$(document).on("click",".answer",function(e){
	var formData = $("#answerForm").serialize();
	var member_id=$('#member_id').val();
	var member_level=$('#member_level').val();
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else if(member_level=='admin'){
		$.ajax({
			
			url:"${pageContext.request.contextPath}/addQuestion.do",
			data:formData,
			success:function(data){		
					$("#p_question_content").val("");
					$("#comment-container").html(data);
			},
			error:function(jpxhr,textStatus,errormsg){
				console.log("ajax전송실패.");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		});
	}else{
		alert("관리자만 답변가능");
	}
});

function changeImg(src) {
	var img1 = document.getElementById("mainImg");
	img1.src = src;
	
}
</script>

 
  
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />