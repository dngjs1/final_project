<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>


<jsp:include page="/WEB-INF/views/member/commonMypage.jsp"/>

<div class = "col-10">
	<div class = "location">
		<a href = "#" class = "home"><i class="fas fa-home"></i></a>
		>
		<a href = "#">대여 등록 목록</a>
	</div>
	
	<style>
		.empty_box {
			height : 10px;
		}
	</style>
	
	
	<div class = "empty_box">
	
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
	<div class = "mypage_wrap">
		<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i>물품 등록 내역</h2>
		<table class = "order_board">
			<colgroup>
				 <col style = "width:30%;">
		         		<col style = "width:20%;">
		         		<col style = "width:25%;">
		         		<col style = "width:25%;">
		    	</colgroup>
			<thead>
			<tr>
				<th scope="col">상품이름</th>
				<th scope="col">하루 대여 가격</th>
				<th scope="col">시작날짜</th>
				<th scope="col">마지막날짜</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
				<c:when test="${not empty orderList}">
					<input type="hidden" class="orderLength" value="${fn:length(orderList)}"/>
					<c:forEach var="order" items="${orderList}" varStatus="vs">
					<tr>
						   <td class="buy_date${vs.index}">
								<a href="${pageContext.request.contextPath}/rentalDetail.do?rental_obj_code=${order.RENTAL_OBJ_CODE }">
									${order.TITLE }
								</a>
			                  <input type="hidden" class="product_code" value="${order.P_CATEGORY_CODE}">
			               </td>
			               <td><span>${order.PRICE}</span><span> 원</span></td>
			               <td><span>${order.START_DATE}</span></td>
			               <td><span>${order.END_DATE}</span></td>
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
	<br>
	${pageBar }
			
	</div>

			
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />