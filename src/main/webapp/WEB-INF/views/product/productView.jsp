<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
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

</style>
<script>
	var sell_price;
	var amount;
	$(function(){
       	init();
   	});
	function init () {
		sell_price = parseInt($('#price').text());
		amount = document.form.amount.value;
		$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(sell_price>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function add () {
		hm = document.form.amount;
		hm.value ++ ;
		var result = parseInt(hm.value) * sell_price;
		$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(result>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function del () {
		hm = document.form.amount;
		if (hm.value > 1) {
			hm.value -- ;
			var result = parseInt(hm.value) * sell_price;
			$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			if(result>=20000){
				$("#del_price").text("무료");
			}else{
				$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
			}
		}
	}
</script>

<div class="container">

	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">캠핑</span></p>
<div class="row">
	<div class="col-6">
		<img style="width:100%;" alt="텐트" src="http://www.oasekorea.com/00_ADMIN/Code/goodsimg_PIC01/AAAA00120141218008MM-1.jpg">
	</div>
	<div class="col-6">
		<hr style="border: 1.5px solid black;margin-top: 0px;">
		<div style="margin-left:10px">
			<p style="font-size:25px;font-weight:bold">4인용 A형 텐트</p>
			<p>별점 들어갈부분</p>
			<hr>
			<div style="font-size:20px;color:#B9062F;font-weight:bold"><span id="price">9000 원</span><span> 원</span></div>
			<hr>
			<p><span style="font-size:18px;color:#148CFF;"><%=strdate%></span> 도착 예정</p>
			<hr>
			<span>배송방법 : 택배</span><br>
			<span>배송비 : </span><span id="del_price" style="color:#148CFF;"></span>
			<hr>
			<form name="form" method="get">
				<span>사이즈 </span>
				<select name="size" >
	               <option value="100">100cm</option>
	               <option value="200">200cm</option>
	               <option value="300">300cm</option>
	            </select>
	            &emsp;&emsp;&emsp;
				<span>수량 </span><input type="text" name="amount" value="1" size="1" style="height:25px;" readonly/>
				<input type="button" value="+" style="width:25px;" onclick="add();"/><input type="button" value="-" style="width:25px;" onclick="del();"/>
				<hr>
				<div style="float:right;">
				<button class="btn btn-primary">구매</button>
				<button class="btn btn-primary">장바구니</button>
				</div>
			</form>
    	</div>
			
		</div>
	</div>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />