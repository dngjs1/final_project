<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
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
	padding-bottom : 5px;
	font-size : 26px;
	line-height: 38px;
	font-weight: bold;
	

}

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
		
	}
</style>

<c:set var='path' value="${pageContext.request.contextPath}" />
<div class = "container">
 <form name="productReview" action="${path}/productReviewInsert.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
 	  <input name="product_code" type="hidden" value="${product_code}"/>
 	  <input name="member_id" type="hidden" value="${memberLoggedIn.member_id}"/>
 	  
 	  <!-- 타이틀 부분 -->
 	  <h2 class = "product_review">
 	  
 	  <i class="fas fa-chalkboard-teacher"></i> 구매후기 작성
 	  
 	  </h2>
 	  
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
 	  			border: 1px solid #ddd;

 	  			padding-top : 10px;
 	  			padding-bottom: 6px;
 	  			margin-left : 1px;
 	  			margin-bottom : 10px;
 	  		}
 	  		
 	  		.starRev {
 	  			
 	  			
 	  		}
 	  	</style>
 	  	<div class = "write_review_box row">
 	  	
 	  		<div class="starRev col-2">
			  <span class="starR">1</span>
			  <span class="starR">2</span>
			  <span class="starR">3</span>
			  <span class="starR">4</span>
			  <span class="starR">5</span>
			</div>
			<input type="hidden" class="form-control" name="review_star" id="review_star" required>
			<div class = "col-6">
			<input type="text" class="form-control" name="review_content" id="review_content" placeholder="내용" required>
			</div>
 	  	</div>
 	  	
 	  	<style>
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
 	  	
 	  	    <a href="#this" id="add1" class="btn1">사진 추가하기</a>
	        <a href="#this" name="delete1" class="btn1">삭제하기</a>
	        
	        
 	  	</div>
 	  
 	  </div>
 	  
       
       <!-- 원래 있었던 코드부분 -->
    	 <!-- <div id="fileDiv1">
	       	<input multiple="multiple" type="file" accept=".jpg, .png" class="addfile1" name="file_1" />
	        <a href="#this" name="delete1" class="btn1">삭제하기</a>
        </div>-->
       
        
       
 	
 	<!--  <h3>상품평 작성</h3>
        <hr style="border:1px solid #2e2e2e;">       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">	
             
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
        
		<a onclick = "submit" class = "btn" id = "submit_btn_black">
			<input type="submit" value = "작성완료" class="btn" style = " background-color:black; color : white; font-weight: bold; width:134px;"/> 
		</a>
        
 </form>
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

 </script>
<script type="text/javascript">
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />