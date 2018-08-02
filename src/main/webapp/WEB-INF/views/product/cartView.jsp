<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="pageTitle"/>
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
.cart{
	padding-left:50px;
	padding-right:50px;
}
.tr1 th{text-align:center;}
.tr2 td{vertical-align:middle;text-align:center;}
.font-price{font-weight:bold;font-size:20px;}
</style>
<script>
	var sell_price;
	var amount;
	$(function(){
       	init();
       	
       	$("#check_all").change(function(){
    		if($("#check_all").is(":checked")){
    			$("input[name=check]").prop("checked", true);
    		}else{
    			$("input[name=check]").prop("checked", false);
    		}
    	});
   	});
	function init () {
		sell_price = parseInt($('#price').text());
		amount = document.form.amount.value;
		var result = parseInt(amount) * sell_price;
		$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#sum_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	function add () {
		hm = document.form.amount;
		hm.value ++ ;
		var result = parseInt(hm.value) * sell_price;
		$("#sum_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	function del () {
		hm = document.form.amount;
		if (hm.value > 1) {
			hm.value -- ;
			var result = parseInt(hm.value) * sell_price;
			$("#sum_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		}
	}
</script>
<div class="container cart">
	<h3>장바구니</h3>
	<hr style="border:2px solid #787878">
	<p>상품목록</p>
	<table class="table" style="font-size:13px;" >
		<tr class="tr1">
			<th><label><input type="checkbox" id="check_all" checked/> 전체선택</label></th>
			<th style="text-align: center">상품정보</th>
			<th>상품금액</th>
			<th>수량</th>
			<th>총금액</th>
		</tr>
		<%-- <c:if test="${not empty list }">
			<c:forEach var='board' items='${list }' varStatus="vs"> --%>
		<tr class="tr2">
			<td scope="col"><input type="checkbox" name="check" checked/></td>
			<td scope="col">
				<div style="float: left;width:80px"><img style="width:100%;" src="http://gdimg.gmarket.co.kr/971257748/still/600?ver=1526001424"> </div>
				<div style="float: left;text-align:left;margin-left:15px;">
					<span>상품명이 들어갈 부분</span><br>
					<span>(사이즈가 들어갈 부분)</span><br>
					<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>					
				</div>
			</td>
			<td scope="col"><span id="price" style="font-size:16px">9000</span><span> 원</span></td>
			<td scope="col">
				<form name="form">
				<input type="button" value="-" style="width:25px;font-weight:bold" onclick="del();"/>
				<input type="text" name="amount" value="1" size="1" style="height:25px;" readonly/>
				<input type="button" value="+" style="width:25px;font-weight:bold" onclick="add();"/>
				<input type="button" class="btn btn-default btn-sm" style="vertical-align:baseline" value="수정"/>
				</form>
			</td>
			<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;"><span id="sum_price"></span><span> 원</span></td>
			
		</tr>
			<%-- </c:forEach>
		</c:if> --%>
	</table>
	<hr>
	<div style="width:100%;border:2px solid #DDDDDD;padding:15px;text-align:center;font-size:15px;">
		<span>총 상품가격 </span><span class="font-price">7500</span><span> 원</span><span> + </span>
		<span>배송비 </span><span class="font-price">2500</span><span> 원</span><span> = </span>
		<span>총 주문금액 </span><span class="font-price" style="font-size:22px;color:red">10000</span><span> 원</span>
	</div>
	<br>
	<div style="text-align:center">
		<button class="btn btn-default">선택삭제</button>
		<button class="btn btn-default">구매하기</button>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />