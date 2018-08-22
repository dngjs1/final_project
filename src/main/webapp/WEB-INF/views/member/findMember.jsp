<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>


	<!-- 회원가입 시작!! -->
		<style>
		.member_wrap {
			width : 580px;
			
			margin : 0 auto;
			text-align : left;
			text-align: center;
			padding-left : 88px;
			padding-top : 20px;
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
		
		.join_btn {
				width : 450px;
				height : 40px;
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
			
			.title_ {
					height : 84px;
					padding-bottom : 21px;
					font-size: 30px;
					line-height: 79px;
					font-weight: bold;
					margin-bottom: 10px;
					
				}
				
			.id-card {
				display: inline-block;
				width : 80px;
				height : 80px;
				margin-top: -2px;
				border-radius: 100%;
				color : #fff;
				background : #2d2e33;
				line-height: 76px;
				vertical-align: middle;
				text-align: center;
				margin-bottom: 5px;
			}
			
			.psw_card {
				display: inline-block;
				width : 80px;
				height : 80px;
				margin-top: -2px;
				border-radius: 100%;
				color : #fff;
				background : #2d2e33;
				line-height: 76px;
				vertical-align: middle;
				text-align: center;
				margin-bottom: 5px;
			}
			
		</style>



<div class="container" >

	<div class = "member_wrap">
	<table>
	<tr>
	<th>
	<div class="findMember">
	<h2 class="title_"><i class="id-card fas fa-id-card-alt"></i>&nbsp;아이디찾기</h2>
		<form name="findId" action="${pageContext.request.contextPath}/findMemberId.do" method="post">
		
			<li>
				<input type = "email" id = "email" name = "email" class = "text" placeholder="*이메일 입력 (ex : abc@naver.com)" style = "width : 450px; height:50px;  border:solid gray;"  value="${memberLoggedIn.email }" required>
				<span style = "color : #777777;font-size:15px; margin-left:14px;">
				
				
			</li>
		
		<input type="submit" value="아이디 찾기" class="join_btn"> <br><br>
		<p class="viewID" id="viewID" style="text-align: center;" > <c:out value="${id}"></c:out> </p>
		
		<hr>
		</form>
	</div>
	</th>
	
	<br>
	
	</tr>
	<tr>
	<th>
	<div class="findMember">
	<h2 class="title_"><i class="psw_card fas fa-unlock-alt"></i>&nbsp;비밀번호찾기</h2>
		<form name="findPassword" action="${pageContext.request.contextPath }/findMemberPassword.do" method="post">
		<li>
		<input type="text" name="id" id="id" class="text" placeholder="*아이디 입력" style = "width : 450px; height:50px;  border:solid gray;"required="required"> <br>
		</li>
		<p class="example"/>
		<li>
		<input type = "email" id = "email" name = "email" class = "text" placeholder="*이메일 입력 (ex : abc@naver.com)" style = "width : 450px; height:50px;  border:solid gray;"  value="${memberLoggedIn.email }" required>
		<span style = "color : #777777;font-size:15px; margin-left:14px;">
		<p class = "example" style="font-size:13px; color: black;">이메일로 임시비밀번호를 발급해드립니다.</p>
		</li>
		<input type="submit" value="비밀번호 찾기" class="join_btn"> <hr> 
		</form>
		
	</div>
	</th>
	</tr>
	
	</table>
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>