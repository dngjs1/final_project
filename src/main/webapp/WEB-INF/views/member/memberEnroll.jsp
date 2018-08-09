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

<style>

/*중복아이디체크관련*/
    div#userId-container{position:relative; padding:0px;}
    div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#userId-container span.ok{color:green;}
    div#userId-container span.error{color:red;}

</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post_no').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>


<%-- <script>
	function eamilAuth() {

		 var emailch=$("#email").val();
		 var url="<%=request.getContextPath()%>/emailAuth.do";
		 var title="emailAuth";
		 var status="left=500px,top=100px,width=600px,height=200px";
		 var popup=window.open(url,title,status);
	}
</script> --%>


<script>
$(function(){
    $('#member_id').on('keyup',function(){
    	
    	console.log($(this).val());
    
       if($(this).val().trim().length<4){
          $('.guide').hide();
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
                $('.guide.error').hide();
                $('.guide.ok').show();
                $('#idDuplicateCheck').val(1);
             }else{
                $('.guide.ok').hide();
                $('.guide.error').show();
                $('#idDuplicateCheck').val(1);
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

<script>
	
	function check() {
		
		alert("test");
		
		if($('#member_id').trim().val().length<4){
			alert("아이디는 최소 4자리이상이어야 합니다.");
			$('#member_id').focus();
			return false;
		}
	}

</script>


<!-- <script>

$(function(){
    // 회원 가입 처리
     var flag=true;
     $('#member_id').keyup(function(){
          $.ajax({
             url:"${pageContext.request.contextPath}/checkIdDuplicate.do",
             data:{"member_id":$(this).val()},
             type:'post',
             success:function(data){
                var member_id = $("#member_id").val();
                var leng = $("#member_id").val().length;
                if(data.trim()=='true' && chkValId(member_id)){
                   $('#idcheck').html("사용 가능한 ID입니다");
                   $('#idcheck').css('color','blue');
                   flag=true;
                }else if(data.trim()!='true'){
                   $('#idcheck').html("중복된 아이디입니다");
                   $('#idcheck').css('color','red');
                   flag=false;
                }else if(!chkValId(member_id)) {
                   $('#idcheck').html("ID는 오직 영문과 숫자, _ 기호만 입력 가능합니다");
                   $('#idcheck').css('color','red');
                   flag=false;
                }
                if(leng<6) {
                   $('#idcheck').html("최소 6자 이상 입력해주세요");
                   $('#idcheck').css('color','red');
                   flag=false;
                }
             }
          
          });
       });

</script> -->





<div class="container"  >
 	
 	<div style="width:50%; margin: 0 auto; " >
 		<hr>
 		<h3>회원가입</h3>
 		<hr>
       <form name="memberEnrollFrm"  action="${pageContext.request.contextPath}/memberEnrollEnd.do" method="post" onsubmit='return validate();'   >
          <table>
             <tr>
                <th>아이디</th>
                <td>
                   <div id="userId-container">
                   <input type="text" class="form-control" placeholder="4글자이상" name="member_id" id="member_id" style="width:500px;" required>
                   <span class="guide ok">이 아이디는 사용 가능 합니다.</span>
                   <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
                   <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value=0 />
                   </div>
                </td>
             </tr>
             <tr>
                <th>비밀번호</th>
                <td>
                   <input type="password" class="form-control" name="member_pw" id="member_pw" required>
                </td>
             </tr>
             <tr>
                <th>비밀번호 확인</th>
                <td>   
                   <input type="password" class="form-control" id="member_pw2" required>
                </td>
             </tr>  
             <tr>
                <th>이름</th>
                <td>   
                <input type="text" class="form-control" name="member_name" id="member_name" required>
                </td>
             </tr>
             <tr>
                <th>생년월일</th>
                <td>   
                <input type="date" class="form-control" name="birthday" id="birthday">
                </td>
             </tr> 
             <tr>
                <th>성별 </th>
                <td>
                   <div>
                      <input type="radio" name="gender" id="gender0" value="M" checked>
                      <label for="gender0">남</label>
                      <input type="radio" name="gender" id="gender1" value="F">
                      <label for="gender1">여</label>
                   </div>
                </td>
             </tr>
             <tr>
                <th>휴대폰</th>
                <td>   
                   <input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
                </td>
             </tr>
             <tr>
             	<th></th>
             	<td>
             	</td>
             </tr>
             <tr>
             		<th> </th>
             		<td>
             			<input type="button" onclick="DaumPostcode()" value="주소찾기"><br>
             			<!-- <input type="text" class="form-control" name="post_no" id="post_no">  -->
          		</td>
             </tr>
             <tr>
             	<th>우편번호<th>
             	<input type="text" class="form-control" name="post_no" id="post_no"> 
             </tr>
              <tr>
             		<th>주소</th>
             		<td>
             			<input type="text" class="form-control" name="address" id="roadAddress">
          		</td>
             </tr>
             <tr>
             		<th>상세주소</th>
             		<td>
             			<input type="text"  class="form-control" name="detail_address" id="detail_address">
          		</td>
             </tr>
             <tr>
                <th>이메일</th>
                <td>   
                   <input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email"> 
                </td>
             </tr>
			<tr>
				<th>이메일 수신</th>
				<td>
				<input type="checkbox" name="email_alarm" id="email_alram" value="Y" ><label for="email_alram" ></label>
				</td>
			</tr> 

	          </table>
	          <hr>
	          <input type="submit" value="가입" >
	          <input type="reset" value="취소">
	       </form>
	    </div>

</div>

<script>
$(function(){
	
	$("#member_pw2").blur(function(){
		var p1=$("#member_pw").val(), p2=$("#member_pw2").val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#member_pw").focus();
		}
	});
	
});

/*  $(function() {
	
	$("#member_id").blur(function(){
		var id=$("#member_id").val();
		if(id.trim().length<4){
			alert("아이디는 최소 4자리이상이어야 합니다.");
			id.focus();
			return false;
			
		}
		
	});
	
});  */

 function validate(){
	var userId = $("#member_id");
	if(userId.val().trim().length<4){
		alert("아이디는 최소 4자리이상이어야 합니다.");
		userId.focus();
		return false;
	}
	
	return true;
} 

</script>

<!-- 

@@ -0,0 +1,424 @@
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

 -->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />