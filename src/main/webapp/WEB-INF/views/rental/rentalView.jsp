<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/daterangepicker.css" />

<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
input[name="datetimes"]{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
input[name="datetimes"]{cursor: pointer;}

#rental_content{
	text-align: center;
}
</style>
   
<div class="container">
	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">${rental.p_category_name }</span></p>
	<div class="row" style="height:700px">
		<div class="col-6">
			<img style="width:600px; height:500px;" alt="텐트" src="${rental.imgUrl }">
		</div>
		<div class="col-6">
			<hr style="border: 1.5px solid black;margin-top: 0px;">
			<div style="margin-left:10px">
				<span style="font-size:25px;font-weight:bold">${rental.title }</span><span style="float: right;">별점 들어갈부분</span><br>
				<span>판매자 : ${rental.member_id }</span><br>
				<span>주소 : ${rental.address } ${rental.detail_address }</span>
				<div style="font-size:20px;color:#B9062F;font-weight:bold"><span id="price">대여료 : ${rental.price } 원/24시간</span></div>
				<p style="color: #00009e;">※ 기본 24시간 대여료입니다.</p>
				<p style="color: #00009e;">※ 8시간 이하 추가 사용 시 24시간 대여료의 50%가 추가됩니다.</p>
				<hr>
				 대여기간 :  <input type="text" name="datetimes" placeholder="Select value" class="form-control" />
				<hr>
				<div>
					<span id="del_price" style="color:#148CFF; font-size:25px; float: right;">--원</span>
				</div>
				<br><br><br>
				<div style="float: right;">
					<button class="btn btn-primary" onclick="buy()">대여</button>
				</div>
				<br>
				<hr>
				<br>
				<div style="margin:0 0 10px;">
                        <span style="color: tomato;"><span>✔</span>꼭 읽어주세요!</span>
                        <div style="color: #a4a4a4;">
                            <p>1. 반납일을 반드시 지켜주세요.</p>
                            <p>2. 생활 기스 정도의 훼손은 책임을 묻지 않습니다.</p>
                            <p>3. 상품 파손시 제품 수리비를 배상하셔야합니다.</p>
                        </div>
                            
                    </div>
	    	</div>
    	</div>
	</div>
	<hr style="boarder:0; height:3px; background: #ccc;">
	<div class="container" id="rental_content">
		${rental.content }
	</div>
</div>
<script>
	$(function() {
	  $('input[name="datetimes"]').daterangepicker({
	    timePicker: true,
	    minDate: "${rental.start_date}",
	    maxDate: "${rental.end_date}",
	    locale: {
	        format: 'YYYY-MM-DD HH:mm:ss'
	      }
	  }, function(start, end, label) {
		  result = (end-start)/(1000*3600*24);
		  result = Math.floor(result);
		  result2 = ((end-start)%(1000*3600*24))/(1000*3600);
		  if(result2>0 && result2<=8){
			  $("#del_price").text(${rental.price}*result+${rental.price}*0.5+"원");
		  } else{
			  $("#del_price").text(${rental.price}*result+"원");
		  }
	  });
	});
</script>
 
<!-- 결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<script>
IMP.init('imp84398340');
	function buy(){
		if(${memberLoggedIn == null}) {
			alert("로그인한 회원만 이용 가능합니다.");
			return;
		}
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    kakaoOpenApp : true
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		    			
		    			alert(msg);
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        alert(msg);
		    }
		});
	}
</script>

<script type="text/javascript" src="${path }/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/daterangepicker.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />