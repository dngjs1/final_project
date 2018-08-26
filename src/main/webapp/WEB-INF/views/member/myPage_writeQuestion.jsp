<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/member/commonMypage.jsp"></jsp:include>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>

	
<div class = "col-10">
	<div class = "location">
		<a href = "#" class = "home"><i class="fas fa-home"></i></a>
		>
		<a href = "#">1:1문의 </a>
</div>

<style>
.tr1 th{text-align:center;background-color:b5babd}
.tr2 td{vertical-align:middle;text-align:center;}
.button_btn {
	width : 70px;
	height : 40px;
	border: none;
	background: #2D2E33;
	color : #fff;
	font-size : 15px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor:pointer;
	float:right;
	margin-left: 10px;
	position: relative;
	
	
	}
</style>


<div class='container' >
    <form id="form" action="${pageContext.request.contextPath }/writeQuestionEnd.do" method="post" enctype="multipart/form-data" onsubmit="return FormSubmit();">
  
	
        <hr style="border:2px solid #787878"><br>       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px; width: 1000px;">	  
	        <tr class="tr1">
				<th style="text-align: center;border-left:none; vertical-align:middle; font-size:15px;">아이디</th>
				<td>	
					<input type="text" class="form-control" name="member_id" value="${memberLoggedIn.member_id }" id="member_id" readonly="readonly">
				</td>
			</tr>        

			<tr class="tr1">
				<th style="text-align: center;border-left:none; vertical-align:middle; font-size:15px;">문의내용</th>
				<td>
					<textarea class="form-control" name="question_content" id="summernote" placeholder="글내용" maxlength="500" style="height: 350px;"></textarea>
				</td>
			</tr>
        </table>
</div>
			<input type="button"  class="button_btn" onclick="location.href='${pageContext.request.contextPath}/question.do'" value="취소"> 
			<input type="submit" class="button_btn" value="작성"/>
		
    </form>

</div>

  <script>
    $(document).ready(function() {
      $('#summernote').summernote({
        placeholder: "",
        tabsize: 2,
        height: 400,
        minHeight:400,
        maxHeight:400,
        lang:'ko-KR',
        focus:false,
        toolbar: [
          ],
        callbacks:{
	          onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
				        sendFile(files[i], this);
		            }
	          }
        }
      });
    });

    function sendFile(file, el) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "${path}/rentalImageUpload.do",
            cache : false,
            contentType : false,
            enctype:'multipart/form-data',
            processData : false,
            success : function(url) {
                $(el).summernote('editor.insertImage', url);
                $('#imageBoard > ul').append('<li><img src="'+url+'" width="150px" height="150px"/></li>');


            }
        });
    }
    function bbsWrite() {
    	var content = $('#summernote').summernote("code");
    	$('#content').val(content);
     
    	document.getElementById('hiddenBtn').click();
    	
    }
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>