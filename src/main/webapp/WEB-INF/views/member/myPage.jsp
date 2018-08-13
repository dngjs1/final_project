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
	margin-top: 10;
	padding: 0 10px;
	font-size : 20px;
	line-height:30px;
	font-weight: bold;
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
					background : #2D2E33;
					
				}
				
				.lmenu_title .title {
					font: inherit;
					font-size : 30px;
					font-weight : bold;
					color : #FFF;
					word-spacing: -2pt;
					letter-spacing: -2pt;
					margin : 10px 0 8px 0;
				}
				
				.lmenu_title .subTitle {
					font : inherit;
					font-size : 16px;
					font-weight : normal;
					color : #FFF;
					word-spacing : -2pt;
				}
			</style>
			<!-- 고객센터 타이틀 시작!! -->
			<div class = "lmenu_title">
			<i class="fas fa-user-edit" style = "color:#fff; font-size : 40px;"></i>
				<div class = "title">마이페이지</div>
				<div class = "subTitle">MYPAGE</div>
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
				background-color: #AFB3C6;
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
				background-color: #AFB3C6;
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
						<a href = "#" target = "_self">
							<span class = "txt txt_margin_top">주문내역/배송조회</span>
						</a>
					</li>
					
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">포인트 조회</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">나의 질문과 답변</span>
						</a>
					</li>
					
					<li class = "submenu btm">
						<a href = "#" target = "_self">
							<span class = "txt txt_margin_bottom">장바구니</span>
						</a>
					</li>
					
					<li>
						<a>
							<span class = "txt">회원센터</span>
						</a>
					</li>
					
					<li class = "submenu top">
						<a href = "#" target ="_self">
							<span class = "txt txt_margin_top">회원가입</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">아이디찾기</span>
						</a>
					</li>
					
					<li class = "submenu btm">
						<a href = "#" target = "_self">
							<span class = "txt txt_margin_bottom">비밀번호찾기</span>
						</a>
					</li>
					
					<li>
					<a>
						<span class = "txt">자주묻는 질문</span>
					</a>
					</li>
					
					<li class = "submenu top">
						<a href = "${pageContext.request.contextPath }/findMember.do" target = "_self">
							<span class = "txt txt_margin_top">아이디/비밀번호 찾기</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target="_self">
							<span class = "txt">회원정보</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">배송관련</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">상품문의</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">반품/교환/취소/환불</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">주문결제</span>
						</a>
					</li>
					
					<li class = "submenu btm">
						<a href = "#" target = "_self">
							<span class = "txt txt_margin_bottom">포인트</span>
						</a>
					</li>
					
					
					<li>
					<a href = "#" target = "_self">
						<span class = "txt">공지사항</span>
					</a>
					</li>
					
					<li>
					<a href = "#" target = "_self">
						<span class = "txt">커뮤니티게시판</span>
					</a>
					</li>
					
					<li>
					<a href = "#" target = "_self">
						<span class = "txt">1:1친절상담</span>
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
				<a href = "#">마이페이지</a>
			</div>
			
			<hr>
			
			<div style="width:50%; margin: 0 auto;">
	<button type="button" onclick="memberUpdate()" >회원정보수정</button>
</div>
<script>
	function memberUpdate() {
		location.href ="${pageContext.request.contextPath}/memberUpdate.do"
	}
</script>
			
			
		</div>
	
	
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />