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

<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
</script> -->

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





<jsp:include page="/WEB-INF/views/common/footer.jsp" />