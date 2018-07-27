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
.container {
  margin-right: auto;
  margin-left: auto;
  margin-top: 20px;
}


@media (min-width: 992px) { .container {width: 970px;} }
@media (min-width: 1200px) { .container { width: 1060px; } }

</style>


<div class='container' align='center'>
    <form name="fileForm" action="${path }/upload.do" method="post" enctype="multipart/form-data">
    	<h3>파일업로드</h3>
    	<div id="fileDiv">
        <input multiple="multiple" type="file" name="file_0" />
        <a href="#this" name="delete" class="btn">삭제하기</a>
        </div>
        <a href="#this" id="add" class="btn">파일 추가하기</a>
        <br><br><br>
        <h3>카테고리</h3>
                  카테고리:
                  
      	<select name="p_category_code" class="form-control" style="width:500px;">
     			<c:forEach var='category' items='${categoryList}' varStatus="vs">
                  <option value="${category.p_category_code}">${category.p_category_name }</option>
				</c:forEach>	
        </select>
        
        <br><br><br>
        <h3>상품등록</h3>
        <table>	
        <tr>
			<th>상품명</th>
			<td>	
			<input type="text" class="form-control" name="product_name" id="product_name" >
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>	
			<input type="number"  class="form-control" name="price" id="price">
			</td>
		</tr> 
		<tr>
			<th>출시일</th>
			<td>	
			<input type="date" class="form-control"  name="release_date" id="release_date" >
			</td>
		</tr>
		<tr>
			<th>제조국</th>
			<td>	
			<input type="text" class="form-control" name="country" id="country">
			</td>
		</tr>
		<tr id="size_tr">
			<th>크기</th>
			<td>	
			<input type="text"   name="real_size" id="real_size"> 
			<b>재고:<b></b><input type="number" name="left_amount"	id="left_amount">
			<input type="button" onclick="size_add()" class="btn" value="사이즈 추가"/>
			
			</td>
		</tr>
		<tr>
			<th>게시판글</th>
			<td>
			<input type="textarea" name="p_board_content" id="p_board_content" class="form-control">
			</td>
		</tr>
		
        </table>
        <script>
        function size_add(){
        	var size_put="<tr><th>크기</th><td><input type='text'  name='real_size' id='real_size'> <b>재고:</b><input type='number' name='left_amount' id='left_amount'></tr>";
			$('#size_tr').after(size_put);
        	
        }
        
        </script>
        
        
        <input type="submit" value="전송" class="btn" />     
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
 
 
 function fn_fileDelete(obj){
     obj.parent().remove();
 }
 function fn_fileAdd(){
     var str = "<p><input type='file' name='file_"+(g_count++)+"'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
     $("#fileDiv").append(str);
      
     $("a[name='delete']").on("click",function(e){
         e.preventDefault();
         fn_fileDelete($(this));         
     })
 }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />