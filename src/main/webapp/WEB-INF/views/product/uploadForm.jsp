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
    <form name="fileForm" action="${path }/upload.do" method="post" onSubmit="return validate();" enctype="multipart/form-data">
  
        <br>
        <h3>상품등록</h3>
        <hr style="border:2px solid #787878"><br>       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px;">	
        <tr class="tr1">
			<th style="text-align: center;border-left:none;">카테고리</th>
			<td>	
			<select name="p_category_code" class="form-control" style="width:500px;">
     			<c:forEach var='category' items='${categoryList}' varStatus="vs">
                  <option value="${category.p_category_code}">${category.p_category_name }</option>
				</c:forEach>	
        </select>
			</td>
		</tr>       
        <tr class="tr1">
			<th style="text-align: center;border-left:none;">상품명</th>
			<td>	
			<input type="text" class="form-control" name="product_name" id="product_name" required>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">가격</th>
			<td>	
			<input type="number"  class="form-control" name="price" id="price" required>
			</td>
		</tr> 
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">출시일</th>
			<td>	
			<input type="date" class="form-control"  name="release_date" id="release_date" required>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">제조국</th>
			<td>	
			<input type="text" class="form-control" name="country" id="country" required>
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">크기</th>
			<td>
			 <input type="text"  class="form-control" name="real_size" id="real_size" value="상품 상세 정보 확인"> 
			</td>
		</tr>
		<tr  class="tr1">
			<th style="text-align: center;border-left:none;">사이즈 당 재고</th>
			<td id="size_td">	
				<b>치수: </b>
				<input type="text"   name="size" id="size"> 
				<b>재고: <b></b><input type="number" name="left_amount"	id="left_amount">
				<input type="button" style="height:38px;width:120px;" onclick="size_add()" class="btn" value="사이즈 추가"/>			
			</td>
		</tr>
		<tr class="tr1">
			<th style="text-align: center;border-left:none;">게시판글</th>
			<td>
			<input type="textarea" name="p_board_content" id="p_board_content" class="form-control">
			</td>
		</tr>
		
        </table>
        <br><br><br>
        
        <h3>상품 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv">
	       	<input multiple="multiple" type="file" class="addfile0" accept=".jpg, .png" name="file_0" />
	        <a href="#this" name="delete" class="btn">삭제하기</a>
        </div>
        <a href="#this" id="add" class="btn">파일 추가하기</a>
        <br><br><br>
        
        
        <h3>상세 설명 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv1">
	       	<input multiple="multiple" type="file" accept=".jpg, .png" class="addfile1" name="file_1" />
	        <a href="#this" name="delete1" class="btn1">삭제하기</a>
        </div>
        <a href="#this" id="add1" class="btn1">파일 추가하기</a>
        <br><br><br>
        <script>
               
        function size_add(){
        	var size_put="<span class='size_del'><br><br><b>치수: </b><input type='text'  name='size' id='size' required> <b>재고: </b><input type='number' name='left_amount' id='left_amount' required>	<input type='button' style='height:38px;width:100px;' onclick='size_delete($(this))' class='btn' value='삭제하기'/><br></span>";
			$('#size_td').append(size_put);
        	
        }
        function size_delete(e){
        	e.parent().remove();
        }
        </script>
        
        
        <input type="submit" value="등록" class="btn" />     
    </form>
</div>

<script type="text/javascript">
var g_count=1;
$(document).ready(function(){
	$("#add").on("click",function(e){
		e.preventDefault();
		fn_fileAdd();
	});
	$("a[name='delete']").on("click",function(e){
	       e.preventDefault();
	       fn_fileDelete($(this));
	   });
});
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
function fn_fileAdd(){
    var str = "<p><input type='file' class='addfile0' accept='.jpg, .png' name='file_0'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
    $("#fileDiv").append(str);
     
    $("a[name='delete']").on("click",function(e){
        e.preventDefault();
        fn_fileDelete($(this));         
    });
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
	if(!$('.addfile0').val().length){
	 	alert("상품사진은 반드시 한개 이상 추가해야 합니다.");
		return false;
	}
	if(!$('.addfile1').val().length){
		alert("상세설명사진은 반드시 한개 이상 추가해야 합니다.");
		return false;
	}
	return true;
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />