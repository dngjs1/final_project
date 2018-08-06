<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

<style>
		
	
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



<div style="width:50%; margin: 0 auto; " >
	<form name="memberEnrollFrm" action="memberUpdateEnd.do" method="post" onsubmit="return fn_enroll_validate();" >
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="form-control" name="member_id" id="member_id"   style="width:400px;" value="${memberLoggedIn.member_id }" readonly/>
				</td>
			</tr>
<!-- 			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" class="form-control" name="password" id="password_" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>	
					<input type="password" class="form-control" id="password2" required>
				</td>
			</tr>  --> 
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
             	<th>우편번호<th>
             	<input type="text" class="form-control" name="post_no" id="post_no" value="${memberLoggedIn.post_no }"> 
             </tr>
              <tr>
             		<th>주소</th>
             		<td>
             			<input type="text" class="form-control" name="address" id="roadAddress" value="${memberLoggedIn.address }">
          		</td>
             </tr>
             <tr>
             		<th>상세주소</th>
             		<td>
             			<input type="text"  class="form-control" name="detail_address" id="detail_address" value=${memberLoggedIn.detail_address }>
          		</td>
             </tr>
			<tr>
               <th>성별 </th>
               <td>
                  <div>
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
		<button type="button" onclick="updatePassword()">비밀번호 변경</button>
		<input type="reset" value="취소">
	</form>
</div>

<script>

function updatePassword(){
	
	window.open("${pageContext.request.contextPath}/updatePassword.do"
				,"UPDATE PASSOWRD"
				, "width=500 height=500")

};

$(function(){
	
	$("#password2").blur(function(){
		var p1=$("#password_").val(), p2=$("#password2").val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#password_").focus();
		}
	});
	
});

function validate(){
	var userId = $("#userId_");
	if(userId.val().trim().length<4){
		alert("아이디는 최소 4자리이상이어야 합니다.");
		userId.focus();
		return false;
	}
	
	return true;
}
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>