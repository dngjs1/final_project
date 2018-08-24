<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>

<style>
.tr1 th{text-align:center;background-color:#E1F6FA}
.tr2 td{vertical-align:middle;text-align:center;}
</style>


<div class='container' >
    <form name="fileForm" action="${path }/updateProductEnd.do" method="post" onSubmit="return validate();" enctype="multipart/form-data">
  		<input type="hidden" name="product_code" value="${joinCategory.product_code}"/>
  		<c:forEach var="imgList" items="${imgList}">
  			<input type="hidden" name="p_img_code" value="${imgList.p_img_code}"/>  		
  		</c:forEach>
  		<c:forEach var="detailImgList" items="${detailImgList}">
  		<input type="hidden" name="p_detail_img_code" value="${detailImgList.p_detail_img_code}"/>
  		</c:forEach>
  		<c:forEach var="optionList" items="${optionList}">
  		<input type="hidden" name="product_option_code" value="${optionList.product_option_code}"/>
  		</c:forEach>
        <br>
        <h3>상품수정</h3>
        <hr style="border:2px solid #787878"><br>       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">	
         
        <tr class="tr1">
			<th style="text-align: center;border-left:none;">상품명</th>
			<td>	
			<input type="text" class="form-control" name="product_name" id="product_name" value="${joinCategory.product_name}" required>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">가격</th>
			<td>	
			<input type="number"  class="form-control" name="price" id="price" value="${joinCategory.price }" required>
			</td>
		</tr> 
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">출시일</th>
			<td>	
			<input type="date" class="form-control"  name="release_date" id="release_date" value="${joinCategory.release_date}" required>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">제조국</th>
			<td>	
			<input type="text" class="form-control" name="country" id="country" value="${joinCategory.country}" required>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">크기</th>
			<td>
			 <input type="text"  class="form-control" name="real_size" id="real_size" value="${joinCategory.real_size}"> 
			</td>
		</tr>
		<tr  class="tr1">
			<th style="text-align: center;border-left:none;">사이즈 당 재고</th>
			<td id="size_td">
			<div style="position:relative;">
				<span id="left_amount">
					<input type="hidden" name="size" value="">
					<b>재고: <b></b><input type="number" name="left_amount" required>
				</span>
				<div style="position:absolute;left:480px;top:-8px;"><input type="button" style="height:38px;width:120px;" onclick="size_add()" class="btn" value="사이즈 추가"/>	</div>		
			</div>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">게시판글</th>
			<td>
			<input type="textarea" name="p_board_content" id="p_board_content" class="form-control" value="${joinCategory.p_board_content}">
			</td>
		</tr>
		
        </table>
        <br><br><br>
        
        <h3>상품 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv">
	       	<input multiple="multiple" type="file" class="addfile0" accept=".jpg, .png" name="file_0" />
	        <!-- <a href="#this" name="delete" class="btn">삭제하기</a> -->
        </div>
        <a href="#this" id="add" class="btn">파일 추가하기</a>
        <br><br><br>
        
        
        <h3>상세 설명 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv1">
	       	<input multiple="multiple" type="file" accept=".jpg, .png" class="addfile1" name="file_1" />
	        <!-- <a href="#this" name="delete1" class="btn1">삭제하기</a> -->
        </div>
        <a href="#this" id="add1" class="btn1">파일 추가하기</a>
        <br><br><br>
        
        <input type="submit" value="등록" class="btn" />     
    </form>
</div>

<script type="text/javascript">


function size_add(){
	$('#left_amount').remove();
	var size_put="<span class='size_del'><b>치수: </b><input type='text'  name='size' required> <b>재고: </b><input type='number' name='left_amount' required>	<input type='button' style='height:38px;width:100px;' onclick='size_delete($(this))' class='btn' value='삭제하기'/><br><br></span>";
	$('#size_td').append(size_put);
}
function size_delete(e){
	e.parent().remove();
}

var add_count=1;
var add_count1=1;
$(document).ready(function(){
	$("#add").on("click",function(e){
		add_count=add_count+1;
		if(add_count > 7){
			alert("사진은 최대 7개까지 올릴 수 있습니다.");
			return false;
		}
		var file_name=document.getElementsByName('file_0');
		for(var i=0;i<file_name.length;i++){
			if(file_name[i].value.length<1){
				alert("사진파일을 전부 올리셔야 추가가 가능합니다.");
				return false;
			}
		}
		fn_fileAdd();
	});
	$("a[name='delete']").on("click",function(e){
	       fn_fileDelete($(this));
	});
	$("#add1").on("click",function(e){
		add_count1=add_count1+1;
		if(add_count1 > 7){
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
function fn_fileAdd(){
    var str = "<p><input type='file' class='addfile0' accept='.jpg, .png' name='file_0'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
    $("#fileDiv").append(str);
     
    $("a[name='delete']").on("click",function(e){
        fn_fileDelete($(this));         
    });
}
function fn_fileAdd1(){
    var str = "<p><input type='file' class='addfile1' accept='.jpg, .png' name='file_1'/><a href='#this' name='delete1' class='btn'>삭제하기</a></p> ";
    $("#fileDiv1").append(str);
     
    $("a[name='delete1']").on("click",function(e){
        fn_fileDelete($(this));         
    });
}
 
function validate(){
	if(!$('.addfile0').val().length){
	 	alert("상품사진은 반드시 한개 이상 추가해야 합니다.");
		return false;
	}
	if(!$('.addfile1').val().length){
		alert("상세설명사진은 반드시 한개 이상 추가해야 합니다.");
		return false;
	}
	var file_name0=document.getElementsByName('file_0');
	for(var i=0;i<file_name0.length;i++){
		if(file_name0[i].value.length<1){
			alert("추가되어있는 사진파일을 전부 올리셔야 합니다.");
			return false;
		}
	}
	var file_name1=document.getElementsByName('file_1');
	for(var i=0;i<file_name1.length;i++){
		if(file_name1[i].value.length<1){
			alert("추가되어있는 사진파일을 전부 올리셔야 합니다.");
			return false;
		}
	}
	return true;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />