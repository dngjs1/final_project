<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

메일주소와 비밀번호를 입력해주세요. <br>

<form action="${pageContext.request.contextPath }/membershipWithdrawEnd.do" />
메일주소 : <input type="email" name="email" required/> <br>
비밀번호 : <input type="password" name="pw" required/> <br>
<input type="submit" value="삭제"/>

</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>