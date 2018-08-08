<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path }/resources/js/plupload.full.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path }/resources/js/jquery.ui.plupload.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path }/resources/js/pluploadko.js" charset="UTF-8"></script>
<link type="text/css" rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/smoothness/jquery-ui.min.css" media="screen" />
<link type="text/css" rel="stylesheet" href="${path }/resources//css/jquery.ui.plupload.css" media="screen" />

      
<style>
.tr1 th{text-align:center;background-color:#E1F6FA}
.tr2 td{vertical-align:middle;text-align:center;}
</style>


<div class='container' >
    <form name="fileForm" action="${path }/rentalUpload.do" method="post" onSubmit="return validate();" enctype="multipart/form-data">
  
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
        
		<div id="uploader">
			<p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
		</div>
        <input type="submit" value="등록" class="btn" />     
    </form>
</div>
  
  
<script type="text/javascript">
// Initialize the widget when the DOM is ready
$(function() {
	$("#uploader").plupload({
		// General settings
		runtimes : 'html5,flash,silverlight,html4',
		url : '../upload.php',

		// Maximum file size
		max_file_size : '1000mb',

		// User can upload no more then 20 files in one go (sets multiple_queues to false)
		max_file_count: 20,
		
		chunk_size: '1mb',

		// Resize images on clientside if we can
		resize : {
			width : 200, 
			height : 200, 
			quality : 90,
			crop: true // crop to exact dimensions
		},

		// Specify what files to browse for
		filters : [
			{title : "Image files", extensions : "jpg,gif,png"},
			{title : "Zip files", extensions : "zip,avi"}
		],

		// Rename files by clicking on their titles
		rename: true,
		
		// Sort files
		sortable: true,

		// Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
		dragdrop: true,

		// Views to activate
		views: {
			list: true,
			thumbs: true, // Show thumbs
			active: 'thumbs'
		},

		// Flash settings
		flash_swf_url : '../../js/Moxie.swf',

		// Silverlight settings
		silverlight_xap_url : '../../js/Moxie.xap'
	});
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />


