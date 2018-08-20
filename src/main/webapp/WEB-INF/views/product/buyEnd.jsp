<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<%@ page import="java.util.*, java.text.*"  %>
<%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년 MM월 dd일");
 String today = formatter.format(new java.util.Date());
%>
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
<div class="container">

   <div class = "cart_box_step">
   <h1><i class="fas fa-user-check"></i> 결제완료</h1>
      <ul class = "step_number">
         <li  style = "background: none; border-bottom:none;">
         <span>01</span>
            장바구니
            </li>
            
         <li >
         <span>02</span>
            주문작성 / 결제
         </li>
         
         <li class = "top" style =  "border-bottom:none;">
         <span>03</span>
            결제완료
         </li>
      
      </ul>
   </div>
	
	<style>
		.info_text {
			
			border : 1px solid #eaeaea;
			margin-top: 30px;
			text-align: center;
		}
		
		.check_icon {
			font-size : 150px;
			color : #black;
			text-align: center;
		
		}
		
		.empty_box {
			height : 20px;
		}
		
	</style>
	
	
		<div class = "row" style = "background-color: #eaeaea; margin-left:0px; margin-right : 0px; margin-top : 30px;">
			
			<div class = "col-3">
				<ul>
				
					<li style = "border-right: 1px solid black; margin-top : 10px; height : 150px; margin-left:65px;">
					
					 <span class = "check_icon far fa-check-square"></span>
					
					</li>
					
					
				
				</ul>
			</div>
			
			
			<div clas = "col-9">
			
				 <span style = "border :1px solid #eaeaea; margin-top:10px;">
				<p style = "font-size : 30px; text-align: left; font-weight: bold; margin-top : 14px; margin-left:15px;"><em style = "font-style:normal; color : red;">결제</em>가 완료되었습니다.</p>
				<p style = "font-size : 18px; text-align: left; font-weight : bold; line-height : 10px; margin-left:15px; padding-left:3px; color : black;">구매해 주셔서 감사합니다. 아래 구매내역을 확인해 주세요.</p>
				</span> 
			
				<!-- <img src = "http://image.chosun.com/sitedata/image/201701/26/2017012601555_0.jpg" style = "height : 150px; margin-top: 10px;">
				<b><p>상품은 너굴맨이 처치했으니 안심하라구</p></b>
 -->				
			</div>
			
			<style>
				.con_shop{
					display: inline-block;
					width : 211px;
					height : 60px;
					border : none;
					background : #2D2E33;
					color : #fff;
					font-size : 18px;
					line-height: 58px;
					box-sizing: border-box;
					cursor: pointer;
					margin-top : 20px;
					font-weight: bold;
				}
				
			
			</style>
			
			
			
		</div>
		
		<div class = "empty_box">
		
		
		
		</div>
	
		
		
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
					font-size: 20px;
					line-height: 79px;
					font-weight: bold;
					text-align: left;
					padding-left: 3px;
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
					padding: 23px 0;
					border-bottom:1px solid #eaeaea;
					background:#fcfcfb;
					text-align:center;
				}
			</style>
			<div class = "mypage_wrap">
				<h2 class = "mypage_title02">주문상품 확인</h2>
				<table class = "order_board">
					<colgroup>
					<!-- td 비율 조절하는 곳 -->
						<col style = "width:14%;">
						<col style = "width:26%;">
						<col style = "width:12%;">
						<col style = "width:12%;">
						<col style = "width:12%;">
						<col style = "width:12%;">
					</colgroup>
					<thead>
<script>
	$(function(){
		$(".price").text($(".price").text().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});
</script>
					<tr>
						<!-- <th scope="col" class = "#">주문일자/번호</th> -->
						<th scope="col">결제일</th>
						<th scope="col">상품명</th>
						<th scope="col">구매고객</th>
						<th scope="col">받는고객</th>
						<th scope="col">결제수단</th>
						<th scope="col">결제금액</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<!-- <td scope="col">주문일자/번호</td> -->
							<td scope="col"><%=today %></td>
							<td scope="col">${product_all_name }</td>
							<td scope="col">${memberLoggedIn.member_name }</td>
							<td scope="col">${buyInfo.receiver_name }</td>
							<td scope="col">신용카드</td>
							<td scope="col"><span class="price">${last_price }</span><span> 원</span></td>
						</tr>
					</tbody>
				
				</table>
			</div>
			
			<div style = "text-align:right;">
				<button id = "#" type = "button" class = "con_shop">
					<i class="fas fa-shopping-basket"></i>&nbsp;&nbsp;쇼핑 계속하기 
				</button>
			</div>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />