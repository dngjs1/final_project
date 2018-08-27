<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<style>
.location{
	padding:15px 0;
	color: #000;
	line-height : 35px;
	font-weight : bold;
}

.location > a{
	text-decoration: none;
	color : #000;
	font-size : 14px;
}

.title01 {
	margin-top: 80px;
	padding: 0 10px;
	font-size : 20px;
	line-height:30px;
	font-weight: bold;
	padding-bottom : 10px;
}
</style>
<div class = "container">

	<div class = "row">
	
	
		<div class = "col-2">
		
			<div class = "empty-box">
				
			</div>
			
			<div class = "empty-box">
				
			</div>
			
			<style>
				.lmenu_title {
					text-align : center;
					padding : 32px 0 33px;
					background : #FFFFFF;
				}
				
				.lmenu_title .title {
					font: inherit;
					font-size : 30px;
					font-weight : bold;
					color : #333333;
					word-spacing: -2pt;
					letter-spacing: -2pt;
					margin : 10px 0 8px 0;
				}
				
				.lmenu_title .subTitle {
					font : inherit;
					font-size : 16px;
					font-weight : normal;
					color : #333333;
					word-spacing : -2pt;
				}
			</style>
			<!-- 고객센터 타이틀 시작!! -->
			<div class = "lmenu_title">
				<div class = "title">고객센터</div>
				<div class = "subTitle">CS center</div>
			</div>
			
			<style>
			.lmenu_menu {
				width : 100%;
				margin-top: 0;
				padding-top : 0px;
				display: inline-block;
			}
			
			.menu{
				margin : 0;
				padding : 0;
				border : none;
				overflow : hidden;
			}
			
			.menu > ul {
				list-style: none;
			}
			
			.lmenu_menu .menu li:first-child {
				font-size : 16px;			
			}
			
			.lmenu_menu .menu li {
				text-align: left;
				background-color: #333333;
				border-bottom: 1px solid #eaeaea;
			}
			
			.lmenu_menu .menu li a {
				width : 100%;
				text-decoration: none;
				display : inline-block;
				color : #2e2e2e;
			}
			
			.lmenu_menu .menu .txt{
				font:inherit;
				font-size : 14px;
				font-weight : bold;
				color : #FFFFFF;
				padding : 0 22px;
				line-height : 52px;
				display: block;
			}
			
			.lmenu_menu .menu .submenu .txt_margin_top {
				margin-top : 15px;
			}
			
			.lmenu_menu .menu .submenu .txt{
				font:inherit;
				font-size : 20px;
				font-weight : normal;
				color : #FFFFFF;
				padding : 5px 0px 5px 0;
				background : no-repeat;
				display: block;
				cursor: pointer;
			}
			
			.lmenu_menu .menu .submenu {
				text-align: left;
				background-color: #333333;
				
				padding:0 22px;
			}
			
			.lmenu_menu .menu .submenu .txt{
				font: inherit;
				font-size : 14px;
				font-weight : normal;
				color : #FFFFFF;
				padding : 5px 0px 5px 0;
				display: block;
				cursor:pointer;
			}
			
			.lmenu_menu .menu .btm {
				border-bottom : 1px solid #eaeaea;
			}
			
			.lmenu_menu .menu .submenu .txt_margin_bottom {
				margin-bottom : 15px;
			}
			</style>
			<!-- 왼쪽 메뉴 시작 -->
			<div class = "lmenu_menu">
				<ul class = "menu">
					<li> 
						<a>
							<span class = "txt">바로 서비스</span>
						</a>
					</li>
					
					<li class = "submenu top">
						<a href = "${pageContext.request.contextPath}/memberOrderTotal.do?member_id=${memberLoggedIn.member_id}" onclick="return validate2();" target = "_self">
							<span class = "txt txt_margin_top">주문내역/배송조회</span>
						</a>
					</li>
					
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath}/memberPoint.do?member_id=${memberLoggedIn.member_id}" onclick="return validate2();" target = "_self">
							<span class = "txt">포인트 조회</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath }/question.do" onclick="return validate2();" target = "_self">
							<span class = "txt">나의 질문과 답변</span>
						</a>
					</li>
					
					<li>
						<a>
							<span class = "txt">회원센터</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath }/findMember.do" onclick="return validate();" target = "_self">
							<span class = "txt">아이디찾기</span>
						</a>
					</li>
					
					<li class = "submenu btm">
						<a href = "${pageContext.request.contextPath }/findMember.do" onclick="return validate();" target = "_self">
							<span class = "txt txt_margin_bottom">비밀번호찾기</span>
						</a>
					</li>
				</ul>
	
			</div>
			<!-- 왼쪽 메뉴  : 끝 -->
			<style>
				ul.lgt_menu_bn {
					background-color: #AFB3C6;
					margin-top : 1px;
				}
				
				ul.lgt_menu_bn .cs_center_li{
					background:url(./resources/images/ico_tit_tel.png) no-repeat 5px center;
					border-bottom: 1px solid #fff!important;
				
					
				}
				
				ul.lgt_menu_bn li{
					line-height:25px;
					padding:14px 6px 14px 70px;
				}
				
				ul.lgt_menu_bn .cs_center_li span{
					display:block;
					font-size:13px;
				}
				ul.lgt_menu_bn .cs_center_li span.white_space {
					display: inline-block;
				}
				ul.lgt_menu_bn .time_info_li{
					background:url(./resources/images/ico_tit_date.png) no-repeat 5px center;
				}
				ul.lgt_menu_bn .time_info_li span{
					display:block;
					font-weight:bold;
					letter-spacing: -0.1em;
					font-size: 12px;
				}
				
				
			</style>
			<div>
				<ul class = "lgt_menu_bn">
				
					<li class = "cs_center_li">
					<span>
						Design by<br><strong>진근형</strong>
						<span class = "white_space"></span>
					</span>
					<strong>02-222-2222</strong>
					
					<li class = "time_info_li">
						<span>
							평일 <strong>10:30 ~ 17:30</strong>
							<br>
							런치 <strong>11:30 ~ 13:00</strong>
							<br>
							토/일/공휴일은 휴무
						</span>
					</li>
				</ul>
			</div>
			
			
		</div>
		
		<div class = "col-10">
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">고객센터</a>
			</div>
			
			<hr>
			
			
			<style>
				.csmain > table {
					width : 85%;
					
					margin-right : 20px;
					padding-top: 30px;
				}
				
				.subtit {
					font : inherit;
					font-size : 16px;
					font-weight: bold;
					color : #121212;
					margin-top: 10px;
					margin-bottom: 10px;
					word-spacing: 0.5pt;
				}
				
				.service_btns {
					display: inline-block;
					width : 90%;
					margin:10px 0 0 0 ;
					padding:0px;
				}
				
				.service_btns li {
					float : left;
					margin-right: 20px;
					margin-bottom: 15px;
				}
				.service_btns li a {
					display: block;
					position: relative;
					width:98px;
					height: 98px;
					border: 1px solid #d0d0d0;
					border-radius: 10px;
					color: #2e2e2e;
					text-decoration: none;
				}
				
				.service_btns li a:hover>span {
					text-decoration: underline;
				}
				
				.icon_1 {
					background: url(./resources/images/ico_1.gif);
					background-size: 100% auto;
				}
				
				.icon_1:hover {
					background: url(./resources/images/ico_1_over.gif);
					background-size: 100% auto;
				}
				.service_btns li a> span {
					position: absolute;
					left: 0;
					bottom: 20px;
					width:100%;
					text-align: center;
					box-sizing: border-box;
					font-size: 12px;
					font-weight: bold;
				}
				
				.icon_2 {
					background : url(./resources/images/ico_2.gif);
					background-size : 100% auto;
				}
				
				.icon_2:hover {
					background: url(./resources/images/ico_2_over.gif);
					background-size: 100% auto;
				}
				
				.icon_3{
					background : url(./resources/images/ico_3.gif);
					background-size : 100% auto;
				}
				
				.icon_3:hover {
					background: url(./resources/images/ico_3_over.gif);
					background-size: 100% auto;
				}
				
				.icon_4{
					background : url(./resources/images/ico_4.gif);
					background-size : 100% auto;
				}
				
				.icon_4:hover {
					background: url(./resources/images/ico_4_over.gif);
					background-size: 100% auto;
				}
				
				.icon_5{
					background : url(./resources/images/ico_5.gif);
					background-size : 100% auto;
				}
				
				.icon_5:hover {
					background: url(./resources/images/ico_5_over.gif);
					background-size: 100% auto;
				}
				
				.icon_6{
					background : url(./resources/images/ico_6.gif);
					background-size : 100% auto;
				}
				
				.icon_6:hover {
					background: url(./resources/images/ico_6_over.gif);
					background-size: 100% auto;
				}
				.a {
					color : #2e2e2e;
					text-decoration:none;
					
				}
				
				a:hover {
					color : #2e2e2e;
					text-decoration:none;
					
				}
				
			</style>
			<!-- 처음 보이는 고객센터 메인화면! 시작!! -->
			<div class = "csmain">
			
			<table style="margin-top:70px;" border = "0" cellspacing = "0" cellpadding = "0">
				<tbody>
					<tr>
						<td style = "width:50%">
							<div style = "float:left" class = "subtit">자주이용하는 서비스</div>
							
							<ul class = "service_btns">
								
								<li>
									<a href = "${pageContext.request.contextPath}/memberRefund.do?member_id=${memberLoggedIn.member_id}" onclick="return validate2();" class = "icon_3">
										<span>취소/교환/환불</span>
									</a>
								</li>
								
								<li>
									<a href = "${pageContext.request.contextPath}/question.do" onclick="return validate2();" class = "icon_4">
										<span>1:1 문의</span>
									</a>
								</li>
								
								<li>
									<a href ="${pageContext.request.contextPath}/memberUpdate.do" onclick="return validate2();" class = "icon_5">
										<span>회원정보수정</span>
									</a>
								</li>
						
							</ul>
						</td>
						
						<style>
							.more {
								font:inherit;
								font-size: 12px;
								font-weight: normal;
								color:#121212;
								margin-top : 10px;
								word-spacing: o.5pt;
								float: right;
							}
							
							.more a { 
								text-decoration: none;
								color : #2e2e2e;
							}
							
							.titleText12{
								text-decoration: none;
								font-size : 12px;
							}
							.cus_bottom {
								text-align:center;
								margin:0 auto;
								width:117.5%;
								height:160px;
								background:url(./resources/images/member_background.gif);
								background-repeat: no-repeat;
								border:1px solid #d2d2d2;
								box-sizing: border-box;
								background-size: 100%;
								background-position: 
								
							}
							.cus_bottom .subtxt{
								font:inherit;
								font-size:25px;
								font-weight: bold;
								color:#ff483f;
								margin-top: 10px;
								margin-bottom:10px;
								word-spacing:0.5pt;
								text-align:center;
							}
							
							.cus_bottom .maintit {
								font:inherit;
								font-size:24px;
								font-weight:bold
								color:#121212;
								
							}
						</style>
					<td>
						<div class = "cus_bottom">
							<p class = "maintit" style = "padding-top:30px;">
								들어올 때는 맘대로지만 나갈때는?!
								
							</p>	
							<a href = "${pageContext.request.contextPath}/memberAgree.do" onclick="return validate();">
								<span class = "subtxt">
								회원가입
								</span>
							</a>
								<span class = "titleText24">하러 가기</span>
								
							<p style = "margin-top:20px; font-size:12px;">회원가입시 다양한 혜택을 누리실 수 있습니다. 지금 바로 확인하세요!</p>
							
						</div>
					</td>

				</tr>				
				</tbody>
			</table>
			<script>
				function validate(){
					if('${memberLoggedIn}'.length<1){
						return true;
					}else{
						alert("이미 가입된 회원입니다.");
						return false;
					}
				}
				function validate2(){
					if('${memberLoggedIn}'.length>0){
						return true;
					}else{
						alert("로그인 후 이용해주세요.");
						location.href="${pageContext.request.contextPath}/memberLoginBefore.do";
						return false;
					}
				}
			</script>
			
			
			</div>
			<div class = "title_div">
				<h2 class = 'title01'>
					자주 묻는 질문
				</h2>
			</div>
			<style>
				.search_wrap .search {
					padding:10px;
					border-radius : 3px;
					border : 1px solid #bebebe;
					margin : 20px auto;
				
				}
				
				
				.search_wrap .search td {
					padding : 0 5px;
				}
				
				.search td{
					font-size : 12px;
					font-weight: bold;
				}
				
				.input_gray01 {
					padding : 0 5px;
					font-size : 14px;
					line-height : 30px;
					color : #333333;
					background : #f8f8f8;
					text-decoration: none;
					height : 28px;
					border : 1px solid #DBDBDB;
					
				}
				
				.btn_gray02{
					line-height: 26px;
					text-align : center;
					font-weight : bold;
					display : inline-block;
					font-size : 10pt;
					cursor: pointer;
					padding : 0 10pt;
					margin : 2px;
					border-radius: 3px;
					white-space: nowrap;
					border: 1px solid #696969;
					background-color: #696969;
					color : #fff;
				}
			
			</style>
			<div class = "search_wrap">
				<form action="post" >
					<input type = "hidden" name = "#" id = "#">
					
					<!-- <div align  = "center" class = "search" style = "width:100%">
						<table border = "0" cellspacing = "0" cellpadding = "5">
							<tbody>
								<tr>
									<td>FAQ 궁금하신 사항을 먼저 검색해보세요~</td>
									<td><input name = "#" id = "#" type = "text" class ="input_gray01" style = "width:200px"></td>
									<td><button type = "button" class = "btn_gray02">검색</button></td>
								</tr>	
							</tbody>
						</table>
					</div> -->
					
					<style>
						.search_icon {
							display: inline-block;
							margin-left : 10px;
							left: 20px;
							width : 35px;
							height : 35px;
							margin-top : 10px;
							border-radius: 100%;
							background : #2d2e33;
							color : #fff;
							font-size : 20px;
							line-height : 30px;
							text-align: center;
						}
						
						.answer {
							padding-left : 10px;
							font-size : 14px;
							color : #b2b2b2;
							margin-top : 9px;
							margin-bottom : 11px;
							padding-top : 10px;
							padding-bottom : 10px;
						
						}
						
						.qs {
							font-style : normal;
							font-weight: bold;
							margin-bottom : 10px;
						}
						
						.answer_icon {
							display : inline-block;
							left : 20px;
							width : 35px;
							height : 35px;
							border-radius: 100%;
							background : #92979b;
							color : #2d2e33;
							font-size : 20px;
							text-align: center;
							vertical-align: middle;
							padding-top:7px;
							padding-left :2px;
							
						
						}
						
						.nav-tabs {
								width:: 167px;
							}
							
					    .nav-link {
					    	width: 167px;
					    	text-align: center;
					    }
					</style>
				 	<nav class="nav nav-tabs" id="qs_tap" role="tablist">
  						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-id_pw" aria-selected="true"><b>ID/pw 찾기</b></a>
  						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><b>회원정보</b></a>
  						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false"><b>배송관련</b></a>
  						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact01" role="tab" aria-controls="nav-contact01" aria-selected="false"><b>상품문의</b></a>
  						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact02" role="tab" aria-controls="nav-contact02" aria-selected="false"><b>주문/결제</b></a>
  						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact03" role="tab" aria-controls="nav-contact03" aria-selected="false"><b>포인트</b></a>
  						
					</nav>
					
					<style>
						.qs {
							font-style: normal;
							font-weight: bold;
						}
					</style>
					<div class="tab-content" id="nav-tabContent">
  						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-id_pw-tab" >
  						
  						<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">아이디/비밀번호를 어떻게 찾을 수 있나요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 상단에 ID/비밀번호 찾기를 누르시면 등록하신 이메일을 통해 찾으실 수 있습니다.
  						</div>
  						
  						</div>
  						
  						<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
  						
  						<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">회원 탈퇴 후 재가입 할 수 있나요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 
  							탈퇴 후 재가입은 가능하지만 보유하고 있는 적립금과 장바구니 저장삼품들은 자동 소멸됩니다.
  						</div>
  						
  						</div>
  						<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
  							
  							<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">배송기간은 얼마나 걸리나요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 
  								주말을 제외하고 15시 이전에 구매하시면 당일배송되어 2일이 소요되고
  								15시 이후 구매하시면 3일이 소요됩니다.
  						</div>
  						
  						<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">교환기간은 얼마나 걸리나요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 
  								교환은 제품 수거 후에 재발송 되기 때문에 평균배송일보다 조금 깁니다.
 								일반적으로 수거되고 새상품을 받으시기까지 5~10일정도 소요됩니다.
  						</div>
  						
  						</div>
  						
  						<div class="tab-pane fade" id="nav-contact01" role="tabpanel" aria-labelledby="nav-contact-tab01">
  							
  							<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">A/S절차는 어떻게 되나요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 
  								1:1문의를 통해 신청을 받습니다.
  			
  						</div>
  						
  						
  						</div>
  						
  						<div class="tab-pane fade" id="nav-contact02" role="tabpanel" aria-labelledby="nav-contact-tab02">
  							
  							<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">결제는 어떤 방식이 있나요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 
  								결제는 카드를 통해서만 가능합니다.
  						</div>
  						
  						<span class = "search_icon fas fa-search"></span> 
  						<em class = "qs">장바구니가 무엇인가요?</em>
  						<div class = "answer">
  							<span class = "answer_icon fas fa-angle-right"></span> 
  								Try Trip의 상품을 보다 편리하게 이용하실 수 있도록 한 곳에 상품을 모아두는 기능입니다.
  						</div>
  						
  						
  						</div>
  						
  						<div class="tab-pane fade" id="nav-contact03" role="tabpanel" aria-labelledby="nav-contact-tab03">
	  							
	  							<span class = "search_icon fas fa-search"></span> 
	  						<em class = "qs">포인트란 무엇인가요?</em>
	  						<div class = "answer">
	  							<span class = "answer_icon fas fa-angle-right"></span> 
	  								상품 결제 시 현금(포인트1점 = 현금1원)처럼 사용하실 수 있습니다.
	  						</div>
	  						
	  						<span class = "search_icon fas fa-search"></span> 
	  						<em class = "qs">포인트는 어떻게 적립하나요?</em>
	  						<div class = "answer">
	  							<span class = "answer_icon fas fa-angle-right"></span> 
	  								회원가입시 3000p 적립, 구매후기 200p 적립, 상품구매시 2%가 적립됩니다.
	  						</div>  						
  						</div>
  						
					</div> 
					
					
				</form>
			</div>
			
		</div>
	
	
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />