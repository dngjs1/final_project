<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

<div style="width:50%; margin: 0 auto;">
	<button type="button" onclick="memberUpdate()" >회원정보수정</button>
</div>
<script>
	function memberUpdate() {
		location.href ="${pageContext.request.contextPath}/memberUpdate.do"
	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>