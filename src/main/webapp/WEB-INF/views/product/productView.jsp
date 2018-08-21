<%@page import="com.notnull.shop.product.model.vo.ProductQuestion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
/* 별점 */
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url('http://i.imgur.com/YsyS5y8.png') 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
#like_btn{
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: 0 auto;
  width: 90px;
  height: 40px;
  background: #FFFFFF;
  border: 0;
  font-size: .9rem;
  font-family: Futura;
  transition: all .2s ease-in-out;
  cursor: pointer;
  border-radius: 6px;
  box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.1);
  outline: none;
}
</style>

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
	List<ProductQuestion> questionList =(List)request.getAttribute("questionList");
	
%>

<script>
	var sell_price;
	var amount;
	$(function(){
       	init();
   	});
	function init () {
		sell_price = parseInt($('#price').text());
		$("#price").text(sell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(sell_price>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
		
	}
	function add () {
		amount = document.form.cart_quantity;
		amount.value ++ ;
		var result = parseInt(amount.value) * sell_price;
		$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		if(result>=20000){
			$("#del_price").text("무료");
		}else{
			$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
		}
	}
	function del () {
		amount = document.form.cart_quantity;
		if (amount.value > 1) {
			amount.value -- ;
			var result = parseInt(amount.value) * sell_price;
			$("#price").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			if(result>=20000){
				$("#del_price").text("무료");
			}else{
				$("#del_price").text("2,500원 (20,000원이상 결제시 배송비 무료)");
			}
		}
	}
	
	$(window).scroll(function() {
		var $el = $('.show-on-scroll');

		if ($(this).scrollTop() >= 549)
			$el.addClass('shown');
		else
			$el.removeClass('shown');
	});
	
	
	
</script>

<div class="container">

	<p style="margin-left:5px;font-size:12px">카테고리 : <span style="color:#148CFF;">${joinCategory.p_category_name}</span></p>
<div class="row">
	<div class="col-6">
	
	<c:forEach var='imgList' items='${imgList }' varStatus="vs">
		<c:if test="${vs.index==0}">
  		<img width="300px" height="300px" src="${path }/resources/upload/productImg/${imgList.new_p_img_path }" alt="상세상품" id="mainImg"/>
  		</c:if>
  		<c:if test="${vs.index>=0}">
  		<img width="50px" height="50px"  src="${path }/resources/upload/productImg/${imgList.new_p_img_path }" alt="상세상품"
  			 onclick="javascript:changeImg('${path}/resources/upload/productImg/${imgList.new_p_img_path }');"/>
  		</c:if>
  	</c:forEach>
	</div>
	<div class="col-6">
		<hr style="border: 1.5px solid black;margin-top: 0px;">
		<div style="margin-left:10px">
			<p style="font-size:25px;font-weight:bold">${joinCategory.product_name}</p>
			 <c:set var="total" value="0"/>
			 <c:forEach var="review" items="${reviewList}" varStatus="vs">
				<c:set var="total" value="${(total+review.review_star)}"/>
				<c:set var="count" value="${vs.count }"/>
			 </c:forEach>
			 <c:choose>
				 <c:when test="${total  == 0}">
					 <span class="star-prototype">0</span>
				 </c:when>
				 <c:otherwise>
				 	 <span class="star-prototype">${total/count}</span>
				 </c:otherwise>
			 </c:choose>
			 <c:choose>
				 <c:when test="${count > 0}">
					 <c:out value="${count}개 상품평"/>
				 </c:when>
				 <c:otherwise>
				 	 <c:out value="0개 상품평"/>
				 </c:otherwise>
			</c:choose>
			<hr>
			<div style="font-size:20px;color:#B9062F;font-weight:bold"><span id="price">${joinCategory.price}</span><span> 원</span></div>
			<hr>
			<p><span style="font-size:18px;color:#148CFF;"><%=strdate%></span> 도착 예정</p>
			<hr>
			<span>배송방법 : 택배</span><br>
			<span>배송비 : </span><span id="del_price" style="color:#148CFF;"></span>
			<hr>
			<form name="form" id="frm" method="get">
				<input type="hidden" name="member_id" class="member_id" value="${memberLoggedIn.member_id}"/>
				<input type="hidden" name="product_code" value="${joinCategory.product_code}"/>
				<c:if test="${optionList!=null && optionList.size()>0}">
					<c:choose>
						<c:when test="${optionList.size()<2}">

							<c:forEach var="option" items="${optionList}">
								<input type="hidden" name="productCode" value="${option.product_option_code}"/>
							</c:forEach>
							<c:forEach var="option" items="${optionList}" varStatus="vs">
								<c:choose>
									<c:when test="${option.option_size == null}">
										<span id="single_left">재고 : ${option.left_amount}</span>
										<input type="hidden" name="product_option_code" value="${option.product_option_code}"/>
									</c:when>
									<c:when test="${option.left_amount<=0}">
										<select name="product_option_code" style="font-size:15px;height:28px;" >
											<option value="${option.product_option_code}" disabled>${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
										</select>
									</c:when>
									<c:otherwise>
										<select name="product_option_code" style="font-size:15px;height:28px;" >
											<option value="${option.product_option_code}">${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
										</select>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span>사이즈 </span>
							<select name="productCode" style="font-size:15px;height:28px;" >
								<c:forEach var="option" items="${optionList}">
									<c:choose>
									<c:when test="${option.left_amount<=0}">
										<option value="${option.product_option_code}" disabled>${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
									</c:when>
									<c:otherwise>
										<option value="${option.product_option_code}">${option.option_size}&emsp;&emsp;&emsp;|&nbsp;재고:${option.left_amount}</option>
									</c:otherwise>
									</c:choose>
								</c:forEach>
				            </select>
						</c:otherwise>
					</c:choose>
					&emsp;&emsp;&emsp;
	            </c:if>
				<span>수량 </span><input type="text" name="cart_quantity" value="1" size="2" style="height:25px;" readonly/>
				<input type="button" value="+" style="width:25px;" onclick="add();"/><input type="button" value="-" style="width:25px;" onclick="del();"/>
				<hr>
				<div style="float:right;">
					<button class="btn btn-primary" type="button" id="buy">구매</button>
					<button class="btn btn-primary" type="button" id="cart">장바구니</button>
				</div>
			</form>
			<script>
			$(function(){
				$('#cart').click(function(){
					var member_id=$('.member_id').val();
					if(member_id==null||member_id.length<1){
						alert("로그인 후 이용해주시기 바랍니다.");
						location.href="${pageContext.request.contextPath}/memberLoginBefore.do";
					}
					else{
						var left_amount=0;
						if($('#single_left').length){
							var left_amount1=$('#single_left').text().split(':');
							left_amount=parseInt(left_amount1[1]);
						}else{
							var left_amount2=$('[name=product_option_code] option:selected').text().split(':');
							left_amount=parseInt(left_amount2[1]);
						}
						if(left_amount < parseInt($('[name=cart_quantity]').val()) ){
							alert("재고가 부족합니다.");
							return false;
						}
						
						var productInfo={
								member_id:member_id,
								product_option_code:$("[name=productCode]").val(),
								product_code:$("[name=product_code]").val(),
								cart_quantity:$("[name=cart_quantity]").val()
						};
						$.ajax({
							url:"${pageContext.request.contextPath}/cartInsert.do",
							data:productInfo,
							success:function(data){
								if(data.trim()=='0'){
									alert("장바구니 추가에 실패하였습니다.");
									return false;
								}else{
									if (confirm('장바구니로 이동하시겠습니까?')) {
										location.href="${pageContext.request.contextPath}/cartView.do?member_id=${memberLoggedIn.member_id}";
						            } else {
						                return;
								    }
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
				$('#buy').click(function(){
					var member_id=$('#member_id').val();
					if(member_id==null||member_id.length<1){
						alert("로그인 후 이용해주시기 바랍니다.");
						location.href="${pageContext.request.contextPath}/memberLoginBefore.do";
					}else{
						var left_amount=0;
						if($('#single_left').length){
							var left_amount1=$('#single_left').text().split(':');
							left_amount=parseInt(left_amount1[1]);
						}else{
							var left_amount2=$('[name=product_option_code] option:selected').text().split(':');
							left_amount=parseInt(left_amount2[1]);
						}
						if(left_amount < parseInt($('[name=cart_quantity]').val()) ){
							alert("재고가 부족합니다.");
							return false;
						}
					
						var frm=$("#frm");
						var url="${pageContext.request.contextPath }/buyForm.do";
						frm.attr("action",url);
						frm.submit();
					}
				});
			});
			</script>
    	</div>
	</div>
</div>
</div>
<br><br>


<div class="container">

  <ul class="nav nav-tabs" role="tablist">
     <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#section1">상품 상세</a>
    </li>
    <li class="nav-item">
       <a class="nav-link" data-toggle="tab" href="#section2">상품평</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#section3">상품문의</a>
    </li>
  </ul>

 <div class="tab-content">
  <div id="section1" class="container tab-pane active">
			
  
	
  <b>필수 표기정보</b>
  <table class="table table-bordered">
  	<tr>
  		<td width="15%" style="background-color:#D5D5D5">품명 및 모델명</td>
  		<td width="35%">${joinCategory.product_name}</td>
  		<td width="15%" style="background-color:#D5D5D5">출시일</td>
  		<td width="35%">${joinCategory.release_date}</td>
  	</tr>
  	<tr>
  		<td width="15%" style="background-color:#D5D5D5">제조국 (원산지)</td>
  		<td width="35%">${joinCategory.country}</td>
  		<td width="15%" style="background-color:#D5D5D5">크기</td>
  		<td width="35%">${joinCategory.real_size}</td>
  	</tr>
  </table>
  
  	<div>
  			<c:forEach var='deImg' items='${detailImgList }' varStatus="vs">
  				<img  src="${path }/resources/upload/productDetailImg/${deImg.new_p_detail_img_path }" alt="상세상품"/>
  			</c:forEach>
 	</div>
  </div>
  <div id="section2" class="container tab-pane fade">
			
 
 <hr>
 <h4>상품평</h4> <input type="button" value="테스트" onclick="fn_productReview()"/>
 <script>
	function fn_productReview(){
		location.href="${pageContext.request.contextPath}/productReviewTest.do?product_code=${joinCategory.product_code}";
	}
</script>
 <%-- <div> 
	 <c:set var="total" value="0"/>
	 <c:forEach var="review" items="${reviewList}" varStatus="vs">
		<c:set var="total" value="${(total+review.review_star)}"/>
		<c:set var="count" value="${vs.count }"/>
	 </c:forEach>
	 <c:out value="${total/count}"/>
	 <span class="star-prototype">${total/count}</span>
	 참여인원:<c:out value="${count }"/>
 </div> --%>

 <div>상품평 이미지</div>
   <c:forEach var='imgList' items='${reviewImgList}' varStatus="vs">
		<img width="10%" height="10%" src="${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}"/>				
	</c:forEach>
	<hr>
   <div> 
 <c:forEach var="review" items="${reviewList}">
 <c:set var="flag" value="true"/>
 	
	 작성자:${review.member_id}<br>
	별점:<span class="star-prototype">${review.review_star }</span><br>
	 작성일:${review.review_date} <br> 
	
	 <c:forEach var='imgList' items='${reviewImgList}' varStatus="vs">
		<c:if test="${review.review_code eq imgList.review_code }">
			<img width="10%" height="10%" src="${pageContext.request.contextPath }/resources/upload/productReviewImg/${imgList.new_review_img_path}"/>				
		</c:if>
	</c:forEach>
		<br>	 	 
	 내용 :${review.review_content} <br>	

	

	 <div>
	 	<input type="hidden" name="review_code" value="${review.review_code }"/> 
	 	

		<c:forEach var="likeList" items='${likeList }' varStatus="vs">
			<c:if test="${likeList.review_code eq review.review_code and likeList.member_id eq memberLoggedIn.member_id }">
			<c:set var="flag" value="false"/>	
				<c:choose>
				<c:when test="${likeList.like_status eq 'Y' }">
					<i class="far fa-thumbs-up like" style="cursor:pointer; font-size:25px; color:#1E96FF"></i>					
					<i class="far fa-thumbs-down dislike"  style="cursor:pointer; font-size:25px; color:#bebebe"></i>			
				</c:when>
				<c:when test="${likeList.like_status eq 'N' }">
					<i class="far fa-thumbs-up like" style="cursor:pointer; font-size:25px; color:#bebebe"></i>				
					<i class="far fa-thumbs-down dislike"  style="cursor:pointer; font-size:25px; color:#FF3232"></i>					
				</c:when>
				</c:choose>
			</c:if>

		</c:forEach>		
	
	
		<c:if test="${flag =='true'}">
			<i class="far fa-thumbs-up like" style="cursor:pointer; font-size:25px; color:#bebebe"></i>
			
			<i class="far fa-thumbs-down dislike"  style="cursor:pointer; font-size:25px; color:#bebebe"></i>
			
		</c:if>
		
		
		
		
	 </div>
	 		
	 <hr>
 </c:forEach>
<script>
//좋아요
$('.like').on('click',function(){
	var thtag=$(this);
	var member_id="${memberLoggedIn.member_id}";
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else{
		var likeInfo={
				member_id:member_id,
				review_code:$(this).siblings("[name=review_code]").val(),
				like_status:'Y'
		};
		$.ajax({
			url:"${pageContext.request.contextPath}/like.do",
			data:likeInfo,
			success:function(data){
				console.log(data);				
				if(data.result==0){
					alert("버튼에러");
					e.preventDefault();
				}else{
					
					if(data.likeOn==1){
						thtag.css("color", "#1E96FF");
					}else if(data.likeOn==2){
						thtag.css("color", "#bebebe");	
					}else{
						thtag.css("color", "#1E96FF");	
						thtag.siblings(".dislike").css("color", "#bebebe");
					}
			
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


$('.dislike').on('click',function(){
	var thtag=$(this);
	var member_id="${memberLoggedIn.member_id}";
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else{
		var likeInfo={
				member_id:member_id,
				review_code:$(this).siblings("[name=review_code]").val(),
				like_status:'N'
		};
		$.ajax({
			url:"${pageContext.request.contextPath}/like.do",
			data:likeInfo,
			success:function(data){
				if(data.result==0){
					alert("버튼에러");
					e.preventDefault();
				}else{
					if(data.likeOn==1){
						thtag.css("color", "#FF3232");
					}else if(data.likeOn==2){
						thtag.css("color", "#bebebe");	
					}else{
						thtag.css("color", "#FF3232");	
						thtag.siblings(".like").css("color", "#bebebe");
					}
					
					
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
</script>
 <script>
//별점
$.fn.generateStars = function() {
 return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};

//숫자 평점을 별로 변환하도록 호출하는 함수
$('.star-prototype').generateStars();
 
 </script>
 </div>
  상품평 페이징 처리
  
   </div>
   <div id="section3" class="container tab-pane fade">
			
  
  <hr>
  상품문의
  <div class="container">
 <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Question</strong></span> 
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea  style="width: 1100px" rows="3" cols="30" id="p_question_content" name="p_question_content" placeholder="문의사항을 입력하세요"></textarea>
                            <br>
                            <div>
                            <input type="hidden" id="product_code" name="product_code" value="${joinCategory.product_code }" />        
							<input type='hidden' id="member_id" name='member_id' value='${memberLoggedIn.member_id}'/>
							<input type='hidden' id="member_level" name='member_level' value='${memberLoggedIn.member_level}'/>							
							<input type='hidden' name='question_level' value='1'/>
							<input type='hidden' name='p_question_code_ref' value='0' />
                            <input type="button" class="btn pull-right btn-success input" value="등록"  />                
                            </div>
                        </td>
                    </tr>
                </table>
                
            </div>
        </div>
  </form>
  
  </div>
		<div id="comment-container">
			<table id="tbl-comment">
				    <%
				    if(questionList != null){
				        for(ProductQuestion productQuestion : questionList)
				        {
				       	 if(productQuestion.getQuestion_level()==1){%>
					    <tr class='level1'>
					        <td>
					            <sub class=comment-writer><%=productQuestion.getMember_id() %></sub>
					            <sub class=comment-date><%=productQuestion.getQuestion_date()%></sub>
						    <br /> <br />
					            <%=productQuestion.getP_question_content() %>
							</td>
					        <td>
					            <button class="btn btn-outline-success btn-sm" value="<%=productQuestion.getP_question_code()%>">답글</button>
					            <button class="btn btn-outline-dark btn-sm delete" value="<%=productQuestion.getP_question_code()%>">삭제</button>
					        </td>
					        
					    </tr>
				  		<%}
				        else
				        {%>
				        	<tr class='level2'>
				        		<td style="padding-left: 40px">
				        			<sub><%=productQuestion.getMember_id()%></sub>
				        			<sub><%=productQuestion.getQuestion_date()%></sub>
				        			<br>
				        			<%=productQuestion.getP_question_content()%>
				        		</td>
				        		<td></td>
				        	</tr>
				        	
				     	<% }
				        
				    	}   
				   } %>
				 	
			        <script>
			      		var logIn="<c:out value='${memberLoggedIn.member_id}'/>";
			        	$(".btn-outline-success").on('click',function(e){
			        		if(logIn!=null){
			        		//화면에 출력될 답글 입력창 만들기
			        		var tr=$("<tr></tr>");	//태그생성
			        		var html="<td style='display:none;text-align:left;' colspan=2>";
			        		html+='<form id="answerForm" name="answerForm" method="post">';
			        		html+="<input type='hidden' name='product_code' value='${joinCategory.product_code }'/>";
			        		html+="<input type='hidden' name='member_id' value='${memberLoggedIn.member_id}'/>";
			        		html+="<input type='hidden' name='question_level' value='2'/>";
			        		html+="<input type='hidden' name='p_question_code_ref' value='"+$(this).val()+"'/>";			        		
			        		html+="<textarea name='p_question_content' cols='60' rows='1'></textarea>";
			        		html+="<input type='button' class='btn-insert2 answer' value='등록'/>";
			        		html+="</form></td>";
			        		//위에서 작성한 html구문을 tr 변수 text노드에 삽입
			        		tr.html(html);
			        		//작성된 tr 태그를 본 html 구문의 (tr class=level1) 뒤에 삽입
			        		tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			        		//이벤트가 1회만 발생하게 제한
			        		$(this).off('click');
			        		//답글달고 버튼을 누르면 해당 서블릿에 데이터 전송
			        		tr.find('form').submit(function(e){
			        			if(logIn==null){
			        				fn_loginAlert();
			        				e.preventDefault();
			        			}	
			        			var len=$(this).children('textarea').val().trim().length;
			        			if(len==0){
			        				e.preventDefault();
			        				tr.find('textarea').focus();
			        			}
			        		});
			        		}
			        	});
			        
			        </script>
   				 </table>
   		</div> 
	</div>
</div>
<script>
//문의사항 등록
$(document).on("click",".input",function(){
	var formData = $("#commentForm").serialize();
	var member_id=$('#member_id').val();
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else{
		
		$.ajax({
			url:"${pageContext.request.contextPath}/addQuestion.do",
			data:formData,
			success:function(data){
				console.log(data);							
				$("#p_question_content").val("");
				$("#comment-container").html(data);
					

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
//삭제
$(document).on("click",".delete",function(e){
	alert("!!!삭제버튼");
	var p_question_code = $(this).val();
	var product_code=$('#product_code').val();
	var member_level=$('#member_level').val();
	var member_id=$('#member_id').val();
	var writer= $(this).parent().parent().find(".comment-writer").html();
	
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else if(member_level=='admin' || member_id==writer){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/deleteQuestion.do",
			data:{ p_question_code:p_question_code,
					product_code:product_code},
			success:function(data){
				console.log(data);							
				$("#p_question_content").val("");
				$("#comment-container").html(data);
					

			},
			error:function(jpxhr,textStatus,errormsg){
				console.log("ajax전송실패.");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		});
	}else{
		
		alert("관리자나 자신의 글만 삭제가능")
	}
});
//답글

$(document).on("click",".answer",function(e){
	var formData = $("#answerForm").serialize();
	var member_id=$('#member_id').val();
	var member_level=$('#member_level').val();
	if(member_id==null||member_id.length<1){
		alert("로그인 후 이용해주시기 바랍니다.");
		e.preventDefault();
	}else if(member_level=='admin'){
		$.ajax({
			
			url:"${pageContext.request.contextPath}/addQuestion.do",
			data:formData,
			success:function(data){		
					$("#p_question_content").val("");
					$("#comment-container").html(data);
			},
			error:function(jpxhr,textStatus,errormsg){
				console.log("ajax전송실패.");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		});
	}else{
		alert("관리자만 답변가능");
	}
});

function changeImg(src) {
	var img1 = document.getElementById("mainImg");
	img1.src = src;
	
}
</script>

 
  
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />