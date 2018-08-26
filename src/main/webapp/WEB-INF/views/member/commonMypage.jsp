<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>



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
					background : #E2758C;
					
				}
				
				.lmenu_title .title {
					font: inherit;
					font-size : 30px;
					font-weight : bold;
					color : #FFF;
					word-spacing: -2pt;
					letter-spacing: 0;
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
				<div class = "title">
				<a href = "${pageContext.request.contextPath}/myPage.do" style = "text-decoration: none; color : #fff;">
				마이페이지
				</a>
				</div>
				
				<div class = "subTitle">MYPAGE</div>
			</div>
			
			<div align = "left" style = "overflow: hidden; background-color: #D8E5C4;">
			<c:if test="${memberLoggedIn!=null}">
				<ul>
				
					<li style = "margin-top:15px; "><center><b><span><c:out value="${memberLoggedIn.member_name }"></c:out>님 환영합니다.</span></b></center></li>
					<li><hr></li>
					<li style = "padding:0 22px; font-size: 14px;"><b>회원등급</b> : <span><c:out value = "${memberLoggedIn.member_level }"></c:out></span></li>
					<li style = "padding:0 22px; font-size: 14px;"><b>포인트</b> : <span><c:out value ="${totalPoint }"/></span>
				</ul>
				</c:if>
			</div>
			
			
			
			<style>
			.lmenu_menu .menu li {
				text-align: left;
				background-color: #f7f7f7;
				border-bottom: 1px solid #eaeaea;
			}
			
			.lmenu_menu .menu .txt {
				font-size : 14px;
				font-weight: bold;
				color : #686868;
				padding: 0 22px;
				line-height: 52px;
				display: block;
			}
			
			.lmenu_menu .menu .submenu{
				text-align: left;
				background-color: #ffffff;
				border : none;
				padding: 0 22px;
			}
			
			.lmenu_menu .menu li a {
			 	text-decoration: none;
			 	display : inline-block;
			 	color : black;
			}
			
			.lmenu_menu .menu .submenu .txt_margin_top {
				margin-top : 15px;
			}
			
			.lmenu_menu .menu .submenu .txt{
				font:inherit;
				font-size: 13px;
				font-weight: normal;
				color: #686868;
				padding: 5px 0px 5px 0;
				display: block;
				cursor: pointer;
			}
			
			.lmenu_menu .menu .btm{
				border-bottom: 1px solid #eaeaea;
			}
			
			.lmenu_menu .menu .submenu .txt_margin_bottom{
				margin-bottom: 15px;
			}
			</style>
			
			<!-- <script>
				function memberUpdate() {
				location.href ="${pageContext.request.contextPath}/memberUpdate.do"
			}
			</script> -->
			<!-- 왼쪽 메뉴 시작 -->
			<div class = "lmenu_menu">
				<ul class = "menu">
					<li>
						<a>
							<span class = "txt">개인정보</span>
						</a>
					</li>
					
					<li class = "submenu top">
						<a href = "${pageContext.request.contextPath}/memberUpdate.do" target="_self">
							<span class = "txt txt_margin_top">회원정보 수정</span>
						</a>
					</li>
					
					
					
					<li class = "submenu btm ">
						<a href = "${pageContext.request.contextPath}/memberExit.do" target = "_self">
							<span class = "txt txt_margin_bottom">회원탈퇴</span>
						</a>
					</li>
					
				
					
					<li>
						<a>
							<span class = "txt">나의 쇼핑정보</span>
						</a>
					</li>
					
					<li class = "submenu top">
						<a href = "${pageContext.request.contextPath}/memberOrderTotal.do?member_id=${memberLoggedIn.member_id}" target="_self">
							<span class = "txt txt_margin_top">주문 / 배송내역</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath}/memberRefund.do?member_id=${memberLoggedIn.member_id}" target = "_self">
							<span class = "txt">취소/환불내역</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath}/memberPoint.do?member_id=${memberLoggedIn.member_id}" target = "_self">
							<span class = "txt">나의 포인트</span>
						</a>
					</li>
					
					<li>
						<a>
							<span class = "txt">1:1 상담</span>
						</a>
					</li>
					
					<li>
						<a>
							<span class = "txt">나의 질문과 답변</span>
						</a>
					</li>
					
					<li>
						<a>
							<span class = "txt">상품Q&A</span>
						</a>
					</li>
				</ul>
				</div>
			
			
			
		</div>