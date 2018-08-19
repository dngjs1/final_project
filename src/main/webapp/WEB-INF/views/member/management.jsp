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
					
					<li class = "submenu">
						<a href = "${pageContext.request.contextPath}/memberExit.do" target = "_self">
							<span class = "txt">회원탈퇴</span>
						</a>
					</li>
					
					<li class = "submenu btm">
						<a href = "${pageContext.request.contextPath }/memberManagement.do" target = "_self">
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
				<a href = "#">회원관리</a>
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
				<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 회원관리</h2>
				<%-- <form action="${pageContext.request.contextPath }/managementEnd.do" method="post"> --%>
				<table class = "order_board">
					 <colgroup>
						<col style = "width:20%;">
						<col style = "width:20%;">
						<col style = "width:20%;">
					</colgroup> 
					<thead>
					<tr>
						<th scope="col" class = "#">ID</th>
						<td>
							<input type="hidden" name="member_id" value="<c:out value="${member.member_id }"></c:out>"/>
							<c:out value="${member.member_id }"></c:out>
						</td>
						<th scope="col" class = "#">우편번호</th>
						<td><c:out value="${member.post_no }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">이름</th>
						<td><c:out value="${member.member_name }"/></td>
						<th scope="col" class = "#">주소</th>
						<td><c:out value="${member.address }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">생년월일</th>
						<td><c:out value="${member.birthday }"/></td>
						<th scope="col" class = "#">상세주소</th>
						<td><c:out value="${member.detail_address }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">성별</th>
						<td>
							${member.gender=='M'?"남자":"여자"}
						</td>
						<th scope="col" class = "#">전화번호</th>
						<td><c:out value="${member.phone }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">가입일</th>
						<td><c:out value="${member.join_date }"/></td>
						<th scope="col" class = "#">이메일</th>
						<td><c:out value="${member.email }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">회원등급</th>
						<td>
							<select name ="member_level" id="level">
								<option value="admin" ${member.member_level=='admin'?"selected":"" }>admin</option>
								<option value="user"  ${member.member_level=='user'?"selected":"" }>user</option>
								<option value="user2" ${member.member_level=='user2'?"selected":"" }>user2</option>
							</select>
						</td>
						<th scope="col" class = "#">이메일수신여부</th>
						<td><c:out value="${member.email_alarm }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">상태</th>
						<td>
							<select name ="esc_status" id="esc_status">
								<option value="Y" ${member.esc_status=='Y'?"selected":"" }>메일미인증</option>
								<option value="N"  ${member.esc_status=='N'?"selected":"" }>일반회원</option>
								<option value="E" ${member.esc_status=='E'?"selected":"" }>탈퇴회원</option>
							</select>
						</td>
						<th scope="col" class="#">보유포인트</th>
						<td>
						
						</td>
						
					</tr>
					
					
					</thead>
					<tbody>
					
					</tbody>
				
				</table>
				<button type="button" onclick="updateMember()">수정</button>
				
				<!-- </form> -->
			</div>
			<div class = "mypage_wrap2">
				
				<h2 class = "mypage_title02"><i class="shopping_Cart fas fa-shopping-cart"></i>구매목록</h2>
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
						<th scope="col" class = "#">상품금액</th>
						<th scope="col" class = "#">수량</th>
						<th scope="col" class = "#">총금액</th>
					</tr>
					</thead>
					
					
					<!-- 구매목록 작성칸 -->
					<tbody>
						<tr>
						<td colspan="5">장바구니가 비었습니다.</td>
						</tr>
					</tbody>
				
				</table>
			
			</div>
		</div>
	</div>

<script>
function updateMember(){ 
		
		alert("접근성공");
		
		
	    $.ajax({
	        url:"${pageContext.request.contextPath}/managementEnd.do",
	        type   : "post",
	        data:{"member_id" :  "${member.member_id}",
	        		"member_level" : $("#level").val(),
	        		 "esc_status" : $("#esc_status").val()
	       
	        },
	   		
	        success:function(data){
				
	        },
	        error:function(jpxhr,textStatus,errormsg){
	           console.log("ajax전송 실패")
	           console.log(jpxhr);
	           console.log(textStatus);
	           console.log(errormsg);
	        }
	     });
		
};
		
		

 
</script>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />