<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="구매" name="pageTitle"/>
</jsp:include>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<% 
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 3);
	SimpleDateFormat simpleDate = new SimpleDateFormat("MM/dd E요일");
	String strdate = simpleDate.format(cal.getTime());
%>
<style>
.tr1 th{text-align:center;background-color:#E1F6FA}
.tr2 td{vertical-align:middle;text-align:center;}
.font-price{font-weight:bold;font-size:20px;}
.tb-basic tr td:first-child{border-left:none;width:130px;background-color:#E1F6FA}
.tb-basic tr td:last-child{border-right:none;}
</style>
<script>
	var sell_price;
	var amount;
	$(function(){
		var IMP = window.IMP;
		IMP.init('imp29686371');
       	init();
   	});
	function init () {
		sell_price = parseInt($('#price').text());
		amount = $("#amount").html();
		var result = parseInt(amount) * sell_price;
		$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#sum_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
</script>
<div class="container">
	<h3>주문/결제</h3>
	<hr style="border:2px solid #787878"><br>
	<h5>구매자 정보</h5>
	<table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">
		<tr>
			<td>이름</td>
			<td>김우헌</td>
		<tr>
		<tr>
			<td>이메일</td>
			<td>dngjs1@naver.com</td>
		<tr>
		<tr>
			<td>연락처</td>
			<td>010-9779-0172</td>
		<tr>
	</table>
	<br>
	<h5>받는사람 정보</h5>
	<table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">
		<tr>
			<td>이름</td>
			<td><input type="text" value="백종훈" /></td>
		<tr>
		<tr>
			<td>배송주소</td>
			<td>주소 api로!</td>
		<tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" value="010-2132-8651" /></td>
		<tr>
		<tr>
			<td>배송 요청사항</td>
			<td><input type="text" value="부재시 경비실에 맡겨주세요" size="50"/></td>
		<tr>
	</table>
	<h5>상품 정보</h5>
	<table class="table table-bordered" style="font-size:13px;">
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">상품정보</th>
			<th>수량</th>
			<th>상품금액</th>
			<th style="border-right:none;">총 상품금액</th>
		</tr>
		<%-- <c:if test="${not empty list }">
			<c:forEach var='board' items='${list }' varStatus="vs"> --%>
		<tr class="tr2">
			<td scope="col" style="border-left:none;">
				<div style="float: left;width:80px"><img style="width:100%;" src="http://gdimg.gmarket.co.kr/971257748/still/600?ver=1526001424"> </div>
				<div style="float: left;text-align:left;margin-left:15px;">
					<span>상품명이 들어갈 부분</span><br>
					<span>(사이즈가 들어갈 부분)</span><br>
					<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>
				</div>
			</td>
			<td scope="col"><span id="amount" style="font-size:15px;font-weight:bold">2</span></td>
			<td scope="col"><span id="price" style="font-size:16px">9000</span><span> 원</span></td>
			<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;border-right:none;"><span id="sum_price"></span><span> 원</span></td>	
		</tr>
	</table>
	<br>
	<h5>결제 정보</h5>
	<table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">
		<tr>
			<td>총 상품가격</td>
			<td>스크립트로 계산해서 뿌려주기</td>
		<tr>
		<tr>
			<td>포인트</td>
			<td>
				<input type="text" value="0" size="10"/><span> 점</span>&emsp;&emsp;
				<span>적용가능 포인트 : 1000점</span>
				
			</td>
		<tr>
		<tr>
			<td>배송비</td>
			<td>2500</td>
		<tr>
		<tr>
			<td>총 결재금액</td>
			<td>상품 - 포인트 + 배송비</td>
		<tr>
		<tr>
			<td>결제방법</td>
			<td></td>
		<tr>
	</table>
	<br>
	<div style="text-align:center;">
	<button id="pay" class="btn btn-primary" style="width: 150px;height:50px;">결제하기</button>
	</div>
	<hr style="border:2px solid #787878">
</div>
<script>
$(function(){
	$('#pay').click(function(){
		IMP.request_pay({
		    pg : 'nice',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 10,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'http://localhost:9191/shop/buyForm'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />