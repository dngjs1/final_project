<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/member/commonMypage.jsp"/>
<div class = "col-10">
<script>
$(function(){
	for(var i=0;i<parseInt($('.orderLength').val());i++){
		var buy_status=$(".buy_status"+i);
		if(buy_status.html()=="R"){
			buy_status.html("환불요청중");
		}else if(buy_status.html()=="SR"){
			buy_status.html("환불완료");
		}
		
		$(".total_price"+i).html($(".total_price"+i).html().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
});
$(function(){
	$('.cancel_request').click(function(){
		var buy_status=$(this).parent().parent().find(".buy_status");
		$.ajax({
			url:"${pageContext.request.contextPath}/cancelRequest.do",
			data:{buy_code:$(this).val()},
			success:function(data){
				if(data.trim()=='0'){
					alert("환불취소 요청에 실패하였습니다.");
					return false;
				}else{
					alert("환불요청이 취소되었습니다.");
					buy_status.parent().parent().hide();
				}
			},
			error:function(jpxhr,textStatus,errormsg){
				console.log("ajax전송실패.");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		});
	});
});
$(function(){
	$('.click_product').on('click',function(){
		var product_code=$(this).parent().parent().find('.product_code').val();
		location.href="${pageContext.request.contextPath}/productView.do?product_code="+product_code;
	});
})
</script>
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">환불/환불요청내역</a>
			</div>
			
			<hr>
			
				<style>
				.mypage_wrap {
					background : #fcfcfb;
					overflow: hidden;
				}
				
				.mypage_title02 {
					margin-top: 0;
					font-size: 20px;
					line-height: 79px;
					font-weight: bold;
					text-align: left;
				}
				
				.order_board{
					width:100%;
					font-size : 15px;
					line-height: 18px;
					table-layout: fixed;
					word-wrap : break-word;
				}
				
				.order_board th {
					padding: 21px 0;
					background: #C5C5E6;
					color : black;
					font-weight: bold;
					text-align: center;
					border-left : 1px solid #eaeaea;
				}
				
				.order_board td {
					 padding : 23px 0;
			         border-left : 1px solid #eaeaea;
			         border-botto : 1px solid #eaeaea;
			         background : #fcfcfb;
			         text-align : center;
			         font-weight: bold;
			         font-size : 16px;
				}
				
				.order_board td.align_left {
			         padding : 23px 10px 23px 15px;
			         border-left: none;
			         
			      }
			      .align_left .bdl_none {
			      	 width : 200px;
			      	 border-left: none;
			         
			      }
			      .request_btn {
			      	width : 100px;
			      	margin : 2px;
			      }
			</style>
			
			<div class = "mypage_wrap">
				<h2 class = "mypage_title02"><i class="fab fa-resolving"></i> 환불/환불요청내역</h2>
				<table class = "order_board">
					<colgroup>
						 <col style = "width:40%;">
				         <col style = "width:20%;">
				         <col style = "width:20%;">
				         <col style = "width:20%;">
				    </colgroup>
					<thead>
					<tr>
						<th scope="col">상품정보</th>
						<th scope="col">결제금액</th>
						<th scope="col">진행상황</th>
						<th scope="col">요청</th>
					</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${not empty orderList}">
							<input type="hidden" class="orderLength" value="${fn:length(orderList)}"/>
							<c:forEach var="order" items="${orderList}" varStatus="vs">
							<c:if test="${order.BUY_STATUS=='R' or order.BUY_STATUS=='SR'}">
							<tr>
				               <td class = "align_left bdl_none" style = "width : 300px;">
				                  <div class="click_product" style="float: left;width:100px;cursor:pointer;margin-left:20px;"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${order.NEW_P_IMG_PATH }"> </div>
				                  <div style="float: left;text-align:left;margin-left:15px;">
				                     <span class="click_product" style="cursor:pointer;">${order.PRODUCT_NAME}</span><br>
				                     <c:if test="${order.OPTION_SIZE!=null}">
				                        <span>(${order.OPTION_SIZE}),</span>
				                     </c:if>
				                     <span> ${order.BUY_QUANTITY} 개</span>
				                  </div>
				                  <input type="hidden" class="product_code" value="${order.PRODUCT_CODE}">
				               </td>
				               <td><span class="total_price${vs.index}">${order.TOTAL_PRICE}</span><span> 원</span></td>
				               <td><span class="buy_status${vs.index} buy_status">${order.BUY_STATUS}</span></td>
				               <td>
				               <c:choose>
				               <c:when test="${order.BUY_STATUS=='R'}">
				               	<button class="cancel_request request_btn btn btn-outline-secondary rounded-0" style="cursor:pointer;" value="${order.BUY_CODE}">취소 요청</button>
				               </c:when>
				               <c:otherwise>
				               	-
				               </c:otherwise>
				               </c:choose>
				               </td>
           					</tr>
           					</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5"><b>최근 주문내역이 없습니다.</b></td>
							</tr>
						</c:otherwise>
						</c:choose>
					</tbody>
				
				</table>
				<div class = "row">
					<div class = "col-6">
					${pageBar }
					</div>
				</div>
				<br><br>
				

		
		<div class = "row">
			<div class = "col-6">
			${pageBar }
			</div>
		</div>
	</div>
</div>
	<style>
	.search_btn {
		width : 50px;
		height : 30px;
		border: none;
		background: #007bff;
		color : #fff;
		font-size : 15px;
		font-weight: bold;
		text-align: center;
		vertical-align: middle;
		cursor:pointer;
		float:right;
	}
	</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />