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
				<a href = "#">회원정보수정</a>
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
			
			<!-- 회원가입 시작!! -->
		<style>
		.member_wrap {
			width : 580px;
			padding-top : 70px;
			margin : 0 auto;
			text-align : left;
		}
		
		.member_wrap .title {
			height: 103px;
			padding-bottom: 23px;
			border-bottom: 5px solid #2e2e2e;
			font-size : 30px;
			line-height: 81px;
			font-weight: bold;
		}
		.title-icon {
			display : inline-block;
			width : 80px;
			height : 80px;
			margin-top : -2px;
			border-radius: 100%;
			background: #2D2E33;
			color : #fff;
			font-size : 30px;
			line-height: 76px;
			text-align: center;
			vertical-align: middle;
		}
		
		.member_wrap .warnt {
			height: 40px;
			padding-bottom: 5px;
			margin-top: -45px;
			color : #000;
			font-size : 15px;
			line-height: 28px;
			text-align: right;
		}
		
		.member_wrap .join_list{
			padding-top: 15px;
			font-size : 0;
			line-height: 0;
		}
		
		.member_wrap .join_list > li {
		margin-top: 5px;
		}
		
		.member_wrap .join_list > li input.text{
			height : 55px;
			padding : 0 20px;
			margin-left: 5px;
			color : #92979b;
			font-weight: bold;
			line-height: 50px;
			margin:0;
			border : 1px solid #c4c4c4;
			font-size : 15px;
		}
		
		.member_wrap .join_list > li .example{
			padding:0 20px 2px;
			color : #888;
			font-size : 13px;
			line-height : 18px;
		}
		</style>
			
			<div class = "mypage_wrap">
				
				
				<div class = "member_wrap">
		<h1 class = "title">
			<i class="title-icon fas fa-user-plus" ></i>
			&nbsp;회원정보수정
		</h1>
		<p class = "warnt"><b></b></p>
		<form name = "frm" method="post" enctype = "multipart/form-data" onsubmit='return validate();' action="${pageContext.request.contextPath}/memberUpdateEnd.do" >
			<ul class = "join_list">
			<!-- 4글자 이상 입력 -->
			<li>
				<input type = "text" id = "member_id" name = "member_id" class = "text" placeholder="*아이디 입력" style = "ime-mode:disabled; width:100%; border:solid gray;" tabindex = "1" value="${memberLoggedIn.member_id }"  readonly>
			</li>
			<!-- 이름 입력 -->
			<li>
				<input type = "text" id = "member_name" name ="member_name" class = "text" placeholder="*이름 입력" style = " width:100%; border:solid gray;" tabindex = "2" value="${memberLoggedIn.member_name }" required>
				<p class = "example" id = "#">한글로만 작성해주세요</p>
			</li>
			<!-- 기존 비밀번호 입력 -->
			<li>
				<input type = "password" id = "original_password" name = "original_password" class = "text" placeholder="*기존 비밀번호 입력" style = " width:100%; border:solid orange;" tabindex = "3" >
				
			</li>
			<!-- 비밀번호 입력 -->
			<li>
				<input type = "password" id = "password" name = "member_pw" class = "text" placeholder="*새로운 비밀번호 입력" style = " width:100%; border:solid orange;" tabindex = "3" >
				
			</li>
			<!-- 비밀번호 확인 -->
			<li>
				<input type="password" id="password2"  class = "text" placeholder="*새로운 비밀번호 확인 " tabindex="4" style="width:100%; border:solid orange;" >
				<p class="example" id = "rePassResult2" style="color:orange">비밀번호 변경시에만 입력하세요</p>
				<p class = "example" id = "rePassResult2" style="color:orange">8 ~ 12 영문과 숫자(또는 한글 숫자)조합</p>
			
			</li>
			<!-- 생년월일 선택 -->
			<li>
				<input type = "date" id = "birthday" name = "birthday" class = "text" placeholder="*생년월일 입력" style = " width:100%; border:solid gray;" tabindex = "5" value="${memberLoggedIn.birthday }" required>
				<p class = "example" id = "#">정확한 생년월일을 입력해주세요</p>
			</li>
			
			<li>
			
			<!-- 성별 선택 -->
				<div>
				<label for = "gender0" style = "font-size : 16px; color : #777777;"><strong>성별 :</strong>&nbsp;</label>
				<input type = "radio" name = "gender" id = "gender0" value = "M" ${memberLoggedIn.gender=='M'?"checked":"" } >
				<label for = "gender0" style = "font-size : 16px; color : #777777;">남&nbsp;</label>	
				
				
				
				<input type = "radio" name = "gender" id = "gender1" value = "F"  ${memberLoggedIn.gender=='F'?"checked":"" }>
				<label for = "gender1" style = "font-size : 16px; color : #777777;" >여</label>
				
				
				</div>
			</li>
			
			<!-- 휴대전화 입력 -->
			<li>
				<input type = "text" id = "phone" name = "phone" class = "text" placeholder="*휴대폰번호입력" style = " width:100%;  border:solid gray;" tabindex = "5"  value="${memberLoggedIn.phone }" required>
				<p class = "example" id = "#">(-없이)01012345678</p>
			</li>
			
			<!-- 주소입력 -->
			<style>
			.btn_check {
				display: inline-block;
				width : 120px;
				height : 55px;
				margin-left: 10px;
				background: #92979b;
				color : #fff;
				font-size : 14px;
				text-align: center;
				font-weight: bold;
				cursor : pointer;
				
				
			}
			</style>
			<li>
				<input type = "text" id = "roadAddress" name = "address" class = "text" placeholder="*주소" style = "width : 450px;  border:solid gray;" value="${memberLoggedIn.address }" required>
				<input type = "button" value = "주소찾기" class = "btn_check" style = "border:none;" onclick="DaumPostcode()">
				<p class = "example" id = "#">주소찾기버튼으로 쉽게 찾아보세요</p>
			</li>
			
			<li>
				<input type = "text" id = "detail_address" name = "detail_address" class = "text" placeholder="*상세주소입력" style = " width:100%;  border:solid gray;" tabindex = "5"  value="${memberLoggedIn.detail_address }"required>
				<p class = "example" id = "#">주소찾기 버튼으로 주소를 찾은 후 나머지 주소를 입력해주세요</p>
			</li>
			
			<li>
				<input type = "text" id = "post_no" name = "post_no" class = "text" placeholder="*우편번호입력" style = " width:100%;  border:solid gray;" tabindex = "5"  value="${memberLoggedIn.post_no }" required>
				<p class = "example" id = "#">우편번호는 주소찾기 버튼을 활용할 시 자동으로 채워집니다.</p>
			</li>
			
			<li>
				<input type = "email" id = "email" name = "email" class = "text" placeholder="*이메일 입력 (ex : abc@naver.com)" style = "width : 450px;  border:solid gray;"  value="${memberLoggedIn.email }" required>
				<span style = "color : #777777;font-size:15px; margin-left:14px;"><strong>이메일 수신 :</strong></span><input type = "checkbox" name = "email_alarm" value="Y" style = "margin-left: 5px;" ${memberLoggedIn.email_alarm=='Y'?"checked":"" }>
				<p class = "example" id = "#">이메일 인증을 위해 이메일 형식에 맞게 입력해주세요.</p>
				
			</li>
			
			<style>
			
			.join_btn {
				width : 391px;
				height : 60px;
				border: none;
				background: #2D2E33;
				color : #fff;
				font-size : 18px;
				font-weight: bold;
				text-align: center;
				vertical-align: middle;
				cursor:pointer;
			}
			
			.cancel_btn{
				width : 175px;
				height : 60px;
				border : none;
				background: #92979b;
				color : #fff;
				font-size : 18px;
				font-weight: bold;
				text-align: center;
				vertical-align : middle;
				margin-left : 14px;
				cursor: pointer;
			}
			</style>
			<li>
				<input type = "submit" value = "수정" class = "join_btn">
				<input type = "button" value = "취소" class = "cancel_btn" onclick="returnPage()">
			</li>
			</ul>
		
		</form>
		
	</div>
				
			
			</div>
			
			<div style = "height : 50px;">
			
			</div>

			
			
		</div>
	
	
	</div>
	
	
	<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post_no').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detail_address').focus();
            }
        }).open();
    }
</script>
<!-- 비밀번호 변경 Ajax  -->
<script>
	 var encodeCheck = "true";
	 
	$(function(){ 
		$('#original_password').blur(function(){
			//기존 비밀번호 확인	
		    $.ajax({
		        url:"${pageContext.request.contextPath}/checkUpdatePassword.do",
		        type   : "post",
		        data:{"original_password":$("#original_password").val() ,
					  "member_id":$("#member_id").val()
		        },
		   		
		        success:function(data){
					
		        	console.log(data);
		      	  if(data==false && $("#original_password").val()!=""){

						 /*  alert("기존 비밀번호가 일치하지 않습니다.");
						  $("#password").val("");
						  $("#password2").val("");
						  $("#original_password").val("");
						  $('#original_password').focus();
						  return false; */
						  
						  encodeCheck="false";
						  
		      	  } else if(data==true || $("#original_password").val()=="") {
		      		encodeCheck="true";
		      	  }
		      	  
		      	  console.log("encodedCheck : "+encodeCheck);
		        },
		        error:function(jpxhr,textStatus,errormsg){
		           console.log("ajax전송 실패")
		           console.log(jpxhr);
		           console.log(textStatus);
		           console.log(errormsg);
		        }
		     });
			
		});
	}); 
	
	
	

	function validate() {
		//변경할 비밀번호 일치여부 확인
		if($("#password").val() != ($("#password2").val())) {
			alert("변경할 비밀번호가 일치하지 않습니다.")
			$("#password").val("");
			$("#password2").val("");
			$("#password").focus();
			return false;
		}
		
		if(encodeCheck=="false" && $("#original_password").val()!="") {
			  alert("기존 비밀번호가 일치하지 않습니다.");
			  $("#password").val("");
			  $("#password2").val("");
			  $("#original_password").val("");
			  $('#original_password').focus();
			  return false;
		}
		
		
	}
	
</script>

<script>
		function returnPage() {
			location.href="${pageContext.request.contextPath}/myPage.do"
		}

</script>
	

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />