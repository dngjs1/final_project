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

.d_line {
	width:100%;
	height:20px;
	background:url("./resources/images/border_line.gif") repeat-x 0 center;
	overflow: hidden;
}

.selected_option {
	margin-top:7px;
	padding:11px 30px 20px 10px;
	border:1px solid #c4c4c4;
	color : #000;
	font-size : 14px;
	line-height : 20px;
	box-shadow: 7px 3px 5px #c4c4c4;
	height: 63px;
}
</style>
   
<div class="container">
	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">${rental.p_category_name }</span></p>
	<div class="row" style="height:700px">
		<div class="col-6">
			<img style="width:100%; height:645px;" alt="텐트" src="${rental.imgUrl }">
		</div>
		<div class="col-6">
			<div style="margin-left:10px">
				<form id="form" action="${path }/insertRentalPerson.do" method="get" enctype="multipart/form-data" onsubmit="return FormSubmit();">
					<input type="hidden" id="rental_obj_code" name="rental_obj_code" value="${rental.rental_obj_code }"  />
					<input type="hidden" id="member_id" name="member_id" value="${memberLoggedIn.member_id }" id="member_id" readonly="readonly">
					
					<input type="hidden" id="start_date" name="start_date" value="" />
					<input type="hidden" id="end_date" name="end_date" value="" />
					
					<!-- 상품명 -->
					<h1 class = "product_name1" style = "box-sizing:border-box;padding-right:150px; font-weight:bold;font-size:30px; color:#2e2e2e;">${rental.title }</h1>
					<!-- 가격 -->
					<div style="font-size:42px;color:#2e2e2e;font-weight:bold"><span id="price">${rental.price } 원</span></div>
					<!-- 밑 줄 표시 div -->
					<div class = "d_line">
					
					</div>
					<span><b>판매자id :</b> ${rental.member_id }</span><br>
					<span><b>직거래 주소 :</b> ${rental.address } ${rental.detail_address }</span><br>
					
					<div class = "d_line">
					
					</div>
					
					<b>대여료 안내</b>
					<div class = "selected_option" style = "height:84px; margin-bottom:10px;">
					<p style="color: #00009e;">※ 기본 24시간 대여료입니다.</p>
					<p style="color: #00009e;">※ 8시간 이하 추가 사용 시 24시간 대여료의 50%가 추가됩니다.</p>
					</div>
					
					<b>주의사항</b>
					<div class = "selected_option" style = "height:143px;">
	                        <span style="color: tomato;"><span>✔</span>꼭 읽어주세요!</span>
	                        <div style="color: #2e2e2e; font-weight:bold;">
	                            <p style = "margin-top:7px;">1. 반납일을 반드시 지켜주세요.</p>
	                            <p>2. 생활 기스 정도의 훼손은 책임을 묻지 않습니다.</p>
	                            <p>3. 상품 파손시 제품 수리비를 배상하셔야합니다.</p>
	                        </div>
	                        </div>
					
					<div class = "d_line">
					
					</div>
					
					 <b>대여기간</b>  
					 <div class = "selected_option">
					 <input type="text" name="datetimes" placeholder="Select value" class="form-control" />
					 </div>
					<hr>
					
					
					<div>
						<span id="del_price" style="color:#148CFF; font-size:25px; float: right;">--원</span>
					</div>
					<style>
					.borrow_item {
					width:194px;
					height:70px;
					background:#2D2E33;
					color : #fff;
					font-size : 18px;
					line-height: 55px;
					text-align: ceneter;
					font-weight: bold;
					margin-right:-43px;
					}
					
					.buy_icon {
						display : inline-block;
						margin:-5px 5px 0 0;
						font-size: 35px;
						vertical-align: middle;
					}
					</style>
					<div style="float: right;">
						<button class = "borrow_item" name="button" type="button" onclick="buy();">
							<span class = "buy_icon far fa-credit-card"></span>
						대여신청</button> 
						<button id="hiddenBtn"  type="submit" style="display: none;"></button>
					</div>
					
					
                </form>
	    	</div>
    	</div>
	</div>
	
	<div  id="rental_content" style = "margin-top:10%; border:1px solid #2e2e2e;" >
		${rental.content }
	</div>
</div>
<script>
	$(function() {
		var price = ${rental.price};
		  $('input[name="datetimes"]').daterangepicker({
		    timePicker: true,
		    minDate: new Date,
		    maxDate: "${rental.end_date}",
		    locale: {
		        format: 'YYYY-MM-DD HH:mm:ss'
		    },isInvalidDate : function(date){
		    	//다른 사람이 예약한 날짜 못하게 막음
				<c:forEach items="${rentalPerson }" var="rental" varStatus="status">
					if (date.format('YYYY-MM-DD HH:mm:ss') >= "${rental.start_date}" && date.format('YYYY-MM-DD HH:mm:ss') <= "${rental.end_date}") {
						return true;
					}
				</c:forEach>
	           return false;
  		      } 
		  },function(start, end, label) {
				  result = (end-start)/(1000*3600*24);
				  result2 = (end-start)%(1000*3600*24);
				  if(result2 != 0 ) {
					  if(result2>0 && result2<=8){
						  $("#del_price").text(Math.round(price*result+price*0.5)+"원");
					  } else{
						  $("#del_price").text(Math.round(price*result)+"원");
					  }
				  } else{
					  $("#del_price").text(price+"원");
				  }
			});
	  $('input[name="datetimes"]').change(function(){
			var odate = $(this).val();
			$("#start_date").val(odate.substring(0,19));
			$("#end_date").val(odate.substring(22,42));
	  });
	});
	/* function redu(date){
		var dateRanges = "${rentalPerson}";
		var date1;
		for(var j=0; j> dateRanges.length; j++) {
			date1 = date1 + "||" + (date.format('YYYY-MM-DD HH:mm:ss') >= "${rentalPerson[j].start_date}" && date.format('YYYY-MM-DD HH:mm:ss') <= "${rentalPerson[j].end_date}");
		}
		alert(date1);
		return date1;
	} */
</script>
 
<!-- 결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<script>
IMP.init('imp84398340');
	function buy(){
		console.log("${rentalPerson}");
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
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;
    			
    			alert(msg);
    	    	document.getElementById('hiddenBtn').click();
		    	/*//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
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
		    	    	document.getElementById('hiddenBtn').click();
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	}); */
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