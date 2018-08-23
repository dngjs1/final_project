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
				<a href = "#">주문 / 배송내역</a>
			</div>
			
			<style>
			.myorder_page {
				
			}
			
			.order_title {
				margin-top : 0;
				padding : 0 10px;
				font-size : 20px;
				line-height: 79px;
				font-weight: bold;
				text-align: left;
			}
			
			.truck_page_tit{
				background : #AFB3C6;
				display: table-cell;
				height : 122px;
				width : 140px;
				text-align: center;
				font-size: 52px;
				font-weight: bold;
				color : #2e2e2e;
				line-height: 22px;
				box-sizing: border-box;
				vertical-align: middle;
			}
			
			.truck_page_cont {
				display: table-cell;
				background: #fcfcfb;
				width: 862px;
				height: 122px;
				box-sizing: border-box;
				vertical-align: middle;
				border : 1px solid #d9d9d9;
			}
			.truck_page_cont_in {
				padding-left: 20px;
			}
			
			.truck_page_cont_in p {
				font-size : 15px;
				color : 2e2e2e;
				line-height: 20px;
			}
			
			</style>
			<div class = "myorder_page">
				<h2 class = "order_title">
				
				</h2>
				<div class = "truck_page">
					<div class = "truck_page_tit">
						<i class="fas fa-truck"></i>
					</div>
					
					<style>
						.truck_page_cont_in p {
							line-height: 10px;
							font-weight: bold;
						
						}
					</style>
					<div class = "truck_page_cont">
						<div class = "truck_page_cont_in">
							<p></p>
							<p>환불 / 배송 / 매진된 상품에 관련해서는 1:1상담을 이용하세요</p>
							<P>어차피 게시글 남기셔도 살 때는 맘대로지만 환불은 마음대로 안됩니다</P>
							<p>환불은 최장 1년이 걸릴 수 있습니다.</p>
						</div>
					</div>
				
				</div>
			</div>
			<style>
				.empty_box {
					height : 10px;
				}
			</style>
			
			
			<div class = "empty_box">
			
			</div>
			
			<div class = "myorder_page">
				<h2 class = "order_title">
				
				</h2>
				<div class = "truck_page">
					<div class = "truck_page_tit" style = "font-size : 20px;">
						조회기간
					</div>
					
					<style>
						.total_page_btn {
							overflow: hidden;
							font-size : 0px;
						}
						
						.total_page_btn span {
							display: inline-block;
							border-top : 1px solid #c4c4c4;
							border-right : 1px solid #c4c4c4;
							border-bottom : 1px solid #c4c4c4;
						}
						
						.total_page_btn span:first-child {
							border-left : 1px solid #c4c4c4;
						}
						
						.btn_white_01{
							display: inline-block;
							height : 35px;
							width : 72px;
							border-left: 1px solid #fff;
							border-right : 1px solid #fff;
							border-bottom : 1px solid #fff;
							color : #2e2e2e;
							font-size : 12px;
							line-height : 34px;
							font-weight : bold;
							text-align: center;
							vertical-align: middle;
							box-sizing: border-box;
							cursor: pointer;
					
						}
						
						
					</style>
					<div class = "truck_page_cont">
						<div class = "truck_page_cont_in">
							<div class = "total_page_btn">
								<span>
									<a href = "#" class = "btn_white_01">오늘</a>
								</span>
								
								<span>
									<a href = "#" class = "btn_white_01">1주일</a>
								</span>
								
								<span>
									<a href = "#" class = "btn_white_01">1개월</a>
								</span>
								
								<span>
									<a href = "#" class = "btn_white_01">2개월</a>
								</span>
								
								<span>
									<a href = "#" class = "btn_white_01">3개월</a>
								</span>
								
								<span>
									<a href = "#" class = "btn_white_01">6개월</a>
								</span>
								
								<span>
									<a href = "#" class = "btn_white_01">1년</a>
								</span>
							</div>
							<style>
							.total_page_select {
								margin-top : 9px;
								font-size : 15px;
								color : #2e2e2e;
							}
							.select_option {
								display : inline-block;
								position: relative;
								height : 39px;
								border : 1px solid #c4c4c4;
								color : #000;
								box-sizing: border-box;
								text-align: left;
								vertical-align: middle;
								z-index: 500;
								border: none;
							}
							
							.txt1 {
								display: inline-block;
								padding : 0 6px;
							}
							</style>
							<div class = "total_page_select">
								<div class = "select_option" >
									<select class="custom-select">
  										<option selected>선택</option>
  										<option value="1">2018</option>
									</select>
								</div>
								
								<span class = "txt1">년</span>
								
								<div  class = "select_option" >
									<select class="custom-select">
  										<option value="1">1</option>
  										<option value="2">2</option>
  										<option value="3">3</option>
  										<option value="4">4</option>
  										<option value="5">5</option>
  										<option value="6">6</option>
  										<option value="7">7</option>
  										<option value="8">8</option>
  										<option value="9">9</option>
  										<option value="10">10</option>
  										<option value="11">11</option>
  										<option value="12">12</option>
									</select>
								</div>
								
								<span class = "txt1">월</span>
								
								<div  class = "select_option" >
									<select class="custom-select">
  										<option value="1">1</option>
  										<option value="2">2</option>
  										<option value="3">3</option>
  										<option value="4">4</option>
  										<option value="5">5</option>
  										<option value="6">6</option>
  										<option value="7">7</option>
  										<option value="8">8</option>
  										<option value="9">9</option>
  										<option value="10">10</option>
  										<option value="11">11</option>
  										<option value="12">12</option>
  										<option value="13">13</option>
  										<option value="14">14</option>
  										<option value="15">15</option>
  										<option value="16">16</option>
  										<option value="17">17</option>
  										<option value="18">18</option>
  										<option value="19">19</option>
  										<option value="20">20</option>
  										<option value="21">21</option>
  										<option value="22">22</option>
  										<option value="23">23</option>
  										<option value="24">24</option>
  										<option value="25">25</option>
  										<option value="26">26</option>
  										<option value="27">27</option>
  										<option value="28">28</option>
  										<option value="29">29</option>
  										<option value="30">30</option>
  										<option value="31">31</option>
									</select>
								</div>
								
								<span class = "txt1">일</span>
								
								<span class = "txt1">~</span>
								
								<div class = "select_option" >
									<select class="custom-select">
  										<option selected>선택</option>
  										<option value="1">2018</option>
									</select>
								</div>
								
								<span class = "txt1">년</span>
								
								<div  class = "select_option" >
									<select class="custom-select">
  										<option value="1">1</option>
  										<option value="2">2</option>
  										<option value="3">3</option>
  										<option value="4">4</option>
  										<option value="5">5</option>
  										<option value="6">6</option>
  										<option value="7">7</option>
  										<option value="8">8</option>
  										<option value="9">9</option>
  										<option value="10">10</option>
  										<option value="11">11</option>
  										<option value="12">12</option>
									</select>
								</div>
								
								<span class = "txt1">월</span>
								
								<div  class = "select_option" >
									<select class="custom-select">
										
  										<option value="1">1</option>
  										<option value="2">2</option>
  										<option value="3">3</option>
  										<option value="4">4</option>
  										<option value="5">5</option>
  										<option value="6">6</option>
  										<option value="7">7</option>
  										<option value="8">8</option>
  										<option value="9">9</option>
  										<option value="10">10</option>
  										<option value="11">11</option>
  										<option value="12">12</option>
  										<option value="13">13</option>
  										<option value="14">14</option>
  										<option value="15">15</option>
  										<option value="16">16</option>
  										<option value="17">17</option>
  										<option value="18">18</option>
  										<option value="19">19</option>
  										<option value="20">20</option>
  										<option value="21">21</option>
  										<option value="22">22</option>
  										<option value="23">23</option>
  										<option value="24">24</option>
  										<option value="25">25</option>
  										<option value="26">26</option>
  										<option value="27">27</option>
  										<option value="28">28</option>
  										<option value="29">29</option>
  										<option value="30">30</option>
  										<option value="31">31</option>
									</select>
								</div>
								<style>
								.btn_black_01{
									border : 1px solid #707070;
								}
								
								</style>
								<span class = "txt1">일</span>
								
								<button type="submit" value = "submit"class="btn btn-dark btn_black_01">조회</button>
							</div>
							
						</div>
					</div>
				
				</div>
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
						<th scope="col" class = "#">번호</th>
						<th scope="col" class = "#">상품정보</th>
						<th scope="col" class = "#">결제금액</th>
						<th scope="col" class = "#">진행상황</th>
						<th scope="col" class = "#"></th>
					</tr>
					</thead>
					<tbody>
						<tr>
						<td colspan="5"><b>최근 주문내역이 없습니다.</b></td>
						</tr>
					</tbody>
				
				</table>
			</div>
			
			<div class = "paging_box" style = "padding:20px;">
				<div class = "paging">
					<nav aria-label="Page navigation example">
  						<ul class="pagination justify-content-center">
    						<li class="page-item disabled">
      							<a class="page-link" href="#" tabindex="-1">이전</a>
    						</li>
    						<li class="page-item"><a class="page-link" href="#">1</a></li>
    						<li class="page-item"><a class="page-link" href="#">2</a></li>
    						<li class="page-item"><a class="page-link" href="#">3</a></li>
    						<li class="page-item">
      							<a class="page-link" href="#">다음</a>
    						</li>
  </ul>
</nav>
				
				</div>
			</div>
			
			
			
			
			
			

			
			
		</div>
	
	
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />