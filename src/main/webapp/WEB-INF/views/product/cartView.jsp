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

<style>
.cart{
	padding-left:50px;
	padding-right:50px;
}
.tr1 th{text-align:center;}
.tr2 td{vertical-align:middle;text-align:center;}
.font-price{font-weight:bold;font-size:20px;}
</style>
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
			var amount = $('[name=cart_quantity'+i+']').val();
			var result = parseInt(amount) * sell_price;
			$(".price"+i).text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$(".sum_price"+i).text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			
			var check= document.getElementsByName("check");
			one_sum=parseInt(check[i-1].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.innerHTML.replace(",", ""));
			sum=sum+one_sum;
		}
		var total_sum=0;
		if(sum>=20000){
			$(".deli-price").parent().hide();
			total_sum=sum;
		}else if(sum==0){
			$(".deli-price").parent().hide();
			total_sum=0;
		}else{
			total_sum=sum+2500;
		}
		
		$(".total-product-price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$(".total-price").text(total_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	$(function(){
		$("[name=check], #check_all").on("change",function(){
			var sum=0;
			var check= document.getElementsByName("check");
			for(var i=1;i<=$('.cartLength').val();i++){
				if( check[i-1].checked == true ){
					one_sum=parseInt(check[i-1].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.innerHTML.replace(",", ""));
					sum=sum+one_sum;
				}
			}
			var total_sum=0;
			if(sum>=20000){
				$(".deli-price").parent().hide();
				total_sum=sum;
			}else if(sum==0){
				$(".deli-price").parent().hide();
				total_sum=0;
			}else{
				$(".deli-price").parent().show();
				total_sum=sum+2500;
			}
			
			$(".total-product-price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$(".total-price").text(total_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});
		$('.add').on("click",function(){
			var quantity=$(this).siblings('.quantity');
			hm = parseInt(quantity.val());
			hm = hm+1;
			sell_price=$(this).parent().prev().find(".sell_price").html().replace(",", "");
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
					var check= document.getElementsByName("check");
					var sum=0;
					for(var i=1;i<=$('.cartLength').val();i++){
						if( check[i-1].checked == true ){
							one_sum=parseInt(check[i-1].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.innerHTML.replace(",", ""));
							sum=sum+one_sum;
						}
					}
					var total_sum=0;
					if(sum>=20000){
						$(".deli-price").parent().hide();
						total_sum=sum;
					}else if(sum==0){
						$(".deli-price").parent().hide();
						total_sum=0;
					}else{
						$(".deli-price").parent().show();
						total_sum=sum+2500;
					}
					
					$(".total-product-price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$(".total-price").text(total_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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
				sell_price=$(this).parent().prev().find(".sell_price").html().replace(",", "");
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
						var check= document.getElementsByName("check");
						var sum=0;
						for(var i=1;i<=$('.cartLength').val();i++){
							if( check[i-1].checked == true ){
								one_sum=parseInt(check[i-1].parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.innerHTML.replace(",", ""));
								sum=sum+one_sum;
							}
						}
						
						var total_sum=0;
						if(sum>=20000){
							$(".deli-price").parent().hide();
							total_sum=sum;
						}else if(sum==0){
							$(".deli-price").parent().hide();
							total_sum=0;
						}else{
							$(".deli-price").parent().show();
							total_sum=sum+2500;
						}
						
						$(".total-product-price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
						$(".total-price").text(total_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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
</script>
<div class="container cart">
	<h3>장바구니</h3>
	<hr style="border:2px solid #787878">
	<p>상품목록</p>
	<table class="table" style="font-size:13px;" >
		<tr class="tr1">
			<th><label><input type="checkbox" id="check_all" checked/> 전체선택</label></th>
			<th style="text-align: center">상품정보</th>
			<th>상품금액</th>
			<th>수량</th>
			<th width="150px">총금액</th>
			<th></th>
		</tr>
		<c:if test="${not empty cartList}">
			<c:forEach var='cart' items='${cartList}' varStatus="vs">
				<tr class="tr2">
					<td scope="col"><input type="checkbox" name="check" value="${cart.cart_code}" checked/></td>
					<td scope="col">
						<div style="float: left;width:80px"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${cart.new_p_img_path }"></div>
						<div style="float: left;text-align:left;margin-left:15px;">
							<span style="font-weight:bold;font-size:15px;">${cart.product_name}</span><br>
							<c:if test="${cart.option_size != null }">
								<span>사이즈 : ${cart.option_size}</span>
							</c:if>
							<br>
							<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>					
						</div>
					</td>
					<td scope="col"><span class="price${vs.count} sell_price" style="font-size:16px">${cart.price }</span><span> 원</span></td>
					<td scope="col">
					<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
						<input type="hidden" class="cartLength" value="${fn:length(cartList)}"/>
						<input type="hidden" class="cart_code" value="${cart.cart_code}"/>
						<input type="button" class="del" value="-" style="width:25px;font-weight:bold;cursor:pointer;"/>
						<input type="text" class="quantity" name="cart_quantity${vs.count}" value="${cart.cart_quantity}" size="2" style="height:25px;" readonly/>
						<input type="button" class="add" value="+" style="width:25px;font-weight:bold;cursor:pointer;"/>
					</td>
					<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;"><span class="sum_price${vs.count} sum"></span><span> 원</span></td>
					<td><img alt="삭제" class="cancel" style="cursor:pointer;"
						src="resources/images/cancel1.png" width="20px"
						onmouseover="this.src='resources/images/cancel2.png'"
						onmouseout="this.src='resources/images/cancel1.png'" />
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<hr>
	<div style="width:100%;border:2px solid #DDDDDD;padding:15px;text-align:center;font-size:15px;">
	<span>
		<span>총 상품가격 </span><span class="font-price total-product-price"></span><span> 원</span><span> + </span>
		<span>배송비 </span><span class="font-price deli-price">2500</span><span> 원</span><span> = </span>
	</span>
		<span>총 주문금액 </span><span class="font-price total-price" style="font-size:22px;color:red">10000</span><span> 원</span>
	</div>
	<br>
	<div style="text-align:center">
		<button class="btn btn-default">선택삭제</button>
		<button class="btn btn-primary">구매하기</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />