<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<% response.setCharacterEncoding("UTF-8"); %>
<% request.setCharacterEncoding("UTF-8"); %>

<style>
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 20px;
}
@media (min-width: 992px) { .container {width: 970px;} }
@media (min-width: 1200px) { .container { width: 1060px; } }

</style>


<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>   
</jsp:include>


<div class="container"  >
 	
 	<div style="width:50%; margin: 0 auto; " >
 		<hr>
 		<h3>회원가입</h3>
 		<hr>
       <form name="memberEnrollFrm" action="${pageContext.request.contextPath}/memberEnrollEnd.do" method="post"   >
          <table>
             <tr>
                <th>아이디</th>
                <td>
                   <div id="userId-container">
                   <input type="text" class="form-control" placeholder="4글자이상" name="member_id" id="member_id" required>
                   <span class="guide ok">이 아이디는 사용 가능 합니다.</span>
                   <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
                   <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value=0/>
                   </div>
                </td>
             </tr>
             <tr>
                <th>패스워드</th>
                <td>
                   <input type="password" class="form-control" name="member_pw" id="member_pw" required>
                </td>
             </tr>
             <tr>
                <th>패스워드확인</th>
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
             		<th>우편번호</th>
             		<td>
             			<input type="text" name="post_no" id="post_no">
          		</td>
             </tr>
              <tr>
             		<th>주소</th>
             		<td>
             			<input type="text" name="address" id="address">
          		</td>
             </tr>
             <tr>
             		<th>상세주소</th>
             		<td>
             			<input type="text" name="detail_address" id="detail_address">
          		</td>
             </tr>
             <tr>
                <th>이메일</th>
                <td>   
                   <input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email">
                </td>
             </tr>
			<tr>
				<th>이메일 수신여부</th>
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


<jsp:include page="/WEB-INF/views/common/footer.jsp" />