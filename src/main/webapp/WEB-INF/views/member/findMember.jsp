<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>


<style>
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 20px;
}
@media (min-width: 992px) { .container {width: 970px;} }
@media (min-width: 1200px) { .container { width: 1060px; } }

.findMember{
	width: 500px;
	
	}



</style>



<div class="container" style="width:50%; margin: 0 auto; " >

	
	<table>
	<tr>
	<th>
	<div class="findMember">
	<h3>아이디찾기</h3> <hr>
		<form name="findId" action="${pageContext.request.contextPath}/findMemberId.do" method="post">
		이메일<input type="email" name="email" id="email" class="form-control" required="required"> <br>
		<input type="submit" value="ID찾기"> <hr>
		</form>
		<input type = "text">
	</div>
	</th>
	</tr>
	<tr>
	<th>
	<div class="findMember">
	<h3>비밀번호찾기</h3> <hr>
		<form name="findPassword" action="${pageContext.request.contextPath }/findMemberPassword.do" method="post">
		아이디<input type="text" name="id" id="id" class="form-control" required="required"> <br>
		이메일<input type="email" name="email" id="email" class="form-control" required="required"><br>
		<input type="submit" value="PW찾기"> <hr> 
		</form>
	</div>
	<th>
	</tr>
	
	</table>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>