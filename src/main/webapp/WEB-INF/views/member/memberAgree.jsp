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

<script>


/* 기본체크 */
	$(".ckbox").each(function(index){
		if($(this).prop("checked"))
		{

			if($(this).hasClass("termsAll")) /* 전체선택체크 */
			{
				$(".cklabel").not(".ck_mail").removeClass("on");
				$(".ckbox").not(".ck_mail").prop("checked",false);
				$(".cklabel").not(".ck_mail").addClass("on");
				$(".ckbox").not(".ck_mail").prop("checked",true);
			}
			else
			{
				$(".cklabel").eq(index).addClass("on");
			}
		}
		else
		{
			$(".cklabel").eq(index).removeClass("on");
		}


		$(this).change(function(){
			if($(this).prop("checked"))
			{
				if($(this).hasClass("termsAll")) /* 전체선택체크 */
				{
					$(".cklabel").not(".ck_mail").addClass("on");
					$(".ckbox").not(".ck_mail").prop("checked",true);
				}
				else
				{
					$(".cklabel").eq(index).addClass("on");
				}
			}
			else
			{
				if($(this).hasClass("termsAll")) /* 전체선택체크 */
				{
					$(".cklabel").not(".ck_mail").removeClass("on");
					$(".ckbox").not(".ck_mail").prop("checked",false);
				}
				else
				{
					$(".cklabel").eq(index).removeClass("on");
				}
			}
		});

	});

	$(document).ready(function(){
		//최상단 체크박스 클릭
		$("#checkall").click(function(){
			//클릭되었으면
			if($("#checkall").prop("checked")){
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=agreeLicensing]").prop("checked",true);
				$("input[name=agreePrivacy]").prop("checked",true);
				$(".member_wrap .cklabel").addClass("on");
				//클릭이 안되있으면
			}else{
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=agreeLicensing]").prop("checked",false);
				$("input[name=agreePrivacy]").prop("checked",false);
				$(".member_wrap .cklabel").removeClass("on");
			}
		})
	})
</script>
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
	}
	
	.joinstep ul li:first-child {
		border-left: 1px solid #dadada;
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
		width:80px;
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
		margin-left: 7px;
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
<div class = "container" style = "">

	<div class = "joinstep">
	<ul style = "border:none;">
		<li class = "on">
			<div class = "step">
				<div class = "icon">
				
				<span class = "iconfont">
				<i class = "far fa-check-circle" style = "font-size:30px;" >
					
				</i>
				</span>
				</div>
				
				<div class = "text">
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

<li >
			<div class = "step">
				<div class = "icon2">
				
				<span class = "iconfont">
				<i class = "far fa-edit" style = "font-size:30px;" >
					
				</i>
				</span>
				</div>
				
				<div class = "text" style = "margin-left: 40px;">
				<span><strong>STEP 02</strong></span>
				<br>
				<strong>회원정보입력</strong>
			
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
				<i class = "fas fa-sign-in-alt" style = "font-size:30px;" >
					
				</i>
				</span>
				</div>
				
				<div class = "text" style = "margin-left: 40px;">
				<span><strong>STEP 03</strong></span>
				<br>
				<strong>가입완료</strong>
			
			</div>
			
			</div>
			
</li>
</ul>



			
</div>

<style>
	.member_wrap{
		width: 580px;
		padding-top : 70px;
		margin : 0 auto;
		text-align : left;
	}
	
	.member_wrap .titles{
		
		padding-bottom: 21px;
		border-bottom: 5px solid #2e2e2e;
		font-size : 30px;
		line-hieght : 81px;
		font-weight : bold;
	}
</style>
<form name = "frm" method = "post" onsubmit = "return namechk(this)" autocomplete="off">

	<input type = "hidden" name = "isNameChk">
	<input type = "hidden" name = "agreechk">
	<div class = "member_wrap">
	<style>
		.enter-member{
			font-size : 32px;
			font-weight: bold;
			display : inline-block;
			width : 80px;
			height: 80px;
			margin-top: -2px;
			border-radius: 100%;
			background:#2d2e33;
			color : #fff;
			padding-bottom : 10px;
		}
		
		.fa-user-plus{
			font-size : 32px;
			margin-top : 19px;
			margin-left : 9px;		
		}
	</style>
	
	<center>
		<h1 class = "titles" style = "margin-bottom:0px;">
		<span class = "enter-member">
			<i class="fas fa-user-plus"></i>
			</span>
			회원가입
			</h1>
			</center>
			
			<style>
				.regist_list li {
					box-sizing: border-box;
					overflow:hidden;
					padding: 20px 20px;
					border: 1px solid #dcdcdc;
					border-top : none;
				}
				
				.regist_list li h2{
					font-size : 16px;
					padding-bottom: 15px;
				}
				.member_wrap .con-left {
					float : left;
					width : 100%;
					height : 200px;
					box-sizing: border-box;
					border : 1px solid #ccc;
					overflow-y : scroll;
					overflow-x : hidden;
					
				}
				
				
				.mgt0 {
					margin-top:0 !important;
				}
				.guide_wrap {
					margin:20px 0; 
					padding:40px 7%;  
					background:#fff; 
					font-size:14px;
				}
					
				.guide_wrap p {
					margin:20px 0 0 0;
					font-size:14px;
					line-height:18px;
				}
				.guide_wrap ol {
					margin-top:30px;
					font-size:18px;
					line-height:24px;
				}
				.guide_wrap ol li {
					margin-top:10px;
					font-weight:bold;
				}
				.guide_wrap h2 {
					margin-top:50px;
					font-size:18px;
					line-height:24px;
				}
			</style>
		<ul class = "regist_list">
			<li>
				<h2><Strong>회원가입 약관</Strong></h2>
				<div class = "con-left">
					<div class = "guide_wrap">
					
						<style>
							.guide_wrap {
								margin: 20px 0;
								padding: 40px 7%;
								background : #fff;
								font-size : 14px;
								}
							.regist_list li h1 {
								font-size : 18px;
								padding-bottom: 15px;
							}
							.guide_wrap h1 {
								margin-top:50px;
								font-size : 18px;
								line-height : 24px;
							}
							.guide_wrap p {
								margin : 20px 0 0 0 ;
								font-size : 14px;
								line-height : 18px;
							}
						</style>
						<h1 class = "mgt0"><strong>1조 (목적)</strong></h1>
						<p>이 약관은 ("NOT_NULL_PROJECT")에서 제공하는 쇼핑몰을 이용함에 있어
						이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.</p>
						
						<h2><strong>제2조 (정의)</strong></h2>
						<p>
						① 쇼핑몰이라 함은 재화 또는 용역을 이용자에게 제공하기 위하여 
						컴퓨터 등 정보 통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 
						설정한 가상의 영업장을 말하며, 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.</p>
						
						<p>② 이용자라 함은 쇼핑몰에 접속하여 서비스를 받는 회원 및 비회원을 말합니다.</p>
						
						<h2><strong>제3조 (약관의 명시와 개정)</strong></h2>
						① (“NOT_NULL_PROJECT")는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 
						    사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 쇼핑몰의 초기 서비스화면(전면)에 게시합니다.
					</div>
				
				</div>

				<style>
					.con-right {
						text-align : right;
					}
					.member_wrap .cklabel {
						padding-left : 0;
						padding-right: 28px;
						margin-top : 10px;
						font-size : 12px;
					}
					
					.member_wrap .cklabel {
						display : inline-block;
						position: relative;
						overflow: hidden;
						font-size : 15px;
						color : #5f5f5f;
						padding-left: 28px;
						line-height : 24px;
					}
					
					.member_wrap .cklabel #iconfont{
					left : auto;
					right : 0;
					vertical-align: top;
					position: absolute;
					top: -2px;
					width: 24px;
					height:24px;
					color : #999;
					font-size: 24px;
					line-height: 28px;
					font-weight: bold;
					text-align: center;
					}
					
					.member_wrap .cklabel input{
						position: absolute;
						left : -9999px;
					}
					.member_wrap .cklabel {
						padding-left : 0;
						padding-right : 28px;
						margin-top: 10px;
						font-size : 12px;
					}
					
					.member_wrap .cklabel.on #iconfont {
						color : #2d2e33;
					}
					
					#iconfont{
						line-height : 26px;
						margin-top: 0px;
					}
				</style>
				<div class = "con-right">
					<label for = "agreeLicensing" class = "cklabel ck_mail">
					<div class = "far fa-check-circle" id = "iconfont"></div>
						<input type = "checkbox" id = "agreeLicensing" name = "agreeLicensing" value = "T" class = "ckbox ck_mail">
						구매 이용 약관에 동의합니다.
						
					</label>
					</div>
					
					</li>
					
					<li>
						<h1><strong>개인정보처리방침안내</strong></h1>
						<div class = "con-left">
							<div class = "guide_wrap">
								<h1 class = "mgt0"><strong>1조 (목적)</strong></h1>
								<p>개인정보는 제가 모두 가져다가 팔 겁니다.</p>
							</div>
						</div>
						
						<div class = "con-right">
							<label for = agreePrivacy" class = "cklabel ck_mail">
							
							<div class = "far fa-check-circle" id = "iconfont">
							
							</div>
								<input type = "checkbox" id = "agreePrivacy" name = "agreePrivacy" value = "T" class = "ckbox ck_mail">
								개인정보 수집/이용약관에 동의합니다.
							</label>
						</div>
						
						<div class = "con-right" style = "padding-top:10px">
							<label for = "checkall" class = "cklabel ck_mail">
							
							<div class = "far fa-check-circle" id = "iconfont">
							
							</div>
							
							<input type = "checkbox" id = "checkall" class = "ckbox ck_mail">
								위의 모든 이용약관에 동의합니다.
							</label>
						</div>
					</li>
					
					</ul>
					<style>
					.regist-btn-box{
						text-align : right;
						padding-top : 20px;
						}
						
						.btn_black{
							display : inline-block;
							width : 211px;
							height : 60px;
							border : none;
							background: #2D2E33;
							color : red;
							font-size : 18px;
							line-height:58px;
							font-weight: bold;
							text-align: center;
							vertical-align: middle;
							box-sizing: border-box;
							cursor: pointer;
						
						}
						
						.btn_black:visited {
							color : white;
							text-decoration: none;
						}
						
						.btn_black > a {
							text-decoration: none;
						}
					</style>
					<div class = "regist-btn-box">
						<a href = "#" class = "btn_black">
							다음
						</a>
					</div>
					
				</div>
			
	
		
		</ul>
	

</div>
</form>

</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />