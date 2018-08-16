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
					<li style = "padding:0 22px; font-size: 14px;"><b>적립금</b> : <span>5000원</span>
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
					
					<li class = "submenu btm">
						<a href = "#" target = "_self">
							<span class = "txt txt_margin_bottom">회원관리</span>
						</a>
					</li>
					
					<li>
						<a>
							<span class = "txt">나의 쇼핑정보</span>
						</a>
					</li>
					
					<li class = "submenu top">
						<a href = "${pageContext.request.contextPath}/memberOrderTotal.do" target="_self">
							<span class = "txt txt_margin_top">주문 / 배송내역</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">취소/반품/환불내역</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "#" target = "_self">
							<span class = "txt">장바구니</span>
						</a>
					</li>
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath}/memberPoint.do" target = "_self">
							<span class = "txt">나의 포인트</span>
						</a>
					</li>
	
			
					<li class = "submenu btm" >
						<a href = "#" target = "_self">
							<span class = "txt txt_margin_bottom">나의 배송지</span>
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
		
		<div class = "col-10">
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">회원탈퇴</a>
			</div>
			
		
			
			<style>
			
				.mypage_wrap {
					padding-bottom: 20px;
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
				
				.exit_txt_box {
					padding:40px;
					background: #fcfcfb;
					border : 1px solid #d9d9d9;
				}
				.exit_txt_box h4 {
					font-size : 15px;
					color : #2e2e2e;
					line-height: 21px;
					font-weight: bold;
				}
				.exit_txt_box p {
					font-size : 14px;
					color : #888888;
					line-height: 10px;
					
				}
				
				.exit_txt02 {
					padding-top : 40px;
				}
			</style>
			<div class = "mypage_wrap">
				<h2 class = "mypage_title02">회원탈퇴</h2>
				<div class = "exit_txt_box">
					<div class = "exit_txt01">
						<h4>회원탈퇴신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다.</h4>
						<p>- 탈퇴 후 고객님의 정보는 전자상거래 소비자보호법에 의거한 개인정보보호정책에 따라 관리됩니다</p>
						<p>- 탈퇴 후 일정기간 재가입 여부판단을 목적으로 고객님의 최소정보(아이디,성명)를 보존합니다</p>
						<p>- 탈퇴 시 고객님께서 보유하셨던 적립금, 쿠폰, 장바구니의 저장상품은 모두 삭제되며 복구되지 않습니다</p>
						<p>- 위에 사항을 꼭 확인하시고 신중하게 탈퇴 신청을 해주시길 바랍니다. 탈퇴 후 발생하는 불이익에 대한 모든 책임은 고객님께 있습니다.</p>
					</div>
				
					<div class = "exit_txt02"></div>
						<h4>다음의 경우는 회원탈퇴에 주의가 필요합니다.</h4>
						<p>- 현재 고객님의 반품처리 요청사항이나 고객서비스가 완료되지 않은 경우에도 탈퇴하실 경우 추후 발생하는 불이익에 대하여 본사는 책임이 없습니다</p>
						<p>- 거래가 진행중인 경우 진행중인 거래를 우선 마무리를 하시고 탈퇴를 진행하시길 바랍니다. 탈퇴 후 발생하는 불이익에 대한 모든 책임은 고객님께 있습니다</p>
						<p>- 탈퇴 후 3개월 내(90일) 재가입시 신규회원가입혜택이 지급되지 않습니다.</p>
				</div>
			</div>
			<style>
			.exit_check_list{
				overflow: hidden;
				padding : 40px 0px 40px 60px;
				box-sizing: border-box;
				border:1px solid #d9d9d9;
				background: #fdfdf8;
			}
			
			.exit_check_list li{
				padding-top : 22px;
				float: left;
				width : 50%;
				text-align: left;
				font-size: 14px;
				color : #2e2e2e;
			}
			
			.exit_check_list li.top {
				padding-top : 0px;
			}
			.exit_check_list li label {
				padding-left: 15px;
			}
			</style>
			<div class = "mypage_wrap2">
				<h2 class = "mypage_title02" style = "font-size : 16px;">※이용하시면서 불편하셨던 사항을 체크해 해주세요(중복체크 가능)</h2>
				
					<div class = "exit_check_list">
						<ul>
							<li class = "top">
								<input type = "checkbox" id = "#" name = "#" value = "다른 쇼핑몰에 비해 가격이 비쌈" title="다른 쇼핑몰에 비해 가격이 비쌈">
								<label for = "#">다른 쇼핑몰에 비해 가격이 비쌈</label>
							</li>
							
							<li class = "top">
								<input type = "checkbox" id = "#" name = "#" value = "교환/환불/반품에 대한 불만" title="교환/환불/반품에 대한 불만">
								<label for = "#">교환/환불/반품에 대한 불만</label>
							</li>
							
							<li>
								<input type = "checkbox" id = "#" name = "#" value = "상품품질이 안 좋음" title="상품품질이 안 좋음">
								<label for = "#">상품품질이 안 좋음</label>
							</li>
							
							<li>
								<input type = "checkbox" id = "#" name = "#" value = "이벤트/회원서비스가 다양하지 않음" title="이벤트/회원서비스가 다양하지 않음">
								<label for = "#">이벤트/회원서비스가 다양하지 않음</label>
							</li>
						
						
						
						</ul>
					
					
					</div>
					
					<style>
						.user_agree_check {
							padding : 28px 0 22px 0;
							text-align: center;
							font-size : 15px;
							color : #2e2e2e;
						}
						
						.user_agree2_btn {
							overflow: hidden;
							font-size : 0px;
							text-align: center;
						}
						
						.btn_agree {
							display: inline-block;
							height:45px;
							width: 103px;
							background: #2D2E33;
							color : white;
							font-size: 14px;
							line-height: 43px;
							font-weight: bold;
							text-align: center;
							vertical-align: middle;
							box-sizing: border-box;
							cursor:pointer;
						}
						
						.btn_agree:link {
							color : white;
							text-decoration: none;
						}
						.btn_agree:visited {
							color : white;
							text-decoration: none;
}
						.btn_cancel{
							display: inline-block;
							height:45px;
							width: 103px;
							background: #92979b;
							color : white;
							font-size: 14px;
							line-height: 43px;
							font-weight: bold;
							text-align: center;
							vertical-align: middle;
							box-sizing: border-box;
							cursor:pointer;
						}
						
						.btn_cancel:visited {
							color : white;
							text-decoration: none;
}
						.btn_cancel:link {
							color : white;
							text-decoration: none;
}
					</style>
					<div class = "user_agree_check">
							<input type = "checkbox" id = "#" name = "#" value = "회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의합니다." title="회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의합니다.">
							<label for = "#"><b>회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의합니다.</b></label>
					</div>
					
					<div class = "user_agree2_btn">
					
						<a href = "#" class = "btn_agree">
							확인
						</a>
						<span style = "display: inline-block; width:1px;"></span>
						
						<a href = "#" class = "btn_cancel">
							취소
						</a>
					</div>
			
			</div>
			
			
			
			
			
			
		</div>
	
	
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />