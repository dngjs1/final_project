<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>


<form action="${pageContext.request.contextPath }/updatePasswordEnd.do" method="post">

현재 비밀번호 <input type="password" > <br>
새 비밀번호 <input type="password"> <br>
새 비밀번호 확인 <input type="password"> <br>

<input type="submit" onclick="closes()" value="비밀번호 변경" >
<input type="reset" value="취소">
<button type="button" onclick="close()">test</button>


</form>

<button type="button" onclick="javascript()">test</button>

<script>
<
//버튼클릭시 javascript 호출합니다.
function javascript(){
  self.close();   //자기자신창을 닫습니다.
}
</script>


