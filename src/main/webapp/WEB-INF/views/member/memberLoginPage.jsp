<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<% response.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8");%>
<% request.setCharacterEncoding("UTF-8"); %>



<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>   
</jsp:include>

<script type='text/javascript'>
//<![CDATA[
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('b4f85f5457b55decf2c5ffdaa0103085');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      alert(JSON.stringify(authObj));
    },
    fail: function(err) {
       alert(JSON.stringify(err));
    }
  });



</script>

<style>
	.member_wrap {
		width : 580px;
		padding-top : 70px;
		margin : 0 auto;
		text-align : left;
	}
	.member_wrap .title {
		height : 100px;
		padding-bottom: 21px;
		border-bottom : 5px solid #2e2e2e;
		font-size : 30px;
		line-height : 81px;
		font-weight : bold;
	}
	
	.member_wrap .title .login_icon {
		width : 86px;
		height : 80px;
		margin-top : -2px;
		border-radius: 100%;
		background : #2D2E33;
		color : #fff;
		font-size : 30px;
		line-height: 76px;
		text-align: center;
		vertical-align: middle;
	}
	
	.member_wrap .login_input {
		margin-top : 20px;
	}
	
	.member_wrap .login_input li {
		margin-bottom: 10px;
	}
	
	.member_wrap .login_input li input.user_id {
		background: url(./resources/images/icon_login.png) no-repeat 0 0 #fff; 

	}
	.member_wrap .login_input li input[type="text"], .member_wrap .login_input li input[type="password"] {
		width : 100%;
		height : 65px;
		padding : 0 0 0 66px;
		margin : 0;
		border : 1px solid #a3a3a3;
		font-size : 15px;
		line-height: 62px;
		font-weight : bold;
		box-sizing: border-box;
	}
	
	.member_wrap .login_input li input.user_pw{
		background: url(./resources/images/icon_login_pw.png) no-repeat 0 0 #fff; 
	}
	.login_button {
		display : block;
		width : 100%;
		padding : 0;
		border : 1px solid #2d2e33;
		box-sizing: border-box;
		text-align: center;
		text-decoration: none;
		color : black;
	}
	
	.login_button span {
		display : block;
		height: 63px;
		border : 1px solid  #2d2e33;
		box-sizing: border-box;
		background : #2D2E33;
		color : #fff;
		font-size : 25px;
		line-height : 58px;
		font-weight: bold;
		text-align: center;
		text-decoration: none;
		
		
	}
	
	.a {
		text-decoration: none;
		color : #2e2e2e;
	}
	
	.member_link {
		margin-top: 22px;
		padding-bottom : 10px;
		border-bottom: 5px solid #2e2e2e;
		color: #c5c5c5;
		font-size : 15px;
		line-height: 34px;
		text-align: center; 
	}
	
	/* 회원가입  ~ 비밀번호 찾기 링크 */
	.member_link a{
		display : inline-block;
		margin : -5px 30px 0; /* 15 -> 30으로 변경 서로 간격조정 */
		vertical-align: middle;
		text-decoration: none;
		color : #2e2e2e;
		font-weight: bold;
	}
</style>


<div class = "container">
	<form name = "frm" id = "#" method="post" action = "${pageContext.request.contextPath }/memberLogin.do">
	<input type="hidden" name = "path_" id="path_" value="<c:out value="${path }"/>">
	<div class = "member_wrap">
		<h1 class = "title">
		<i class="login_icon fas fa-sign-in-alt"></i>
		로그인
		</h1>
		
		<ul class = "login_input">
		<!-- 아이디 -->
		
			<li>
				<input type = "text" class = "user_id" id = "id" name = "member_id" placeholder="아이디를 입력하세요" required>
				
			</li>
		
		<!-- 패스워드 -->
			<li>
				<input type = "password" class = "user_pw" id = "password" name = "member_pw" placeholder="비밀번호를 입력하세요" required>
			</li>
	
		<!-- 로그인 아이디 비번 맞는지 체크 -->
			<li>
			<span id = "loginCheck" style = "color:red; font-size : 17px;"></span>
			</li>
		
		</ul>
		
		<button type="submit" class="login_button" style = "text-decoration: none;" >
			<span>로그인</span>
		</button>
		
	
	
	<div class = "member_link">
	
	<a href = "${pageContext.request.contextPath }/memberEnroll2.do">회원가입</a>
	 |
		
	<a href = "${pageContext.request.contextPath }/findMember.do">아이디찾기</a>
	 |
		
	<a href = "${pageContext.request.contextPath }/findMember.do">비밀번호 찾기</a>
	</div>
	<style>
		.etc_div .kakao_login {
			padding-top : 4px;
			display : table;
			width : 98%;
			overflow: hidden;
		}
		.kkLoginBtn {
			display :table-cell;
			text-align: left;
		}
		
		.kakao_login li#kkLoginBtn a {
			display : block;
			height : 36px;
			
			background : url(./resources/images/icon-kakao.png) no-repeat 130px 10px #ffe812;
			background-size: 18px 17px;
			color : #2e2e2e;
			box-sizing: border-box;
			font-size : 18px;
			font-weight: bold;
			line-height: 36px;
			text-align: center;
			border-radius: 5px;
			margin : 0 60px;
			text-decoration: none;
		}

	</style>
	<div class = "etc_div" >
		<h6 style = "padding-top:10px;"><center><b>다른 소셜로 로그인하기</b></center></h6>
	
		<ul class = "kakao_login">
			<li id ="kkLoginBtn" style = "padding-left : 20px;">
				<a class = "kakao" href = "#">카카오 로그인</a>
			</li>
		</ul>
	</div>
	</div>
	</form>
	</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />