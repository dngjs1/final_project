<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/member/commonAdminpage.jsp"/>


		<div class = "col-10">
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">관리페이지</a>
			</div>
			
			<hr>
			<style>
			
				.mypage_wrap {
					padding-bottom: 100px;
					background : #fcfcfb;
					overflow: hidden;
				}
				
				.mypage_wrap2 {
					padding-bottom: 100px;
					background : #fcfcfb;
					overflow: hidden;
				}
				
				
				.mypage_title02 {
					margin-top: 0;
					padding : 0 10px;
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
					background: #b5babd;
					color : #fff;
					font-weight: bold;
					text-align: center;
					border-left : 1px solid #eaeaea;
				}
				
				.order_board td {
					padding: 23px 0;
					border-bottom:1px solid #eaeaea;
					background:#fcfcfb;
					text-align:center;
				}
			</style>
			<div class = "mypage_wrap">
				<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 주문 / 배송내역</h2>
				<table class = "order_board">
					<colgroup>
						<col style = "width:18%;">
						<col style = "width:50%;">
						<col style = "width:10%;">
						<col style = "width:12%;">
						<col style = "width:10%;">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class = "#">주문일자/번호</th>
						<th scope="col" class = "#">상품명</th>
						<th scope="col" class = "#">결제금액</th>
						<th scope="col" class = "#">진행상황</th>
						<th scope="col" class = "#"></th>
					</tr>
					</thead>
					<tbody>
						<tr>
						<td colspan="5">최근 주문내역이 없습니다.</td>
						</tr>
					</tbody>
				
				</table>
			</div>
			
			<div style = "height : 50px;">
			
			</div>
			<style>
			.shopping_cart{
				width : 66px;
				height : 59px;
				margin-top : 1px;
				border-radius: 100%;
				background : #2D2E33;
				color : #fff;
				font-size : 21px;
				line-height: 60px;
				text-align: center;
				vertical-align: middle;
			}
			
			.card_buy{
				width : 66px;
				height : 59px;
				margin-top : 1px;
				border-radius: 100%;
				background : #2D2E33;
				color : #fff;
				font-size : 21px;
				line-height: 60px;
				text-align: center;
				vertical-align: middle;
			}
			</style>
			<div class = "mypage_wrap2">
				
				<h2 class = "mypage_title02"><i class="shopping_Cart fas fa-shopping-cart"></i> 장바구니</h2>
				<table class = "order_board">
					<colgroup>
						<col style = "width:18%;">
						<col style = "width:50%;">
						<col style = "width:10%;">
						<col style = "width:12%;">
						<col style = "width:10%;">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class = "#">전체선택</th>
						<th scope="col" class = "#">상품정보</th>
						<th scope="col" class = "#">상품금액</th>
						<th scope="col" class = "#">수량</th>
						<th scope="col" class = "#">총금액</th>
					</tr>
					</thead>
					<tbody>
						<tr>
						<td colspan="5">장바구니가 비었습니다.</td>
						</tr>
					</tbody>
				
				</table>
			
			</div>

			
			
		</div>
	
	
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />