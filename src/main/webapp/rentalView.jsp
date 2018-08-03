<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style>
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 20px;
}
@media (min-width: 992px) { .container {width: 970px;} }
@media (min-width: 1200px) { .container { width: 1060px; } }

</style>

   
<div class="container">
	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">캠핑</span></p>
	<div style=" float: left; width: 50%;padding-right: 20px;">
		<img style="width:100%;" alt="텐트" src="http://www.oasekorea.com/00_ADMIN/Code/goodsimg_PIC01/AAAA00120141218008MM-1.jpg">
	</div>
	<div style=" float: left; width: 50%;padding-left: 20px;">
		<hr style="border: 1.5px solid black;margin-top: 0px;">
		<div style="margin-left:10px">
			<span style="font-size:25px;font-weight:bold">4인용 A형 텐트</span><span style="float: right;">별점 들어갈부분</span>
			<div style="font-size:20px;color:#B9062F;font-weight:bold"><span id="price">대여료 : 9000 원/24시간</span></div>
			<p style="color: #00009e;">※ 기본 24시간 대여료입니다.</p>
			<p style="color: #00009e;">※ 8시간 이하 추가 사용 시 24시간 대여료의 50%가 추가됩니다.</p>
			<hr>
			 대여기간 : <input type="text" name="datetimes" />
			<hr>
			<button class="btn btn-primary">구매</button>
			<button class="btn btn-primary">장바구니</button>
    	</div>
			
		</div>
	</div>

<script>
$(function() {
	  $('input[name="datetimes"]').daterangepicker({
	    timePicker: true,
	    startDate: moment().startOf('hour'),
	    endDate: moment().startOf('hour').add(32, 'hour'),
	    locale: {
	      format: 'M/DD hh:mm A'
	    }
	  });
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />