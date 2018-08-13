<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>	
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
</script>-->

 
 
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


<!-- <style>
	table{
    	 border-collapse: collapse;
	}
	#box {
		 border: 1px solid black;
	}
	
</style> -->




<div style="width:50%; margin: 0 auto;">
	<form name="memberEnrollFrm" action="memberUpdateEnd.do" method="post" onsubmit="return validate();" >
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="form-control" name="member_id" id="member_id"  value="${memberLoggedIn.member_id }" style="width:500px;" readonly/>
				</td>
			</tr>
			
			<tr id="box">
				<th>현재 비밀번호</th>
				<td>
					<input type="password" class="form-control" name="original_password" id="original_password" >
				</td>
			</tr>
			<tr id="box">
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" class="form-control" name="member_pw" id="password" >
				</td>
			</tr>
			<tr id="box">
				<th>비밀번호 확인</th>
				<td>	
					<input type="password" class="form-control" id="password2" >
				</td>
			</tr>  
			<tr>
				<th></th>
				<td ><span style="color:orange;  font-size:12px; "> 비밀번호 변경시에만 입력하세요.</span></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>	
				<input type="text" class="form-control" name="member_name" id="member_name" value="${memberLoggedIn.member_name }" required>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>	
				<input type="calendar" class="form-control" name="birthday" id="birthday"  value="${memberLoggedIn.birthday }">
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" class="form-control" name="email" id="email"  value="${memberLoggedIn.email }">
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" class="form-control" name="phone" id="phone" maxlength="11"  value="${memberLoggedIn.phone }" required>
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
				<th>우편번호</th>
				<td>	
					<input type="text" class="form-control" name="post_no" id="post_no"  value="${memberLoggedIn.post_no }">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" class="form-control" name="address" id="roadAddress"  value="${memberLoggedIn.address }">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>	
					<input type="text" class="form-control" name="detail_address" id="detail_address"  value="${memberLoggedIn.detail_address }">
				</td>
			</tr>
			<tr>
               <th>성별 </th>
               <td>
                  <div >
                     <input type="radio"  name="gender" id="gender0" value="M" ${memberLoggedIn.gender=='M'?"checked":"" }>
                     <label for="gender0">남</label>
                     <input type="radio"  name="gender" id="gender1" value="F" ${memberLoggedIn.gender=='F'?"checked":"" }>
                     <label for="gender1">여</label>
                  </div>
               </td>
            </tr>
            <tr>
               <th>이메일 수신</th>
               <td>
                  <div >
                     <input type="checkbox"  name="email_alarm" id="email_alarm" value="Y" ${memberLoggedIn.email_alarm=='Y'?"checked":"" }>    
                  </div>
               </td>
            </tr>
		</table>
		<input type="submit" value="회원정보수정" >
		<input type="reset" value="취소">
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>