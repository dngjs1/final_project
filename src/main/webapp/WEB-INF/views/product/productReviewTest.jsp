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
</style>

<c:set var='path' value="${pageContext.request.contextPath}" />
 <form name="productReview" action="${path}/productReviewInsert.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
 	  <input name="product_code" type="hidden" value="${product_code}"/>
 	  <input name="member_id" type="hidden" value="${memberLoggedIn.member_id}"/>
 	  <h3>상품평 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv1">
	       	<input multiple="multiple" type="file" accept=".jpg, .png" class="addfile1" name="file_1" />
	        <a href="#this" name="delete1" class="btn1">삭제하기</a>
        </div>
        <a href="#this" id="add1" class="btn1">사진 추가하기</a>
        <br><br><br>
       
 	
 	 <h3>상품평 등록</h3>
        <hr style="border:2px solid #787878"><br>       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">	
             
        
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">작성일</th>
			<td>	
			<input type="date" class="form-control"  name="review_date" id="review_date" required>
			</td>
		</tr>
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
        </table>
        <br><br><br>

        <input type="submit" value="등록" class="btn" />   
 </form>
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
	  if($(this).html()==1) $("#review_star").val("1") 
	  else if($(this).html()==2) $("#review_star").val("2")
	  else if($(this).html()==3) $("#review_star").val("3")
	  else if($(this).html()==4) $("#review_star").val("4")
	  else if($(this).html()==5) $("#review_star").val("5");	  
}); 
function validate(){
	if(!$('.addfile1').val().length){
	 	alert("상품사진은 반드시 한개 이상 추가해야 합니다.");
		return false;
	}
	return true;
}
 </script>
  <script type="text/javascript">
var g_count=1;

$(document).ready(function(){
	$("#add1").on("click",function(e){
		e.preventDefault();
		fn_fileAdd1();
	});
	$("a[name='delete1']").on("click",function(e){
		e.preventDefault();
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
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />