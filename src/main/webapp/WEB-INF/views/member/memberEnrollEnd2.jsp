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
<!-- ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 회원가입완료 전체영역  시작 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ -->
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

<li>
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

<li class = "on">
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

	<style>
		.member_wrap {
			width : 580px;
			padding-top : 70px;
			margin : 0 auto;
			text-align : left;
		}
		
		.result_box {
			padding-top : 50px;
			text-align : center;
		}
		
		.result_txt {
			margin : 40px 0;
			font-size : 30px;
			line-height: 36px;
		}
		
		.btn_home{
			display : inline-block;
			width : 211px;
			height : 60px;
			border : none;
			background : #2D2E33;
			color : #fff;
			font-size : 18px;
			line-height : 58px;
			font-weight : bold;
			text-align: center;
			vertical-align: middle;
			box-sizing: border-box;
			cursor: pointer;
		}
	</style>
	<div class = "member_wrap">
		<div class = "result_box">
			<div class = "result_img">
			
			<img src = "https://pbs.twimg.com/profile_images/507839964961181697/Ht-TELDJ_400x400.png" style = "width : 168px; height:168px;">
			
			</div>
			
			<p class = "result_txt">
				<b>회원가입이 정상적으로 <br>
				완료되었습니다.</b>
			</p>
			<a href ="#" class = "btn_home" style = "color:#fff;">메인으로</a>
		
		</div>
	</div>
	
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />