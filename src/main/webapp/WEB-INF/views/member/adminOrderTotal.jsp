<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/member/commonAdminpage.jsp"/>
<div class = "col-10">
	<div class = "location">
		<a href = "#" class = "home"><i class="fas fa-home"></i></a>
		>
		<a href = "#">주문 / 배송내역 관리</a>
	</div>


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
	<script>
		$(function(){
			for(var i=0;i<parseInt($('.orderLength').val());i++){
				$(".buy_date"+i).html($(".buy_date"+i).html().replace(".0",""));
				
				var buy_status=$(".buy_status"+i);
				if(buy_status.html()=="P"){
					buy_status.html("결제완료");
				}else if(buy_status.html()=="D"){
					buy_status.html("배송중");
				}else if(buy_status.html()=="SD"){
					buy_status.html("배송완료");
				}else if(buy_status.html()=="R"){
					buy_status.html("환불요청중");
				}else if(buy_status.html()=="SR"){
					buy_status.html("환불완료");
				}
				
				$(".total_price"+i).html($(".total_price"+i).html().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}
		});
		$(function(){
			$('.click_product').on('click',function(){
				var product_code=$(this).parent().parent().find('.product_code').val();
				location.href="${pageContext.request.contextPath}/productView.do?product_code="+product_code;
			});
			
			$('.choice_status').on('change',function(){
				var status=$(this).val();
				var buy_status=$(this).parent().parent().find('.buy_status');
				var buy_code=$(this).parent().parent().find('.buy_code').val();
				$.ajax({
					url:"${pageContext.request.contextPath}/choice_status.do",
					data:{
						buy_status:status,
						buy_code:buy_code
					},
					success:function(data){
						if(data.trim()=='0'){
							alert("진행상태 변경에 실패하였습니다.");
							return false;
						}else{
							alert("진행상태가 변경되었습니다.");
							if(status=="P"){
								buy_status.html("결제완료");
							}else if(status=="D"){
								buy_status.html("배송중");
							}else if(status=="SD"){
								buy_status.html("배송완료");
							}else if(status=="R"){
								buy_status.html("환불요청중");
							}else if(status=="SR"){
								buy_status.html("환불완료");
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
			});
		});
	</script>
	<div class = "mypage_wrap">
		<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 주문 / 배송내역</h2>
		<table class = "order_board">
			<colgroup>
				 <col style = "width:15%;">
				 <col style = "width:20%;">
		         <col style = "width:30%;">
		         <col style = "width:10%;">
		         <col style = "width:10%;">
		         <col style = "width:15%;">
		    </colgroup>
			<thead>
			<tr>
				<th scope="col">주문고객</th>
				<th scope="col">주문일자</th>
				<th scope="col">상품정보</th>
				<th scope="col">결제금액</th>
				<th scope="col">진행상황</th>
				<th scope="col">진행상황변경</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
				<c:when test="${not empty orderList}">
					<input type="hidden" class="orderLength" value="${fn:length(orderList)}"/>
					<c:forEach var="order" items="${orderList}" varStatus="vs">
					<tr>
					   <td>${order.MEMBER_ID}</td>
					   <td class="buy_date${vs.index}">${order.BUY_DATE }</td>
		               <td class = "align_left bdl_none" style = "width : 300px;">
		                  <div class="click_product" style="float: left;width:100px;cursor:pointer;"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${order.NEW_P_IMG_PATH }"> </div>
		                  <div style="float: left;text-align:left;margin-left:15px;">
		                     <span class="click_product" style="cursor:pointer;">${order.PRODUCT_NAME}</span><br>
		                     <c:if test="${order.OPTION_SIZE!=null}">
		                        <span>(${order.OPTION_SIZE}),</span>
		                     </c:if>
		                     <span> ${order.BUY_QUANTITY} 개</span>
		                  </div>
		                  <input type="hidden" class="product_code" value="${order.PRODUCT_CODE}">
		                  <input type="hidden" class="buy_code" value="${order.BUY_CODE}">
		               </td>
		               <td><span class="total_price${vs.index}">${order.TOTAL_PRICE}</span><span> 원</span></td>
		               <td><span class="buy_status${vs.index} buy_status">${order.BUY_STATUS}</span></td>
		               <td>
		               	<select name="choice_status" class="choice_status">
		               		<option value="N">-진행상황선택-</option>
		               		<option value="P">결제완료</option>
		               		<option value="D">배송중</option>
		               		<option value="SD">배송완료</option>
		               		<option value="R">환불요청중</option>
		               		<option value="SR">환불완료</option>
		               	</select>
		               </td>
         					</tr>
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
	</div>
	
	${pageBar }
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />