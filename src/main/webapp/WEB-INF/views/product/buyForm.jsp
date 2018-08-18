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
		if($("#cart_quantity").html()!=null){
			sell_price = parseInt($('#price').text());
			cart_quantity = $("#cart_quantity").html();
			var result = parseInt(cart_quantity) * sell_price;
			$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("#sum_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("#sum_total_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			
			if(result>=20000){
				$("#deli").text("무료");
				$("#last_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}else{
				var last_price=result+2500;
				$("#last_price").text(last_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}
		}else{
			var sum=0;
			for(var i=1;i<=$('.cartLength').val();i++){
				var sell_price = parseInt($('.price'+i).html());
				var amount = $('.cart_quantity'+i).html();
				var result = parseInt(amount) * sell_price;
				$(".price"+i).text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$(".sum_price"+i).text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				sum=sum+result;
			}
			$('#sum_total_price').html(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			if(sum>=20000){
				$("#deli").text("무료");
				$("#last_price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}else{
				var last_price=sum+2500;
				$("#last_price").text(last_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}
		}
	}
	
	function chk_validate(){
		if( parseInt($('#use_point').val()) > parseInt($('#curr_point').text())){
    		alert("포인트가 부족합니다.");
    		return false;
    	}
		if($('#use_point').val()==""){
			alert("포인트를 입력해주세요.");
			return false;
		}
		return true;
	}
	$(function(){
		$("#point_chk").change(function(){
	        var last_price=parseInt($("#last_price").text().replace(",",""));
	        if($("#point_chk").prop("checked")){
		        	last_price=last_price-parseInt($('#use_point').val());
		        	$("#last_price").text(last_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		        	$('#use_point').attr("readonly",true);
	        }else{
	        	last_price=last_price+parseInt($('#use_point').val());
	        	$("#last_price").text(last_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	        	$('#use_point').attr("readonly",false);
	        }
	    });
	});
	
</script>
<!-- 주소입력 API  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post_no').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detail_address').focus();
            }
        }).open();
    }
</script>
<div class="container">
	<h3>주문/결제</h3>
	<hr style="border:2px solid #787878"><br>
	<h5>구매자 정보</h5>
<form id="frm">
	<table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">
		<tr>
			<td>이름</td>
			<td>${memberLoggedIn.member_name }<input type="hidden" name="member_id" value="${memberLoggedIn.member_id }"/></td>
		<tr>
		<tr>
			<td>이메일</td>
			<td>${memberLoggedIn.email }</td>
		<tr>
		<tr>
			<td>연락처</td>
			<td>${memberLoggedIn.phone }</td>
		<tr>
	</table>
	<br>
	<h5>받는사람 정보</h5>
	<table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">
		<tr>
			<td>이름</td>
			<td><input type="text" name="receiver_name" value="${memberLoggedIn.member_name }" /></td>
		<tr>
		<tr>
			<td>배송주소</td>
			<td>
				<div>
					<input type = "text" id = "roadAddress" name = "receiver_address" class = "text" value="${memberLoggedIn.address}" style = "width : 300px;" required>
					<input type = "text" id = "post_no" name = "receiver_post_no" class = "text" value="${memberLoggedIn.post_no}" tabindex = "5" required>
					<input type = "button" value = "주소찾기" class = "btn_check" style = "border:none;" onclick="DaumPostcode()">
				</div>
				<div>
					<br>
					<span>상세주소 : </span>
					<input type = "text" id = "detail_address" name = "receiver_d_address" class = "text"  value="${memberLoggedIn.detail_address}" style = " width:440px;" tabindex = "5" required>
				</div>
			</td>
		<tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="phone2" value="${memberLoggedIn.phone }" /></td>
		<tr>
		<tr>
			<td>배송 요청사항</td>
			<td><input type="text" name="request" value="부재시 경비실에 맡겨주세요" size="50"/></td>
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
		
		<c:if test="${not empty cartList}">
			<c:forEach var='cart' items='${cartList }' varStatus="vs">
				<tr class="tr2">
					<td scope="col" style="border-left:none;">
						<div style="float: left;width:80px"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${cart.NEW_P_IMG_PATH }"> </div>
						<div style="float: left;text-align:left;margin-left:15px;">
							<input type="hidden" name="product_option_code1" value="${cart.PRODUCT_OPTION_CODE}"/>
							<input type="hidden" name="buy_quantity1" value="${cart.CART_QUANTITY}"/>
							<span>${cart.PRODUCT_NAME}</span><br>
							<c:if test="${cart.OPTION_SIZE!=null}">
								<span>(${cart.OPTION_SIZE})</span><br>
							</c:if>
							<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>
						</div>
					</td>
					<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
					<input type="hidden" class="cartLength" value="${fn:length(cartList)}"/>
					<td scope="col"><span class="cart_quantity${vs.count}" style="font-size:15px;font-weight:bold">${cart.CART_QUANTITY}</span></td>
					<td scope="col"><span class="price${vs.count}" style="font-size:16px">${cart.PRICE}</span><span> 원</span></td>
					<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;border-right:none;"><span class="sum_price${vs.count}"></span><span> 원</span></td>	
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty cartList }">
			<tr class="tr2">
				<td scope="col" style="border-left:none;">
					<div style="float: left;width:80px"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${productJoinOption.new_p_img_path }"> </div>
					<div style="float: left;text-align:left;margin-left:15px;">
						<span>${productJoinOption.product_name}</span><br>
						<span>(${productJoinOption.option_size })</span><br>
						<span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>
					</div>
					<input type="hidden" name="product_option_code1" value="${productJoinOption.product_option_code}"/>
					<input type="hidden" name="buy_quantity1" value="${cart_quantity}"/>
				</td>
				<td scope="col"><span id="cart_quantity" style="font-size:15px;font-weight:bold">${cart_quantity }</span></td>
				<td scope="col"><span id="price" style="font-size:16px">${productJoinOption.price}</span><span> 원</span></td>
				<td scope="col" style="width: 100px;font-size:16px;color:#B9062F;border-right:none;"><span id="sum_price"></span><span> 원</span></td>	
			</tr>
		</c:if>
	</table>
	<br>
	<h5>결제 정보</h5>
	<table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">
		<tr>
			<td>총 상품가격</td>
			<td><span id="sum_total_price"></span><span> 원</span></td>
		<tr>
		<tr>
			<td>포인트</td>
			<td>
				<label><input type="checkbox" id="point_chk" style="vertical-align:middle;" onclick="return chk_validate();"/> 사용</label>&emsp;
				<input type="number" id="use_point" value="0" max="1000" style="width:80px"/><span> 점</span>&emsp;&emsp;
				<span style="color:#3296FF">적용가능 포인트 : <span id="curr_point">1000</span>점</span>
			</td>
		<tr>
		<tr>
			<td>배송비</td>
			<td><span id="deli">2,500</span></td>
		<tr>
		<tr>
			<td>총 결재금액</td>
			<td><span id="last_price"></span><span> 원</span></td>
		<tr>
		<tr>
			<td>결제방법</td>
			<td></td>
		<tr>
	</table>
	<br>
	<div style="text-align:center;">
	<button id="pay" type="button" class="btn btn-primary" style="width: 150px;height:50px;">결제하기</button>
	</div>
	<hr style="border:2px solid #787878">
</form>
</div>
<script>
$(function(){
	$('#pay').click(function(){
		IMP.request_pay({
		    pg : 'nice',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${memberLoggedIn.member_name }',
		    amount : parseInt($('#last_price').html().replace(",","")),
		    buyer_email : '${memberLoggedIn.email }',
		    buyer_name : '${memberLoggedIn.member_name }',
		    buyer_tel : '${memberLoggedIn.phone }',
		    buyer_addr : '${memberLoggedIn.address}',
		    buyer_postcode : '${memberLoggedIn.post_no }',
		}, function(rsp) {
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		    	var frm=$("#frm");
				var url="${pageContext.request.contextPath }/buyView.do";
				frm.attr('method', 'post');
				frm.attr("action",url);
				frm.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        var frm=$("#frm");
				var url="${pageContext.request.contextPath }/buyEnd.do";
				frm.attr('method', 'post');
				frm.attr("action",url);
				frm.submit();
		    }
		    alert(msg);
		});
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />