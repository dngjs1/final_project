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
<c:set var="path" value="${pageContext.request.contextPath }"/>
<% 
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
	cal.add(Calendar.DATE, 3);
	SimpleDateFormat simpleDate = new SimpleDateFormat("MM/dd E요일");
	String strdate = simpleDate.format(cal.getTime());
%>
<style>
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 20px;
}
@media (min-width: 992px) { .container {width: 970px;} }
@media (min-width: 1200px) { .container { width: 1060px; } }
.tr1 th{text-align:center;}
.tr2 td{vertical-align:middle;text-align:center;}
.font-price{font-weight:bold;font-size:20px;}
.tb-basic tr td:first-child{border-left:none;width:130px;background-color:#E1F6FA}
.tb-basic tr td:last-child{border-right:none;}
</style>
<script>
	var sell_price;
	var amount;
	$(function(){
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
			<td class="border-info">이름</td>
			<td class="border-info">김우헌 천재</td>
		<tr>
		<tr>
			<td class="border-info">이메일</td>
			<td class="border-info">dngjs1@naver.com</td>
		<tr>
		<tr>
			<td class="border-info">휴대폰 번호</td>
			<td class="border-info">010-9779-0172</td>
		<tr>
	</table>
	<h5>받는사람 정보</h5>
	
	<h5>상품 정보</h5>
	<table class="table table-bordered" style="font-size:13px;">
		<tr class="tr1">
			<th style="text-align: center">상품정보</th>
			<th>수량</th>
			<th>상품금액</th>
			<th>총 상품금액</th>
		</tr>
		<%-- <c:if test="${not empty list }">
			<c:forEach var='board' items='${list }' varStatus="vs"> --%>
		<tr class="tr2">
			<td scope="col">
				<div style="float: left;width:80px"><img style="width:100%;" src="http://gdimg.gmarket.co.kr/971257748/still/600?ver=1526001424"> </div>
				<div style="float: left;text-align:left;margin-left:15px;">
					<span>상품명이 들어갈 부분</span><br>
					<span>(사이즈가 들어갈 부분)</span><br>
					<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>
				</div>
			</td>
			<td scope="col"><span id="amount" style="font-size:15px;font-weight:bold">2</span></td>
			<td scope="col"><span id="price" style="font-size:16px">9000</span><span> 원</span></td>
			<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;"><span id="sum_price"></span><span> 원</span></td>	
		</tr>
	</table>
	<br>
	<h5>결제 정보</h5>
	<table class="table table-bordered" style="font-size:13px;">
	</table>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />