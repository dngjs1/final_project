<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="pageTitle"/>
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
	$(function(){
       	init();
       	$("#check_all").change(function(){
    		if($("#check_all").is(":checked")){
    			$("input[name=check]").prop("checked", true);
    		}else{
    			$("input[name=check]").prop("checked", false);
    		}
    	});
       	$("input[name=chk]").each(function(idx){   
            var value = $(this).val();
     
            var eqValue = $("input[name=chk]:eq(" + idx + ")").val() ;
             
            console.log(value + ":" + eqValue) ;
             
          });

   	});
	function init () {
		var sum=0;
		for(var i=1;i<=$('.cartLength').val();i++){
			var sell_price = parseInt($('.price'+i).html());
			var amount = $('.cart_quantity'+i).val();
			var result = parseInt(amount) * sell_price;
			$(".price"+i).text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$(".sum_price"+i).text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			sum=sum+result;
		}
		var total_sum=0;
		if(sum>=20000){
			deli="무료";
			total_sum=sum;
		}else if(sum==0){
			deli="0원";
			$(".deli-price").text("0원");
			total_sum=0;
		}else{
			deli="2,500원";
			total_sum=sum+2500;
		}
		$(".deli-price").text(deli);
		$(".total-product-price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$(".total-price").text(total_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		var point=parseInt(sum*0.02);
		$('#save_point').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
	}
	
	function change_price(){
		$(".total-price").siblings().show();
		var check= document.getElementsByName("check");
		var sum=0;
		for(var i=1;i<=$('.cartLength').val();i++){
			if( check[i-1].checked == true ){
				var sell_price = parseInt($('.price'+i).html().replace(/,/gi, ""));
				var amount = $('.cart_quantity'+i).val();
				var result = parseInt(amount) * sell_price;
				$(".sum_price"+i).text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				sum=sum+result;
			}
		}
		var deli="";
		var total_sum=0;
		if(sum>=20000){
			deli="무료";
			total_sum=sum;
		}else if(sum==0){
			deli="0원";
			total_sum=0;
		}else{
			deli="2,500원";
			total_sum=sum+2500;
		}
		$(".deli-price").text(deli);
		$(".total-product-price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$(".total-price").text(total_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(total_sum==0){
			$(".total-price").siblings().hide();
			$(".total-price").text("0");
		}
		var point=parseInt(sum*0.02);
		$('#save_point').text(point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
	}
	
	$(function(){
		$("[name=check], #check_all").on("change",function(){
			var sum=0;
			change_price();
		});
		$('.add').on("click",function(){
			var quantity=$(this).siblings('.quantity');
			hm = parseInt(quantity.val());
			hm = hm+1;
			sell_price=$(this).parent().prev().find(".sell_price").html().replace(/,/gi, "");
			var result = hm * parseInt(sell_price);
			sum=$(this).parent().parent().find(".sum");
			sum.text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			
			var quantityInfo={
					cart_code:$(this).siblings('.cart_code').val(),
					cart_quantity:hm
			};
			$.ajax({
				url:"${pageContext.request.contextPath}/changeCart.do",
				data:quantityInfo,
				success:function(data){
					quantity.val(hm);
					change_price();
				},
				error:function(jpxhr,textStatus,errormsg){
					console.log("ajax전송실패.");
				}
			});
		});
		$('.del').on("click",function(){
			var quantity=$(this).siblings('.quantity');
			hm = parseInt(quantity.val());
			if (hm > 1) {
				hm = hm-1;
				sell_price=$(this).parent().prev().find(".sell_price").html().replace(/,/gi, "");
				var result = hm * parseInt(sell_price);
				sum=$(this).parent().parent().find(".sum");
				sum.text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
				
				var quantityInfo={
					cart_code:$(this).siblings('.cart_code').val(),
					cart_quantity:hm
				};
				$.ajax({
					url:"${pageContext.request.contextPath}/changeCart.do",
					data:quantityInfo,
					success:function(data){
						quantity.val(hm);
						change_price();
					},
					error:function(jpxhr,textStatus,errormsg){
						console.log("ajax전송실패.");
					}
				});
			}
		});
		$('.cancel').on("click",function(){
			var cart_code=$(this).parent().parent().find('.cart_code').val();
			location.href="${pageContext.request.contextPath }/deleteCart.do?cart_code="+cart_code+"&member_id=${memberLoggedIn.member_id}";
		})
	});
	
	$(function(){
		$('.click_product').on('click',function(){
			var product_code=$(this).parent().parent().find('.product_code').val();
			location.href="${pageContext.request.contextPath}/productView.do?product_code="+product_code;
		});
	});
</script>

<style>
	.cart_box_step {
		height: 80px;
		background : #fcfcfb;
		overflow: hidden;
		
	}
	
	.cart_box_step h1 {
		float : left;
		margin-left : 18px;
		font-size : 26px;
		line-height: 78px;
		font-weight: bold;
		
	}
	.cart_box_step ul {
		float : right;
		margin-right : 15px;
		overflow: hidden;
	}
	
	.cart_box_step ul li {
		float : left;
		height : 80px;
		padding : 0 15px 0 55px;
		background : url(./resources/images/bg_step_item.jpg) no-repeat 0 0;
		color : #000;
		font-size: 20px;
		line-height: 78px;
		font-weight: bold;
		
	}
	
	.cart_box_step ul li.top span {
		background: #2d2e33;
		color : #fff;
	}
	
	.cart_box_step ul li span {
		display: inline-block;
		width : 39px;
		height: 39px;
		margin-right: 6px;
		border-radius: 100%;
		background-color : #d8dbdd;
		font-size:17px;
		line-height: 37px;
		text-align: center;
		vertical-align: middle;
		letter-spacing: 0;
		color : #fff;
	}
</style>
<div class="container cart">
	<div class = "cart_box_step">
	<h1><i class="fas fa-cart-arrow-down"></i> 장바구니</h1>
		<ul class = "step_number">
			<li class = "top" style = "background: none; border-bottom:none;">
			<span>01</span>
				장바구니
				</li>
			<li>
			<span>02</span>
				주문작성 / 결제
			</li>
			<li>
			<span>03</span>
				주문완료
			</li>
		
		</ul>
	</div>
	
	<style>
		.cart_title_01 {
			margin-top:20px;
			padding:10px;
			font-size : 20px;
			line-height: 38px;
			font-weight: bold;
			text-align: left;
		}
		.cart_board th {
			padding: 21px 0;
			border-left: 1px solid #eaeaea;
			background : #C5C5E6;
			color : black;
			font-weight : bold;
			text-align: center;
			vertical-align: middle;
			font-size : 16px;
		}
		.cart_board th:first-child {
			border-left : none;
		}
		
		.cart_board tr td:first-child {
			border-left : none;
		}
		
		.cart_board td {
			padding: 23px 0;
			border-left : 1px solid #eaeaea;
			border-bottom: 1px solid #eaeaea;
			background: #fcfcfb;
			text-align: center;
			font-weight: bold;
		}
		
	</style>
	<h2 class = "cart_title_01">내가 담은 상품리스트</h2>
	
	<form id="frm" method="get">
		<input type="hidden" name="member_id" class="member_id" value="${memberLoggedIn.member_id}"/>
		<table class="table cart_board" style="font-size:13px;" >
			<tr class="tr1">
				<th><label><input type="checkbox" id="check_all" checked/> 전체선택</label></th>
				<th style="text-align: center">상품정보</th>
				<th>상품금액</th>
				<th>수량</th>
				<th width="150px">총금액</th>
				<th>비고</th>
			</tr>
			<c:if test="${not empty cartList}">
				<c:forEach var='cart' items='${cartList}' varStatus="vs">
				<c:if test="${cart.product_delete eq 'N'}">
					<tr class="tr2">
						<td scope="col"><input type="checkbox" name="check" value="${cart.cart_code}" checked/></td>
						<td scope="col">
							<div class="click_product" style="float: left;width:80px;cursor:pointer;"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${cart.new_p_img_path }"></div>
							<div style="float: left;text-align:left;margin-left:15px;">
								<span class="click_product" style="font-weight:bold;font-size:15px;cursor:pointer;">${cart.product_name}</span><br>
								<c:if test="${cart.option_size != null }">
									<span>사이즈 : ${cart.option_size}</span>
								</c:if>
								<br>
								<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>					
							</div>
							<input type="hidden" class="product_code" value="${cart.product_code}">
						</td>
						<td scope="col"><span class="price${vs.count} sell_price" style="font-size:16px">${cart.price }</span><span> 원</span></td>
						<td scope="col">
							<input type="hidden" class="cartLength" value="${fn:length(cartList)}"/>
							<input type="hidden" class="cart_code" value="${cart.cart_code}"/>
							<input type="hidden" name="left_amount" value="${cart.left_amount}"/>
							<input type="hidden" name="product_name" value="${cart.product_name}"/>
							<i class="fas fa-minus-circle del" style="font-size:18px;cursor:pointer;color:#3CA0E1"> </i><!-- <input type="button" class="del" value="-" style="width:25px;font-weight:bold;cursor:pointer;"/> -->
							<input type="text" name="cart_quantity" class="quantity cart_quantity${vs.count}" value="${cart.cart_quantity}" size="3" style="height:25px;" readonly/>
							<i class="fas fa-plus-circle add" style="font-size:18px;cursor:pointer;color:#3CA0E1;"></i><!-- <input type="button" class="add" value="+" style="width:25px;font-weight:bold;cursor:pointer;"/> -->
						</td>
						<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;"><span class="sum_price${vs.count} sum"></span><span> 원</span></td>
						<td><img alt="삭제" class="cancel" style="cursor:pointer;"
							src="resources/images/cancel1.png" width="20px"
							onmouseover="this.src='resources/images/cancel2.png'"
							onmouseout="this.src='resources/images/cancel1.png'" />
						</td>
					</tr>
				</c:if>
				</c:forEach>
			</c:if>
		</table>
		
	<div style = "height:30px;">
		<!-- 여백을 위한 빈박스 -->
	</div>
	
	<style>
	
	.cart_total {
		display : table;
		table-layout: fixed;
		width :100%;
		margin-top : 40px;
		border-top : 1px solid #b5babd;
	}
	
	.top {
		padding:0 36px;
		border-bottom: 1px solid #eaeaea;
		
	}
	
	.cart_total li {
		display : table-cell;
		position : relative;
		width : 33.3%;
		border-right: 1px solid #eaeaea;
		border-bottom: 1px solid #eaeaea;
		background: #fdfdf8;
		font-weight: bold;
		box-sizing: border-box;
		z-index: 10;
	}
	
	.cart_total li:first-child {
		z-index : 15;
	}
	
	.top dl {
		overflow: hidden;
		margin-bottom: 0px;
	}
	
	
	.top dl dt {
		float : left;
		font-size : 15px;
		line-height: 84px;
	}
	
	.top dl dd {
		font-size : 30px;
		text-align: right;
	}
	
	.top dl dd em {
		font-size: 30px;
		line-height: 84px;
		font-style: normal;		
	}
	
	
	</style>
	<div class = "cart_bottom_box">
		<ul class = "cart_total">
			<li>
				<div class = "top">
					<dl>
						<dt>주문금액</dt>
						<dd>
							<em class = "total-product-price"></em>원
						</dd>
					</dl>
				</div>
				
				<style>
					.cart_total li:first-child .bottom {
						width:200%;
						background: #fdfdf8;
						box-sizing: border-box;
						
					}
					
					.cart_total li:first-child .bottom dl {
						padding : 8px 0;
						
					}
					
					.cart_total li:first-child .bottom dl dt {

						line-height: 35px;
					}
					
					.cart_total li .bottom {
						padding : 22px 36px;
					}
					.cart_total li .bottom dl dt {
						float:left;
						font-size : 15px;
						line-height : 30px;
					}
					
					.cart_total li .bottom dl {
						overflow: hidden;
					}
					.cart_total li:first-child .bottom dl dd {
						padding-left : 165px;
						line-height: 35px;
						text-align: left;
						
					}
					
					.cart_total li .bottom dl dd {
						font-size : 15px;
						line-height: 30px;
						text-align: right;
					}
				</style>
				<div class = "bottom">
					<dl>
						<dt>상품금액</dt>
						<dd class = "">
							<span class = "total-product-price" style = "padding-left : 10px;"></span>원
						</dd>
					</dl>
					
					<dl>
					 <dt>선결제배송비</dt>
					 <dd>
					 	<span class = "deli-price" style = "padding-left : 10px;"></span>
					 </dd>
					</dl>
				</div>
				
				<style>
					.cart_total li .icon {
						position: absolute;
						right : -19px;
						top : 23px;
						
					}
					
					.icon img { 
						vertical-align: middle;
					}
					
				</style>
				<span class = "icon">
					<img src = "./resources/images/ico_total_minus.png">
				</span>
			</li>
			
			<li>
			<div class = "top">
				<dl>
					<dt>할인금액</dt>
					<dd>
					<em>0</em>원
					</dd>
				</dl>
			</div>
			<!-- 밑에 부분(회원할인, 이벤트할인)은 z-index로 가려놓음 추후 기능구현 가능할 시간 있을시 활성화 할 것 -->
			<div class = "bottom">
				<dl>
					<dt>회원할인</dt>
					<dd>0원</dd>
				</dl>
				
				<dl>
					<dt>이벤트할인</dt>
					<dd>0원</dd>
				</dl>
			</div>
			
			<span class = "icon">
			
				<img src ="./resources/images/ico_total_sum.png">
			</span>
			</li>
			
			<style>
				.cart_total li.sum {
					width: 33.4%;
					border-right: none;
					background: #AFB3C6;
					z-index : 5;
				}
				
				
			</style>
			
			<li class = "sum">
				<div class = "top">
					<dl>
						<dt>결제예정금액</dt>
						<dd>
							<em class = "total-price"></em>
							원
						</dd>
					</dl>
				</div>
				
				<style>
					.icon_point {
						display : inline-block;
						width : 18px;
						height : 18px;
						margin-top : -2px;
						border-radius: 100%;
						background: #b0c976;
						color : #fff;
						font-weight: bold;
						font-size: 12px;
						line-height: 18px;
						text-align: center;
						overflow: hidden;
						vertical-align: middle;
					}
				</style>
				<div class = "bottom">
					<dl>
						<dt>적립혜택</dt>
						<dd></dd>
						
					</dl>
					
					<dl>
						<dt>포인트적립</dt>
						<dd>
							<span id="save_point"></span>
							<span class ="icon_point">P</span>
						</dd>
						
						
					</dl>
				</div>
			</li>
			
		
		</ul>
	</div>
	
		<style>
			.btn_button {
				margin-top : 20px;
				text-align: right;
			}
			
			.btn_cancel01 {
				display:inline-block;
				width:211px;
				height:60px;
				border: none;
				background: #2d2e33;
				color : #fff;
				font-size: 18px;
				line-height: 58px;
				font-weight: bold;
				text-align: center;
				vertical-align: middle;
				box-sizing: border-box;
				cursor: pointer;
			}
			
			.btn_submit01 {
				margin-left : 5px;
				display : inline-block;
				width : 211px;
				height : 60px;
				background: #E2758C;
				border : none;
				color : #fff;
				font-size : 18px;
				line-height: 58px;
				font-weight: bold;
				text-align: center;
				vertical-align: middle;
				box-sizing: border-box;
				cursor : pointer;
			}
		</style>
		<div class = "btn_button">
			<button type = "button" id = "select-delete" class = "btn_cancel01">선택삭제</button>
			<button type = "button" id = "buy" class = "btn_submit01">구매하기</button>
		</div>
	</form>
<script>
$(function(){
	$('#buy').click(function(){
		if($('.member_id').val()==null||$('.member_id').val().length<1){
			alert("로그인 후 이용해주시기 바랍니다.");
			return false;
		}
		if($(".total-price").text()=="0"){
			alert("상품을 한개이상 골라주세요");
			return false;
		}
		var left_amount=document.getElementsByName("left_amount");
		var cart_quantity=document.getElementsByName("cart_quantity");
		var product_name=document.getElementsByName("product_name");
		for(var i=0;i<left_amount.length;i++){
			if(parseInt(left_amount[i].value) < parseInt(cart_quantity[i].value)){
				alert(product_name[i].value+"의 재고가 부족합니다. (남은수량 : "+left_amount[i].value+")");
				return false;
			}
		}
		var frm=$("#frm");
		var url="${pageContext.request.contextPath }/buyForm2.do";
		frm.attr("action",url);
		frm.submit();
	});
	$('#select-delete').click(function(e){
		var member_id=$('.member_id').val();
		if(member_id==null||member_id.length<1){
			alert("로그인 후 이용해주시기 바랍니다.");
			return false;
		}else if($(".total-price").text()=="0"){
			alert("상품을 한개이상 골라주세요");
			return false;
		}else{
			var frm=$("#frm");
			var url="${pageContext.request.contextPath }/deleteSelectCart.do";
			frm.attr("action",url);
			frm.submit();
		}
	});
});
</script>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />