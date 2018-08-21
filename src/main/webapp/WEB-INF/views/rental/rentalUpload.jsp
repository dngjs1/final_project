<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<style>
/* 첨부파일을 드래그할 영역의 스타일 */
.fileDrop {
    width: 600px;
    height: 70px;
    border: 2px dotted gray;
    background-color: gray;
}
</style>
<script>
//이미지 파일 여부 판단
function checkImageType(fileName){
    var pattern = /jpg|gif|png|jpeg/i;
    return fileName.match(pattern);
}

// 업로드 파일 정보
function getFileInfo(fullName){
    var fileName, imgsrc, getLink, fileLink;
    // 이미지 파일일 경우
    if(checkImageType(fullName)){
        // 이미지 파열 경로(썸네일)
        imgsrc = "/spring02/upload/displayFile?fileName="+fullName;
        console.log(imgsrc);
        // 업로드 파일명
        fileLink = fullName.substr(14);
        console.log(fileLink);
        // 날짜별 디렉토리 추출
        var front = fullName.substr(0, 12);
        console.log(front);
        // s_를 제거한 업로드이미지파일명
        var end = fullName.substr(14);
        console.log(end);
        // 원본이미지 파일 디렉토리
        getLink = "/spring02/upload/displayFile?fileName="+front+end;
        console.log(getLink);
    // 이미지 파일이 아닐경우
    } else {
        // UUID를 제외한 원본파일명
        fileLink = fullName.substr(12);
        console.log(fileLink);
        // 일반파일디렉토리 
        getLink = "/spring02/upload/displayFile?fileName="+fullName;
        console.log(getLink);
    }
    // 목록에 출력할 원본파일명
    fileName = fileLink.substr(fileLink.indexOf("_")+1);
    console.log(fileName);
    // { 변수:값 } json 객체 리턴
    return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
}
$(document).ready(function(){
    // 파일 업로드 영역에서 기본효과를 제한
    $(".fileDrop").on("dragenter dragover", function(e){
        e.preventDefault(); // 기본효과 제한
    });
    // 드래그해서 드롭한 파일들 ajax 업로드 요청
    $(".fileDrop").on("drop", function(e){
        e.preventDefault(); // 기본효과 제한
        var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
        var file = files[0]; // 첫번째 첨부파일
        var formData = new FormData(); // 폼데이터 객체
        formData.append("file", file); // 첨부파일 추가
        $.ajax({
            url: "${path}/upload/uploadAjax",
            type: "post",
            data: formData,
            dataType: "text",
            processData: false, // processType: false - header가 아닌 body로 전달
            contentType: false,
            // ajax 업로드 요청이 성공적으로 처리되면
            success: function(data){
                console.log(data);
                // 첨부 파일의 정보
                var fileInfo = getFileInfo(data);
                // 하이퍼링크
                var html = "<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
                // hidden 태그 추가
                html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";
                // div에 추가
                $("#uploadedList").append(html);
        }
    });
});

</script>
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

		<div>
		    첨부파일 등록
		    <!-- 첨부파일 등록영역 -->
		    <div class="fileDrop"></div>
		    <!-- 첨부파일의 목록 출력영역 -->
		    <div id="uploadedList"></div>
		</div>
        
        <h3>상품 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv">
	       	<input multiple="multiple" type="file" class="addfile0" name="file_0" />
	        <a href="#this" name="delete" class="btn">삭제하기</a>
        </div>
        <a href="#this" id="add" class="btn">파일 추가하기</a>
        <br><br><br>
        
        
        <h3>상세 설명 사진</h3>
        <hr style="border:2px solid #787878"><br>
    	<div id="fileDiv1">
	       	<input multiple="multiple" type="file" class="addfile1" name="file_1" />
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
    var str = "<p><input type='file' class='addfile0' name='file_0'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
    $("#fileDiv").append(str);
     
    $("a[name='delete']").on("click",function(e){
        e.preventDefault();
        fn_fileDelete($(this));         
    });
}
function fn_fileAdd1(){
    var str = "<p><input type='file' class='addfile1' name='file_1'/><a href='#this' name='delete1' class='btn'>삭제하기</a></p> ";
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