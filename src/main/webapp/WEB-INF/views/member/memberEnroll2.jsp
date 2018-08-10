<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<% response.setCharacterEncoding("UTF-8"); %>
<% request.setCharacterEncoding("UTF-8"); %>


<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>   
</jsp:include>
	<!-- ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 회원가입 전체영역  시작 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ -->
	<div class = "container">	
		
		<style>

	.joinstep ul{
		font-size : 0;
		border : 1px solid #dcdcdc;
		border-top:none;
		border-bottom:none;
		box-sizing: border-box;
		padding: 50px 80px 0 80px;
	}
	.joinstep ul li {
		position:relative;
		box-sizing: border-box;
		display:inline-block;
		width: 33.33%;
		color: #777777;
		text-align: cetner;
		background:#f3f3f3;
		padding: 20px 0;
		border-top: 1px solid #dadada;
		border-bottom: 1px solid #dadada;
	}
	.joinstep ul li.on {
		background: #fff;
		color : #2D2E33;
		border-left : none;
	}
	
	.joinstep ul li:first-child {
		border-left: 1px solid #dadada;
		border-right: none;
	}
	
	
	
	.joinstep ul li .step {
		overflow: hidden;
	}
	.joinstep ul li .step > div {
		display : inline-block;
		font-size : 18px;
		vertical-align : middle;
	}
	
	
	.joinstep ul li .step > div.icon {
		width:46px;
		height : 42px;
		margin-left : 34px;
		text-align:center;
		font-size:40px;
		border-radius: 100%;
		line-height: 50px;
		margin-right:10px;
		background:#fff;
	}
	.joinstep ul li .step > div.icon2{
		margin-left : 40px;
		width : 46px;
		height: 42px;
		border-radius: 100%;
		background: #fff;
		line-height:50px;
		margin-right:10px;
		}
	.joinstep ul li .next .iconfont {
		font-size:30px;
	}
	
	.text{
		padding-left: 20px;
	}
	
	.iconfont{
		font-family : "iconfont" !important;
		font-size : 16px;
		font-style : normal;
	}
	
	.joinstep ul li.on .next{
		background:#fff;
	}
	
	.joinstep ul li .next{
		position: absolute;
		right:-25px;
		top:53%;
		margin-top: -25px;
		width:50px;
		height:50px;
		line-height: 50px;
		border-radius: 100%;
		font-size:30px;
		z-index:10;
	}
	
	.fa-check-circle{
		margin-top : 6px;
		margin-left: 1px;
	}
	.fa-edit {
		margin-top : 5px;
		margin-left : 9px;
	}
	
	.joinstep ul li:last-child{
		border-right : 1px solid #dadada;
	}
	
	.fa-sign-in-alt {
		margin-top : 5px;
		margin-left : 6px;
	}
	
</style>
		<div class = "joinstep">
	<ul style = "border:none;">
		<li>
			<div class = "step">
				<div class = "icon">
				
				<span class = "iconfont">
				<i class = "far fa-check-circle" style = "font-size:30px;" >
					
				</i>
				</span>
				</div>
				
				<div class = "text" style = "margin-left : 10px;">
				<span><strong>STEP 01</strong></span>
				<br>
				<strong>약관동의/본인인증</strong>
			
			</div>
			
			</div>
			<div class = "next">
			<span class= "iconfont">
				<center><i class="fas fa-chevron-right" style = "margin-top:10px; margin-left:6px;"></i></center>
				</span>
			
</div>
</li>

<li class = "on">
			<div class = "step">
				<div class = "icon2">
				
				<span class = "iconfont">
				<i class = "far fa-edit" style = "font-size:30px;" >
					
				</i>
				</span>
				</div>
				
				<div class = "text" style = "margin-left: 23px;">
				<span><strong>STEP 02</strong></span>
				<br>
				<strong>회원정보입력</strong>
			
			</div>
			
			</div>
			<div class = "next">
			<span class= "iconfont">
				<center><i class="fas fa-chevron-right" style = "margin-top:10px; margin-left:6px; color : #777777 "></i></center>
				</span>
			
</div>
</li>

<li>
			<div class = "step">
				<div class = "icon2" style = "margin-left:63px;">
				
				<span class = "iconfont">
				<i class = "fas fa-sign-in-alt" style = "font-size:30px;" >
					
				</i>
				</span>
				</div>
				
				<div class = "text" style = "margin-left: 25px;">
				<span><strong>STEP 03</strong></span>
				<br>
				<strong>가입완료</strong>
			
			</div>
			
			</div>
			
</li>
</ul>



			
</div>
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
	<div class = "member_wrap">
		<h1 class = "title">
			<i class="title-icon fas fa-user-plus" ></i>
			&nbsp;회원가입
		</h1>
		<p class = "warnt"><b>*필수입력</b></p>
		<form name = "frm" method="post" enctype = "multipart/form-data">
			<ul class = "join_list">
			<!-- 4글자 이상 입력 -->
			<li>
				<input type = "text" id = "#" name = "#" class = "text" placeholder="*아이디 입력" style = "ime-mode:disabled; width:100%;" tabindex = "1">
				<p class = "example" id = "#">4글자 이상을 입력하세요</p>
			</li>
			<!-- 이름 입력 -->
			<li>
				<input type = "text" id = "#" name = "#" class = "text" placeholder="*이름 입력" style = " width:100%;" tabindex = "2">
				<p class = "example" id = "#">한글로만 작성해주세요</p>
			</li>
			<!-- 비밀번호 입력 -->
			<li>
				<input type = "password" id = "pass" name = "pass" class = "text" placeholder="*비밀번호 입력" style = " width:100%;" tabindex = "3">
				<p class = "example" id = "rePassResult2">8 ~ 12 영문과 숫자(또는 한글 숫자)조합</p>
			</li>
			<!-- 비밀번호 확인 -->
			<li>
				<input type="password" id="repass" name="repass"  class = "text" placeholder="*비밀번호 확인 " tabindex="4" style="width:100%;" onkeyup="passwordCheck(this)">
				<p class = "example" id = "rePassResult">
				</p>
			</li>
			<!-- 생년월일 선택 -->
			<li>
				<input type = "date" id = "#" name = "#" class = "text" placeholder="*생년월일 입력" style = " width:100%;" tabindex = "5">
				<p class = "example" id = "#">정확한 생년월일을 입력해주세요</p>
			</li>
			
			<li>
			
			<!-- 성별 선택 -->
				<div>
				<label for = "gender0" style = "font-size : 16px; color : #777777;"><strong>성별 :</strong>&nbsp;</label>
				<input type = "radio" name = "gender" id = "gender0" value = "M" checked >
				<label for = "gender0" style = "font-size : 16px; color : #777777;">남&nbsp;</label>	
				
				
				
				<input type = "radio" name = "gender" id = "gender1" value = "F" >
				<label for = "gender1" style = "font-size : 16px; color : #777777;">여</label>
				
				
				</div>
			</li>
			
			<!-- 휴대전화 입력 -->
			<li>
				<input type = "text" id = "#" name = "#" class = "text" placeholder="*휴대폰번호입력" style = " width:100%;" tabindex = "5">
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
				<input type = "text" id = "#" name = "#" class = "text" placeholder="*주소" style = "width : 450px;">
				<input type = "button" value = "주소찾기" class = "btn_check" style = "border:none;">
				<p class = "example" id = "#">주소찾기버튼으로 쉽게 찾아보세요</p>
			</li>
			
			<li>
				<input type = "text" id = "#" name = "#" class = "text" placeholder="*상세주소입력" style = " width:100%;" tabindex = "5">
				<p class = "example" id = "#">주소찾기 버튼으로 주소를 찾은 후 나머지 주소를 입력해주세요</p>
			</li>
			
			<li>
				<input type = "text" id = "#" name = "#" class = "text" placeholder="*우편번호입력" style = " width:100%;" tabindex = "5">
				<p class = "example" id = "#">우편번호는 주소찾기 버튼을 활용할 시 자동으로 채워집니다.</p>
			</li>
			
			<li>
				<input type = "email" id = "#" name = "#" class = "text" placeholder="*이메일 입력 (ex : abc@naver.com)" style = "width : 450px;">
				<span style = "color : #777777;font-size:15px; margin-left:14px;"><strong>이메일 수신 :</strong></span><input type = "checkbox" name = "email_alarm" style = "margin-left: 5px;">
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
				<input type = "submit" value = "가입" class = "join_btn">
				<input type = "reset" value = "취소" class = "cancel_btn">
			</li>
			</ul>
		
		</form>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />