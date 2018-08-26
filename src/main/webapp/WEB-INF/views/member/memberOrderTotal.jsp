<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>


<jsp:include page="/WEB-INF/views/member/commonMypage.jsp"/>

<div class = "col-10">
	<div class = "location">
		<a href = "#" class = "home"><i class="fas fa-home"></i></a>
		>
		<a href = "#">주문 / 배송내역</a>
	</div>
	
	<style>
	.myorder_page {
		
	}
	
	.order_title {
		margin-top : 0;
		padding : 0 10px;
		font-size : 20px;
		line-height: 79px;
		font-weight: bold;
		text-align: left;
	}
	
	.truck_page_tit{
		background : #AFB3C6;
		display: table-cell;
		height : 122px;
		width : 140px;
		text-align: center;
		font-size: 52px;
		font-weight: bold;
		color : #2e2e2e;
		line-height: 22px;
		box-sizing: border-box;
		vertical-align: middle;
	}
	
	.truck_page_cont {
		display: table-cell;
		background: #fcfcfb;
		width: 862px;
		height: 122px;
		box-sizing: border-box;
		vertical-align: middle;
		border : 1px solid #d9d9d9;
	}
	.truck_page_cont_in {
		padding-left: 20px;
	}
	
	.truck_page_cont_in p {
		font-size : 15px;
		color : 2e2e2e;
		line-height: 20px;
	}
	
	</style>
	<div class = "myorder_page">
		<h2 class = "order_title">
		
		</h2>
		<div class = "truck_page">
			<div class = "truck_page_tit">
				<i class="fas fa-truck"></i>
			</div>
			
			<style>
				.truck_page_cont_in p {
					line-height: 10px;
					font-weight: bold;
				
				}
			</style>
			<div class = "truck_page_cont">
				<div class = "truck_page_cont_in">
					<p></p>
					<p>환불 / 배송 / 매진된 상품에 관련해서는 1:1상담을 이용하세요</p>
					<P>어차피 게시글 남기셔도 살 때는 맘대로지만 환불은 마음대로 안됩니다</P>
					<p>환불은 최장 1년이 걸릴 수 있습니다.</p>
				</div>
			</div>
		
		</div>
	</div>
	<style>
		.empty_box {
			height : 10px;
		}
	</style>
	
	
	<div class = "empty_box">
	
	</div>

	<style>
		.mypage_wrap {
			background : #fcfcfb;
			overflow: hidden;
		}
		
		.mypage_title02 {
			margin-top: 0;
			font-size: 20px;
			line-height: 79px;
			font-weight: bold;
			text-align: left;
		}
		
		.order_board{
			width:100%;
			font-size : 15px;
			line-height: 18px;
			table-layout: fixed;
			word-wrap : break-word;
		}
		
		.order_board th {
			padding: 21px 0;
			background: #C5C5E6;
			color : black;
			font-weight: bold;
			text-align: center;
			border-left : 1px solid #eaeaea;
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
		
		.order_board td.align_left {
	         padding : 23px 10px 23px 15px;
	         border-left: none;
	         
	      }
	      .align_left .bdl_none {
	      	 width : 200px;
	      	 border-left: none;
	         
	      }
	      .request_btn {
	      	width : 100px;
	      	margin : 2px;
	      }
	</style>
	<script>
		$(function(){
			for(var i=0;i<parseInt($('.orderLength').val());i++){
				$(".buy_date"+i).html($(".buy_date"+i).html().replace(".0",""));
				var buy_status=$(".buy_status"+i);
				if(buy_status.html()=="P"){
					buy_status.html("결제완료");
				}else if(buy_status.html()=="D"){
					buy_status.html("배송중");
				}else if(buy_status.html()=="SD"){
					buy_status.html("배송완료");
				}else if(buy_status.html()=="R"){
					buy_status.html("환불요청중");
				}else if(buy_status.html()=="SR"){
					buy_status.html("환불완료");
				}
				
				$(".total_price"+i).html($(".total_price"+i).html().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}
		});
		$(function(){
			$('.refund_request').click(function(){
				var buy_status=$(this).parent().parent().find(".buy_status");
				if(buy_status.html()=='환불요청중'){
					alert('이미 환불이 요청되었습니다.');
				}else if(buy_status.html()!='결제완료'){
					alert('배송이 시작된 상품 환불은 고객센터로 문의 해주세요.');
				}else{
					$.ajax({
						url:"${pageContext.request.contextPath}/refundRequest.do",
						data:{buy_code:$(this).val()},
						success:function(data){
							if(data.trim()=='0'){
								alert("환불요청에 실패하였습니다.");
								return false;
							}else{
								alert("환불이 요청되었습니다.");
								buy_status.html("환불요청중");
							}
						},
						error:function(jpxhr,textStatus,errormsg){
							console.log("ajax전송실패.");
							console.log(jpxhr);
							console.log(textStatus);
							console.log(errormsg);
						}
					});
				}
			});
		});
		$(function(){		
			$('.click_product').on('click',function(){
				var product_code=$(this).parent().parent().find('.product_code').val();
				location.href="${pageContext.request.contextPath}/productView.do?product_code="+product_code;
			});
			
			$('.write_product_review').click(function(){
				var product_code=$(this).parent().parent().find('.product_code').val();
				$('[name=product_code]').val(product_code);
				$("#testModal").modal();
			});
		});
	</script>
	<div class = "mypage_wrap">
		<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 주문 / 배송내역</h2>
		<table class = "order_board">
			<colgroup>
				 <col style = "width:25%;">
		         <col style = "width:30%;">
		         <col style = "width:15%;">
		         <col style = "width:15%;">
		         <col style = "width:15%;">
		    </colgroup>
			<thead>
			<tr>
				<th scope="col">주문일자</th>
				<th scope="col">상품정보</th>
				<th scope="col">결제금액</th>
				<th scope="col">진행상황</th>
				<th scope="col">요청</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
				<c:when test="${not empty orderList}">
					<input type="hidden" class="orderLength" value="${fn:length(orderList)}"/>
					<c:forEach var="order" items="${orderList}" varStatus="vs">
					<tr>
					   <td class="buy_date${vs.index}">${order.BUY_DATE }</td>
		               <td class = "align_left bdl_none" style = "width : 300px;">
		                  <div class="click_product" style="float: left;width:100px;cursor:pointer;"><img style="width:100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${order.NEW_P_IMG_PATH }"> </div>
		                  <div style="float: left;text-align:left;margin-left:15px;">
		                     <span class="click_product" style="cursor:pointer;">${order.PRODUCT_NAME}</span><br>
		                     <c:if test="${order.OPTION_SIZE!=null}">
		                        <span>(${order.OPTION_SIZE}),</span>
		                     </c:if>
		                     <span> ${order.BUY_QUANTITY} 개</span>
		                  </div>
		                  <input type="hidden" class="product_code" value="${order.PRODUCT_CODE}">
		               </td>
		               <td><span class="total_price${vs.index}">${order.TOTAL_PRICE}</span><span> 원</span></td>
		               <td><span class="buy_status${vs.index} buy_status">${order.BUY_STATUS}</span></td>
		               <td>
		               	<button class="refund_request request_btn btn btn-outline-secondary rounded-0" style="cursor:pointer;" value="${order.BUY_CODE}">환불 요청</button><br>
		               	<button class="write_product_review request_btn btn btn-outline-secondary rounded-0">상품평 쓰기</button>
		               </td>
         					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5"><b>최근 주문내역이 없습니다.</b></td>
					</tr>
				</c:otherwise>
				</c:choose>
			</tbody>
		
		</table>
	</div>
			<div class = "paging_box" style = "padding:20px;">
				<div class = "paging">
					<nav aria-label="Page navigation example">
  						<ul class="pagination justify-content-center">
    						<li class="page-item disabled">
      							<a class="page-link" href="#" tabindex="-1">이전</a>
    						</li>
    						<li class="page-item"><a class="page-link" href="#">1</a></li>
    						<li class="page-item"><a class="page-link" href="#">2</a></li>
    						<li class="page-item"><a class="page-link" href="#">3</a></li>
    						<li class="page-item">
      							<a class="page-link" href="#">다음</a>
    						</li>
					  </ul>
					</nav>
				</div>
			</div>
<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

.product_review {
	margin-top: 20px;
	padding : 10px;
	font-size : 30px;
	line-height: 38px;
	font-weight: bold;
	text-align: left;
}

</style>



		<!-- 상품평 폼 모달창 -->	
<div class="modal" id="testModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<c:set var='path' value="${pageContext.request.contextPath}" />
			<form name="productReview" action="${path}/productReviewInsert.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input name="product_code" type="hidden"/>
				<input name="member_id" type="hidden" value="${memberLoggedIn.member_id}"/>

		    	<div class="modal-body">
			
			<!-- 타이틀 부분 -->
			
			<style>
				.product_view {
					margin-top:20px;
					padding-bottom : 5px;
					font-size : 26px;
					line-height : 38px;
					font-weight: bold;
				}
			</style>
			 	 <h3 class = "product_view">
			 	 <i class = "fas fa-chalkboard-teacher">
			 	 </i>&nbsp;구매후기 작성
			 	 </h3>
			         
			         <div class = "review_info">
 	  	<dl>
			<dt>후기 등록 시 안내사항</dt> 	  	
 	  		
 	  		<dd>
 	  			<ul class = "list_style">
 	  				<li>
 	  					- 구매 후기 작성 시 100원의 포인트를 드립니다.
 	  				</li>
 	  			
 	  				<li>
 	  					- 직접 상품만을 촬영한 사진을 등록하셔야 합니다.
 	  				</li>
 	  				
 	  				<li>
 	  					- 이메일, 휴대전화 번호 등의 개인정보/광고/비속어가 포함된
 	  					후기는 통보없이 삭제됨을 알려드립니다.
 	  				</li>
 	  				
 	  				<li>
 	  					- 작성된 후기는 Try Trip의 홍보 컨텐츠로 사용될 수 있습니다.
 	  				</li>
 	  				
 	  				<li>
 	  					- 후기 도용 시 포인트 2배 회수, 1년간 구매후기 등록이 제한되며 
 	  					포인트 지급또한 3개월동안 지급받을 수 없습니다.
 	  				</li>
 	  			</ul>
 	  		</dd>
 	  	
 	  	</dl>
 	  	
 	  	
 	  	<style>
 	  		.write_review_box {
 	  			padding-top : 10px;
 	  			padding-bottom: 6px;
 	  			
 	  			margin-bottom : 10px;
 	  		}
 	  		
 	  		.starRev {
 	  			
 	  			max-width : 230px;
 	  		}
 	  	</style>
 	  	
 	  	<div class = "write_review_box row">
 	  	
 	  		<div class="starRev col-4">
			  <span class="starR">1</span>
			  <span class="starR">2</span>
			  <span class="starR">3</span>
			  <span class="starR">4</span>
			  <span class="starR">5</span>
			</div>
			<input type="hidden" class="form-control" name="review_star" id="review_star" required>
			<div class = "col-8">
			<input type="text" class="form-control" name="review_content" id="review_content" placeholder="내용" required>
			</div>
 	  	</div>
 	  	
 	  	<style>
 	  	
 	  	.review_info {
		clear : both;
		padding : 19px 0 0 0;
		border-top : 1px solid #ddd;
		padding-bottom : 10px;
	}
	
	.review info dl dt {
		margin-bottom : 10px;
		font-weight: bold;
	}
	
	.list_style li {
		color : #b2b2b2;
		line-height: 28px;
		font-size : 15px;
		
	}
 	  		.image-inner {
 	  			float : left;
 	  			display : block;
 	  			width : 67px;
 	  			height : 67px;
 	  			border : 1px solid #ddd;
 	  			margin-right : 10px;
 	  			background : url(./resources/images/plus_file.png) no-repeat center;
 	  			overflow: hidden;
 	  			background-size: 100% auto !important;
 	  			position : relative;
 	  		}
 	  		
 	  		/* #fileDiv1 span input {
 	  			display : block;
 	  			width : 67px;
 	  			height : 67px;
 	  			opacity: 0;
 	  		} */
 	  		
 	  		#submit_btn_black {
 	  			float : left;
 	  			width : 158px;
 	  			line-height : 58px;
 	  			text-align: center;
 	  			font-size : 16px;
 	  			background : #000;
 	  			color : #fff;
 	  			font-weight: bold; 	  			
 	  		}
 	  	</style>
 	  	
 	  	<div id = "fileDiv1" title = "첨부이미지">
 	  	
 	  	<!-- <span class = "image-inner" imageindex = "0"> -->
 	  		<input multiple="multiple" type="file" accept=".jpg, .png" class="addfile1" name="file_1" />
 	  <!-- 	</span>	 -->
 	  	
 	  	    <a href="#this" id="add1" class="btn btn-success" style = "color : white; ">사진추가</a>
	        <a href="#this" name="delete1" class="btn btn-dark" style = "color : white; ">삭제하기</a>
	        
	        
 	  	</div>
 	  
 	  </div>
	
			              
			        <!-- <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">	
			             
					<tr class="tr1">
						<th style="text-align: center;border-left:none;">내용</th>
						<td>	
						<input type="text" class="form-control" name="review_content" id="review_content" required>
						</td>
					</tr>
					<tr class="tr1">
						<th style="text-align: center;border-left:none;">별점</th>
						<td>	
						
						<div class="starRev">
						  <span class="starR">1</span>
						  <span class="starR">2</span>
						  <span class="starR">3</span>
						  <span class="starR">4</span>
						  <span class="starR">5</span>
						</div>
						<input type="hidden" class="form-control" name="review_star" id="review_star" required>
						
						</td>
					</tr>
			        </table> -->
			        
			        <!-- <hr style="border:2px solid #787878">
			        <h4>상품 사진</h4>
			        <div id="fileDiv1">
				       	<input multiple="multiple" type="file" accept=".jpg, .png" class="addfile1" name="file_1" />
				        <button type="button" class="btn btn-danger" name="delete1">삭제하기</button>
	        		</div>
	        		<br>
			        <button type="button" class="btn btn-primary" id="add1">사진 추가하기</button>
		        </div>
-->	
				<style>
					.cancel_btn {
						width : 134px;
						height : 38px;
						border:none;
						background : #92979b;
						color : #fff;
						font-size : 18px;
						font-weight: bold;
						text-align: center;
						vertical-align: middle;
					}
				</style>
				<div class="modal-footer">
		        	<a id ="submit_btb_black"><input type="submit" class="btn" value="작성완료" style ="background-color : black; color : white; font-weight : bold; width:134; border-radius: 0;"/></a>   
					<button type="button" class="cancel_btn" data-dismiss="modal">닫기</button>
				</div> 
	
			</form>
		</div>
	</div>
</div>

<script>
$(function(){
	$("#review_star").val("0");
});
	
$('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
$('.starRev span').click(function(){
	  if($(this).html()==1) $("#review_star").val("1");
	  else if($(this).html()==2) $("#review_star").val("2");
	  else if($(this).html()==3) $("#review_star").val("3");
	  else if($(this).html()==4) $("#review_star").val("4");
	  else if($(this).html()==5) $("#review_star").val("5");	  
}); 

var add_count=1;

$(document).ready(function(){
	$("#add1").on("click",function(e){
		add_count=add_count+1;
		if(add_count>7){
			alert("사진은 최대 7개까지 올릴 수 있습니다.");
			return false;
		}
		var file_name=document.getElementsByName('file_1');
		for(var i=0;i<file_name.length;i++){
			if(file_name[i].value.length<1){
				alert("사진파일을 전부 올리셔야 추가가 가능합니다.");
				return false;
			}
		}
		fn_fileAdd1();
	});
	$("a[name='delete1']").on("click",function(e){
		fn_fileDelete($(this));
	});
});
	 
 
function fn_fileDelete(obj){
	obj.parent().remove();
}

function fn_fileAdd1(){
    var str = "<p><input type='file' class='addfile1' accept='.jpg, .png' name='file_1'/><a href='#this' name='delete1' class='btn'>삭제하기</a></p> ";
    $("#fileDiv1").append(str);
     
    $("a[name='delete1']").on("click",function(e){
        e.preventDefault();
        fn_fileDelete($(this));         
    });
}

function validate(){
	var file_name=document.getElementsByName('file_1');
	if(file_name.length<2){
		return true;
	}
	for(var i=0;i<file_name.length;i++){
		if(file_name[i].value.length<1){
			alert("추가되어있는 사진파일을 전부 올리셔야 합니다.");
			return false;
		}
	}
	return true;
}
</script>
			
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />