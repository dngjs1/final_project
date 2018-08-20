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

<script>
	var sell_price;
	var amount;
	$(function(){
		var IMP = window.IMP;
		IMP.init('imp29686371');
       	init();
   	});
	function init () {
		var last_price=0;
		if($("#quantity").html()!=null){
			sell_price = parseInt($('#price').text());
			quantity = $("#quantity").html();
			var result = parseInt(quantity) * sell_price;
			$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("#sum_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("#sum_total_price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			var save_point=parseInt(result*0.02);
			$("#save_point").text(save_point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("[name=plus_point]").val(save_point);
			if(result>=20000){
				$("#deli").text("무료");
				last_price=result;
				
			}else{
				last_price=result+2500;
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
			var save_point=parseInt(sum*0.02);
			$("#save_point").text(save_point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			$("[name=point]").val(save_point);
			$('#sum_total_price').html(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			if(sum>=20000){
				$("#deli").text("무료");
				last_price=sum;
			}else{
				last_price=sum+2500;
			}
		}
		$(".last_price").text(last_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$(".last_price").val(last_price);
		$("[name=minus_point]").val(0);
		var curr_point=$("#curr_point").html();
		$("#curr_point").html(curr_point.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	
	function chk_validate(){
		var use_point=parseInt($('#use_point').val());
		var curr_point=parseInt($('#curr_point').text().replace(",",""));
		if($("#point_chk").prop("checked")){
			if( use_point > curr_point ){
	    		alert("포인트가 부족합니다.");
	    		return false;
	    	}
			if($('#use_point').val()==""){
				alert("포인트를 입력해주세요.");
				return false;
			}
			if(use_point < 0){
				alert("양의 정수를 입력해주세요.");
				return false;
			}
			if( use_point > parseInt($(".last_price.total-price").text().replace(",","")) ){
				alert("결제금액을 초과하였습니다.");
				return false;
			}
		}
		return true;
	}
	$(function(){
		$("#point_chk").change(function(){
			var use_point = parseInt($('#use_point').val());
	        var last_price=parseInt($(".last_price.total-price").text().replace(",",""));
	        if($("#point_chk").prop("checked")){
		        	last_price=last_price-use_point;
		        	$("[name=minus_point]").val(use_point);
		        	$('#use_point').attr("readonly",true);
	        }else{
	        	last_price=last_price+use_point;
	        	$("[name=minus_point]").val(0);
	        	$('#use_point').attr("readonly",false);
	        }
	        $(".last_price").text(last_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	        $(".last_price").val(last_price);
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

<style>
   .cart_box_step {
      height: 80px;
      background : #fcfcfb;
      overflow: hidden;
      
   }
   
   .cart_box_step h1 {
      float : left;
      margin-left : 18px;
      font-size : 26px;
      line-height: 78px;
      font-weight: bold;
      
   }
   .cart_box_step ul {
      float : right;
      margin-right : 15px;
      overflow: hidden;
   }
   
   .cart_box_step ul li {
      float : left;
      height : 80px;
      padding : 0 15px 0 55px;
      background : url(./resources/images/bg_step_item.jpg) no-repeat 0 0;
      color : #000;
      font-size: 20px;
      line-height: 78px;
      font-weight: bold;
      
   }
   
   .cart_box_step ul li.top span {
      background: #2d2e33;
      color : #fff;
   }
   
   .cart_box_step ul li span {
      display: inline-block;
      width : 39px;
      height: 39px;
      margin-right: 6px;
      border-radius: 100%;
      background-color : #d8dbdd;
      font-size:17px;
      line-height: 37px;
      text-align: center;
      vertical-align: middle;
      letter-spacing: 0;
      color : #fff;
   }
</style>
<div class="container">

   <div class = "cart_box_step">
   <h1><i class="fas fa-calculator"></i> 주문작성 /결제</h1>
      <ul class = "step_number">
         <li  style = "background: none; border-bottom:none;">
         <span>01</span>
            장바구니
            </li>
         <li class = "top" style = "border-bottom:none;">
         <span>02</span>
            주문작성 / 결제
         </li>
         <li>
         <span>03</span>
            주문완료
         </li>
      
      </ul>
   </div>
   <style>
      .order_title {
         margin-top : 20px;
         padding : 10px;
         font-size : 20px;
         line-height: 38px;
         font-weight : bold;
         text-align: left;
      }
      .order_board {
         width : 100%;
         font-size : 15px;
         line-height: 18px;
         table-layout: fixed;
         word-wrap : break-word;
      }
      .order_board th {
         padding : 21px 0;
         border-left : 1px solid #eaeaea;
         background : #b5babd;
         color : black;
         font-weight: bold;
         text-align: center;
      }
      .order_board td.align_left {
         padding : 23px 10px 23px 15px;
         border-left: none;
         
      }
      .align_left bdl_none {
      	 width : 200px;
      	 border-left: none;
         
      }
      .order_board td {
         padding : 23px 0;
         border-left : 1px solid #eaeaea;
         border-botto : 1px solid #eaeaea;
         background : #fcfcfb;
         text-align : center;
         font-weight: bold;
         font-size : 16px;
      }
   </style>
   
   
   <h2  class = "order_title">
      주문작성 / 결제
   
   
  <form id="frm">
   <table class="order_board">
      <colgroup>
         <col style = "width:12%;">
         <col style = "width:9%;">
         <col style = "width:9%;">
         <col style = "width:9%;">
      </colgroup>
   <thead>
      <tr class="tr1">
         <th scope = "col" style = "border-left:none !important;">상품정보</th>
         <th >수량</th>
         <th scope = "col">상품금액</th>
         <th scope = "col" style="border-right:none;">총 상품금액</th>
      </tr>
      </thead>
      
      <c:if test="${not empty cartList}">
         <c:forEach var='cart' items='${cartList }' varStatus="vs">
         <tbody>
            <tr class="tr2">
               <td class = "align_left bdl_none" style = "width : 300px;">
                  <div style="float: left;width:80px"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${cart.NEW_P_IMG_PATH }"> </div>
                  <div style="float: left;text-align:left;margin-left:15px;">
                     <input type="hidden" name="product_option_code" value="${cart.PRODUCT_OPTION_CODE}"/>
                     <input type="hidden" name="buy_quantity" value="<b>${cart.CART_QUANTITY}</b>"/>
                     <input type="hidden" class="name${vs.count }" value="${cart.PRODUCT_NAME} 등  ${fn:length(cartList)}개"/>
                     <span>${cart.PRODUCT_NAME}</span><br>
                     <c:if test="${cart.OPTION_SIZE!=null}">
                        <span>(${cart.OPTION_SIZE})</span><br>
                     </c:if>
                     <span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>
                  </div>
               </td>
               <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
               <input type="hidden" class="cartLength" value="${fn:length(cartList)}"/>
               <td><span class="cart_quantity${vs.count}" style="font-size:15px;font-weight:bold">${cart.CART_QUANTITY}</span></td>
               <td><span class="price${vs.count}" style="font-size:16px">${cart.PRICE}</span><span> 원</span></td>
               <td><span class="sum_price${vs.count}"></span><span> 원</span></td>   
            </tr>
            </tbody>
         </c:forEach>
      </c:if>
     
      <c:if test="${empty cartList }">
      <tbody>
         <tr class="tr2">
            <td class = "align_left bdl_none" style = "width:200px;">
               <div style="float: left;width:80px"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${productJoinOption.new_p_img_path }"> </div>
               <div style="float: left;text-align:left;margin-left:15px;">
                  <span>${productJoinOption.product_name}</span><br>
                  	<c:if test="${productJoinOption.option_size != null}">
                        <span>(${productJoinOption.option_size })</span><br>
                     </c:if>
                  <span><span style="font-size:16px;color:#148CFF;"><%=strdate%></span> 도착 예정</span>
               </div>
               <input type="hidden" name="product_option_code" value="${productJoinOption.product_option_code}"/>
               <input type="hidden" name="buy_quantity" value="${quantity}"/>
               <input type="hidden" class="name1" value="${productJoinOption.product_name}"/>
            </td>
            <td><span id="quantity" >${quantity }</span></td>
            <td><span id="price">${productJoinOption.price}</span><span> 원</span></td>
            <td><span id="sum_price"></span><span> 원</span></td>   
         </tr>
      </tbody>
      </c:if>
   </table>
   
  
   
<style>
   
   .order_total {
      display : table;
      table-layout: fixed;
      width :100%;
      margin-top : 40px;
      border-top : 1px solid #b5babd;
   }
   
   .top {
      padding:0 36px;
      border-bottom: 1px solid #eaeaea;
      
   }
   
   
   .order_total li {
      display : table-cell;
      position : relative;
      width : 33.3%;
      border-right: 1px solid #eaeaea;
      border-bottom: 1px solid #eaeaea;
      background: #fdfdf8;
      font-weight: bold;
      box-sizing: border-box;
      z-index: 10;
   }
   
   .order_total li:first-child {
      z-index : 15;
   }
   
   .top dl {
      overflow: hidden;
      margin-bottom: 0px;
   }
   
   
   .top dl dt {
      float : left;
      font-size : 15px;
      line-height: 84px;
   }
   
   .top dl dd {
      font-size : 30px;
      text-align: right;
   }
   
   .top dl dd em {
      font-size: 30px;
      line-height: 84px;
      font-style: normal;      
   }
   
   
   </style>
   
      <div id = "cart_bottom_box">
         
         <ul class = "order_total">
         <li>
            <div class = "top">
               <dl>
                  <dt style = "line-height:84px;">주문금액</dt>
                  <dd>
                     <em id = "sum_total_price"></em>원
                  </dd>
               </dl>
            </div>
            
            <style>
               .order_total li:first-child .bottom {
                  width:200%;
                  background: #fdfdf8;
                  box-sizing: border-box;
                  
               }
               
               .order_total li:first-child .bottom dl {
                  padding : 8px 0;
                  
               }
               
               .order_total li:first-child .bottom dl dt {

                  line-height: 35px;
               }
               
               .order_total li .bottom {
                  padding : 22px 36px;
               }
               .order_total li .bottom dl dt {
                  float:left;
                  font-size : 15px;
                  line-height : 30px;
               }
               
               .order_total li .bottom dl {
                  overflow: hidden;
               }
               .order_total li:first-child .bottom dl dd {
                  padding-left : 165px;
                  line-height: 35px;
                  text-align: left;
                  
               }
               
               .order_total li .bottom dl dd {
                  font-size : 15px;
                  line-height: 30px;
                  text-align: right;
               }
               
               .order_total li:first-child .bottom dl dd input.text {
                  text-align : right;
               }
               
               .text02 {
                  height : 35px;
                  padding : 0 10px;
                  margin : 0;
                  border : 1px solid #c4c4c4;
                  font-size : 15px;
                  line-height: 33px;
                  box-sizing: border-box;
               }
               
               .order_total li:first-child .bottom dl dd .dd_left
               {
                  float:left;
               }
               
               .order_total li:first-child .bottom dl dd .dd_right {
                  padding-left : 204px;
               }
               .cart_total li:first-child .bottom dl dd .dd_right em {
                  font-weight: bold;
                  font-style: normal;
               }
               .btn_gray {
                  display : inline-block;
                  height: 35px;
                  padding : 0 25px;
                  background : #92979b;
                  color : #fff;
                  font-size : 15px;
                  line-height: 33px;
                  font-weight: bold;
                  text-align: center;
                  vertical-align: middle;
                  box-sizing: border-box;
                  cursor: pointer;
               }
            </style>
            <div class = "bottom" colspan = "2">
            	  <dl>
                     <dt>배송비</dt>
                     <dd>
                        <div class = "dd_left">
                           <span id="deli">2,500 원</span>
                        
                        </div>
            
                        <div class = "dd_right">
                           
                        
                        </div>
            
                  </dl>
                  <dl>
                     <dt>쿠폰할인</dt>   
                     <dd>
                        <div class = "dd_left">
                           <input type = "text" class = "text02" id ="#" style = "width:137px;" readonly="true">&nbsp;원
                  
                        </div>
                        
                        <div class = "dd_right">
                           <span class = "btn_gray">쿠폰적용
                           </span>
                           (보유 <em style = "font-style: normal; font-weight: bold;">0장</em>)
                        
                        </div>
                        </dd>
                  </dl>
                  <dl>
                     <dt>포인트</dt>
                        <dd>
                           <div class = "dd_left">
                              <input type = "number" id="use_point" class = "text02" value = "0" style = "width:137px;" numberonly = "true">&nbsp;P
                           </div>
                           
                           <div class = "dd_right">
                              <label for = "#">
                                 <input type = "checkbox" id = "point_chk" class = "checkbox" onclick="return chk_validate();">적용 &nbsp;(적용 가능 포인트 <em id="curr_point" style = "font-style: normal;font-weight: bold;">${point }</em><em style = "font-style: normal;font-weight: bold;">P</em>)
                              </label>
                           </div>
                        </dd>
                  </dl>
            </div>
            
            <style>
               .order_total li .icon {
                  position: absolute;
                  right : -19px;
                  top : 23px;
                  
               }
               
               .icon img { 
                  vertical-align: middle;
               }
               
            </style>
            <span class = "icon">
               <img src = "./resources/images/ico_total_minus.png">
            </span>
         </li>
         
         <li>
         <div class = "top">
            <dl>
               <dt>할인금액</dt>
               <dd>
               <em>0</em>원
               </dd>
            </dl>
         </div>
         <!-- 밑에 부분(회원할인, 이벤트할인)은 z-index로 가려놓음 추후 기능구현 가능할 시간 있을시 활성화 할 것 -->
         
         
         <span class = "icon">
         
            <img src ="./resources/images/ico_total_sum.png">
         </span>
         </li>
         
         <style>
            .order_total li.sum {
               width: 33.4%;
               border-right: none;
               background: #AFB3C6;
               z-index : 5;
            }
            
            
         </style>
         
         <li class = "sum">
            <div class = "top">
               <dl>
                  <dt style = "line-height:84px;">결제예정금액</dt>
                  <dd>
                     <em class = "total-price last_price"></em>
                     	원
                  </dd>
               </dl>
            </div>
            
            <style>
               .icon_point {
                  display : inline-block;
                  width : 18px;
                  height : 18px;
                  margin-top : -2px;
                  border-radius: 100%;
                  background: #b0c976;
                  color : #fff;
                  font-weight: bold;
                  font-size: 12px;
                  line-height: 18px;
                  text-align: center;
                  overflow: hidden;
                  vertical-align: middle;
               }
            </style>
            <div class = "bottom">
               <dl>
                  <dt>적립혜택</dt>
                  <dd></dd>
                  
               </dl>
               
               <dl>
                  <dt>포인트적립</dt>
                  <dd>
                  	<span id="save_point"></span>
                  	<span class ="icon_point">P</span>
                  </dd>
                  
                  
               </dl>
            </div>
         </li>
         
      
      </ul>
   
      </div>
   
   
   
   

   
   <style>
      .order_people_title {
         margin-top : 20px;
         font-size : 20px;
         line-height : 38px;
         font-weight: bold;
         text-align: left;
      }
      
      .order_people {
         width: 40%;
         border-top : 1px solid #d9d9d9;
         font-size : 15px;
         line-height : 20px;
         text-align: left;
         box-sizing: border-box;
         border-right : 1px solid #d9d9d9;
      }
      .order_people tr th:first-child {
         border-left: 1px solid #d9d9d9;
      }
      
      .order_people th {
         padding : 10px 35px;
         border-bottom: 1px solid #d9d9d9;
         background : #AFB3C6;
         font-weight: bold;
         font-size : 17px;
         text-align: left;
         
      }
      .order_people td {
         padding : 10px 20px;
         border-bottom : 1px solid #d9d9d9;
         backbround : #fcfcfb;
      }
   </style>

   <h2 class = "order_people_title">구매자 정보</h2>
      <table class = "order_people">
         <colgroup>
            <col style = "width:172px">
            <col>
         </colgroup>
         
         <tbody>
            <tr>
               <th scope = "row">이름</th>
               <td>
                  <b>${memberLoggedIn.member_name }<input type="hidden" name="member_id" value="${memberLoggedIn.member_id }"/></b>
               
               </td>
            </tr>
            
            <tr>
               <th scope = "row">이메일</th>
               <td>
                  <b>${memberLoggedIn.email }</b>
               </td>
            
            </tr>
            
            <tr>
               <th scope = "row">연락처</th>
               <td>
                  <b>${memberLoggedIn.phone }</b>

               </td>
            
            </tr>
         </tbody>
      
      </table>
      


   <h2 class = "order_people_title">받는사람 정보</h2>
   
      <style>
      
      .order_people2 {
         width : 80%;
         border-top : 1px solid #d9d9d9;
         font-size : 15px;
         line-height: 20px;
         text-align : left;
         box-sizing: border-box;
         border-right : 1px solid #d9d9d9;
      }
      
      .order_people2 th {
         padding : 10px 35px;
         border-bottom: 1px solid #d9d9d9;
         background : #AFB3C6;
         font-weight: bold;
         text-align: left;
         font-size : 17px;
         
      }
      .order_people2 td {
      
         padding:10px 20px;
         border-bottom: 1px solid #d9d9d9;
         background : #fcfcfb;
      }
      
      .text04 {
         height : 35px;
         padding : 0 10px;
         margin : 0;
         border : 1px solid #c4c4c4;
         font-size : 15px;
         line-height: 33px;
         box-sizing: border-box;
      }
      
      .btn_search {
         display : inline-block;
         height : 35px;
         padding : 0 25px;
         color : black;
         font-size : 15px;
         line-height: 33px;
         font-weight: bold;
         text-align: center;
         cursor : pointer;
      }
      
      </style>
   <table class="order_people2" style="font-size:13px;">
   
   <colgroup>
      <col style = "width:172px;">
      <col>
   
   </colgroup>
   <tbody>
      <tr>
         <th scope = "row">이름</th>
         <td><input type="text" class = "text04" name="receiver_name" value="${memberLoggedIn.member_name }" /></td>
      <tr>
      <tr>
         <th scope = "row">배송주소</th>
         <td>
            <div>
               <input type = "text" class = "text04" id = "roadAddress" name = "receiver_address" class = "text" value="${memberLoggedIn.address}" style = "width : 300px;" required>
               <input type = "text" class = "text04"id = "post_no" name = "receiver_post_no" class = "text" value="${memberLoggedIn.post_no}" tabindex = "5" required>
               <input type = "button" class = "btn_search" value = "주소찾기" class = "btn_check" style = "border:none;" onclick="DaumPostcode()">
            </div>
            <div>
               <br>
               <span><b>나머지주소 : </b></span>
               <input type = "text" class = "text04" id = "detail_address" name = "receiver_d_address" class = "text"  value="${memberLoggedIn.detail_address}" style = " width:440px;" tabindex = "5" required>
            </div>
         </td>
      <tr>
      <tr>
         <th>연락처</th>
         <td><input type="text" class = "text04" name="phone2" value="${memberLoggedIn.phone }" /></td>
      <tr>
      <tr>
         <th>배송 요청사항</th>
         <td>
         <div class = "limit_box">
         <input type="text" class = "text04"  size="50" id = "orderMemo" name = "request" value="부재시 경비실에 맡겨주세요"/>
         <!-- 글자수 제한 -->
         
         <span>
            <label class = "cs">0</label>
            자/40자
         </span>
         </div>
         </td>
         
      <tr>
      </tbody>
   
      <script type = "text/javascript">
      
      $(document).ready(function(){
         $("#orderMemo").on('keyup', function(){
            pubByteCheckTextarea("#orderMemo",".cs",40);   //글자수제한
         });
      });
      </script>
      
      <style>
         .limit_box {
            display : inline-block;
            position : relative;
         }
         
         .limit_box span {
            position : absolute;
            top : 0;
            right : 0;
            width : 75px;
            color : #888;
            font-size : 12px;
            line-height : 35px;
            text-align: center;
         }
         
         .price {
         
         font-size :28px;
         line-height : 43px;
         font-weight: bold;
         }
      </style>
      
   </table>
   
   
   <h2 class = "order_people_title">결제입력</h2>
   <table class="order_people2">
   <colgroup>
      <col style = "width:172px;">
      <col>
   
   </colgroup>
   <tbody>
      <tr>
         <th scope = "row">총 결제금액</th>
         <td>
         	<span class = "price last_price"></span><span class = "price"> 원</span>
         	<input type="hidden" name='last_price' class='last_price'/>
         	<input type="hidden" name='plus_point'/>
         	<input type="hidden" name='minus_point'/>
         </td>
      </tr>
      <tr>
         <th scope = "row">결제방법</th>
         <td>
            <div class = "label_group">
               <label for = "pay1" class ="check_label">
                  <input type = "radio" class = "radio" name ="#" checked = "true">
                     <b>신용카드</b>               
               </label>
            
            </div>
         </td>
      </tr>
      </tbody>
      
      <style>
         .check_label {
            margin-right : 30px;
            line-height : 43px;
         }
         
         .btn_ok {
            display : inline-block;
            width : 211px;
            height : 60px;
            border : none;
            background : #2D2E33;
            color : #fff;
            font-size : 18px;
            line-height: 58px;
         
            box-sizing: border-box;
            cursor : pointer;
         }
         
         .btn_cart {
            display : inline-block;
            width : 211px;
            height : 60px;
            border : none;
            background : #92979b;
            color : #fff;
            font-size : 18px;
            line-height: 58px;
            font-weight: bold;
            box-sizing: border-box;
            cursor : pointer;
         }
      </style>
   </table>
   <br>
   <div style="text-align:center;">
   <button id="cart" type = "button" class = "btn_cart">
   	<span class = "fas fa-cart-arrow-down" style = "font-size:20px;">&nbsp;장바구니</span>
   </button>
   <button id="pay" type="button" class="btn_ok">
	<span class = "far fa-credit-card" style = "font-size:20px; font-weight:bold;">&nbsp;결제진행</span>
   </button>
   </div>
</form>
</div>
<script>
$(function(){
	$('#cart').click(function(){
		location.href="${pageContext.request.contextPath }/cartView.do?member_id=${memberLoggedIn.member_id}";
	});
	$('#pay').click(function(){
		IMP.request_pay({
		    pg : 'nice',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : $('.name1').val(),
		    amount : parseInt($('.last_price').html().replace(",","")),
		    buyer_email : '${memberLoggedIn.email }',
		    buyer_name : '${memberLoggedIn.member_name }',
		    buyer_tel : '${memberLoggedIn.phone }',
		    buyer_addr : '${memberLoggedIn.address}',
		    buyer_postcode : '${memberLoggedIn.post_no }',
		},function(rsp) {
			if ( rsp.success ) {
				var msg = '결제가 완료되었습니다.';
				var frm=$("#frm");
				var url="${pageContext.request.contextPath }/buyEnd.do";
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