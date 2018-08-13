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

<!-- /*중복아이디체크관련* -->/
 <style> 
   #ok{color:green;
   		display:none;
   		}
   #error{color:red;
   		display:none;
   		}

</style> 

<!-- 주소입력 API  -->
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


<!-- ID 중복검사 Ajax -->
<script>
$(function(){
    $('#member_id').on('keyup',function(){
    	
    	console.log($(this).val());
    
       if($(this).val().trim().length<4){
          $('#ok').hide();
          $('#error').hide();
          $('#length').show();
          $('#idDuplicateCheck').val(0);
          return;
       }
        
       $.ajax({
          url:"${pageContext.request.contextPath}/checkIdDuplicate.do",
          type   : "post",
          dataType: "json",
          data:{member_Id:$(this).val()},
          success:function(data){
          	
        	/* if(data.trim()=='true') */  
          if(data.check==true){
                $('#error').hide();
                $('#ok').show();
                $('#length').hide();
                $('#idDuplicateCheck').val(1);
             }else{
                $('#ok').hide();
                $('#error').show();
                $('#length').hide();
                $('#idDuplicateCheck').val(0);
             }
        
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

</script>




<!-- 유효성검사  -->
<script>
$(function(){
	
	$("#member_pw2").blur(function(){
		var p1=$("#member_pw").val(), p2=$("#member_pw2").val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#member_pw").val("");
			$("#member_pw2").val("");
			$("#member_pw").focus();
		}
	});
	
});

 function validate(){
	var userId = $("#member_id");
	if(userId.val().trim().length<4){
		alert("아이디는 최소 4자리이상이어야 합니다.");
		userId.focus();
		return false;
	}
	
	var idCheck = $("#idDuplicateCheck");
	if($("#idDuplicateCheck").val()==0) {
		alert("잘못된 아이디입니다 다시 입력하세요.")
		$("#idDuplicateCheck").focus();
		return false;
	}
	
	return true;
} 

</script>



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
		<form name = "frm" method="post" enctype = "multipart/form-data" onsubmit='return validate();' action="${pageContext.request.contextPath}/memberEnrollEnd.do" >
			<ul class = "join_list">
			<!-- 4글자 이상 입력 -->
			<li>
				<input type = "text" id = "member_id" name = "member_id" class = "text" placeholder="*아이디 입력" style = "ime-mode:disabled; width:100%;" tabindex = "1" required>
				<p class="example" id="ok">이 아이디는 사용 가능 합니다.</p>
                <p class="example" id="error">이 아이디는 사용할 수 없습니다.</p>
                <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value=0 />
				<p class = "example" id = "length">4글자 이상을 입력하세요</p>
			</li>
			<!-- 이름 입력 -->
			<li>
				<input type = "text" id = "member_name" name ="member_name" class = "text" placeholder="*이름 입력" style = " width:100%;" tabindex = "2" required>
				<p class = "example" id = "#">한글로만 작성해주세요</p>
			</li>
			<!-- 비밀번호 입력 -->
			<li>
				<input type = "password" id = "member_pw" name = "member_pw" class = "text" placeholder="*비밀번호 입력" style = " width:100%;" tabindex = "3" required>
				<p class = "example" id = "rePassResult2">8 ~ 12 영문과 숫자(또는 한글 숫자)조합</p>
			</li>
			<!-- 비밀번호 확인 -->
			<li>
				<input type="password" id="member_pw2"  class = "text" placeholder="*비밀번호 확인 " tabindex="4" style="width:100%;" onkeyup="passwordCheck(this)" required>
				<p class = "example" id = "rePassResult">
				</p>
			</li>
			<!-- 생년월일 선택 -->
			<li>
				<input type = "date" id = "birthday" name = "birthday" class = "text" placeholder="*생년월일 입력" style = " width:100%;" tabindex = "5" required>
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
				<input type = "text" id = "phone" name = "phone" class = "text" placeholder="*휴대폰번호입력" style = " width:100%;" tabindex = "5" required>
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
				<input type = "text" id = "roadAddress" name = "address" class = "text" placeholder="*주소" style = "width : 450px;" required>
				<input type = "button" value = "주소찾기" class = "btn_check" style = "border:none;" onclick="DaumPostcode()">
				<p class = "example" id = "#">주소찾기버튼으로 쉽게 찾아보세요</p>
			</li>
			
			<li>
				<input type = "text" id = "detail_address" name = "detail_address" class = "text" placeholder="*상세주소입력" style = " width:100%;" tabindex = "5" required>
				<p class = "example" id = "#">주소찾기 버튼으로 주소를 찾은 후 나머지 주소를 입력해주세요</p>
			</li>
			
			<li>
				<input type = "text" id = "post_no" name = "post_no" class = "text" placeholder="*우편번호입력" style = " width:100%;" tabindex = "5" required>
				<p class = "example" id = "#">우편번호는 주소찾기 버튼을 활용할 시 자동으로 채워집니다.</p>
			</li>
			
			<li>
				<input type = "email" id = "email" name = "email" class = "text" placeholder="*이메일 입력 (ex : abc@naver.com)" style = "width : 450px;" required>
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