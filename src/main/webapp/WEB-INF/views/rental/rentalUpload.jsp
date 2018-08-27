<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script src="${path }/resources/js/summernote-ko-KR.js"></script>

<!-- 달력 -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/daterangepicker.css" />

<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
input[name="datetimes"]{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
input[name="datetimes"]{cursor: pointer;}
</style>
      
<style>
.tr1 th{text-align:center;background-color:#E1F6FA}
.tr2 td{vertical-align:middle;text-align:center;}
</style>


<div class='container' >
    <form id="form" action="${path }/rentalWrite2.do" method="post" enctype="multipart/form-data" onsubmit="return FormSubmit();">
  
		<%-- <input type="hidden" name="rental_obj_code" value="${param.rental_obj_code }" /> --%>
		<input type="hidden" id="content" name="content" value="" />
		<input type="hidden" id="start_date" name="start_date" value="" />
		<input type="hidden" id="end_date" name="end_date" value="" />
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
				<th style="text-align: center;border-left:none;">회원아이디</th>
				<td>	
					<input type="text" class="form-control" name="member_id" value="${memberLoggedIn.member_id }" id="member_id" readonly="readonly">
				</td>
			</tr>        
	        <tr class="tr1">
				<th style="text-align: center;border-left:none;">연락처</th>
				<td>	
					<input type="text" class="form-control" name="phone" id="phone" required>
				</td>
			</tr>  
	        <tr class="tr1">
				<th style="text-align: center;border-left:none;">상품명</th>
				<td>	
					<input type="text" class="form-control" name="title" id="title" required>
				</td>
			</tr>
			<tr class="tr1">
				<th style="text-align: center;border-left:none;">24시간 대여가격</th>
				<td>	
					<input type="number"  class="form-control" name="price" id="price" required>
				</td>
			</tr> 
			<tr class="tr1">
				<th style="text-align: center;border-left:none;">주소</th>
				<td>
					<input class="form-control" name="post_no" style="width: 40%; display: inline-block;" type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input class="form-control" name="address" type="text" id="sample6_address" placeholder="주소" readonly="readonly">
					<input class="form-control" name="detail_address" type="text" id="sample6_address2" placeholder="상세주소">
				</td>
			</tr>
			<tr class="tr1">
				<th style="text-align: center;border-left:none;">대여기간</th>
				<td>
					<input type="text" name="datetimes" placeholder="Select value" class="form-control" />
				</td>
			</tr>
			<tr class="tr1">
				<th style="text-align: center;border-left:none;">게시판글</th>
				<td>
                    <span style="color: tomato;"><span>✔</span>이미지 입력시 게시판글의 이미지버튼을 클릭하여 주십시오.</span>
					<textarea class="form-control" id="summernote" placeholder="글내용" maxlength="500" style="height: 350px;"></textarea>
				</td>
			</tr>
        </table>
        <br>
		<br>
		<button class="btn btn-primary " name="button" type="button" onclick="bbsWrite();">저장</button> 
		<button id="hiddenBtn" type="submit" style="display: none;"></button>
		<input type="button"  class="btn btn-default" onclick="location.href='${path}/rentalMain.do'" value="취소"> 
    </form>
</div>

<script>
	$(function() {
	  $('input[name="datetimes"]').daterangepicker({
	    timePicker: true,
	    startDate: moment().startOf('hour'),
	    endDate: moment().startOf('hour').add(32, 'hour'),
	    minDate: new Date,
	    locale: {
	        format: 'YYYY-MM-DD HH:mm:ss'
	      }
	  });
	});
	  $('input[name="datetimes"]').change(function(){
			var odate = $(this).val();
			$("#start_date").val(odate.substring(0,19));
			$("#end_date").val(odate.substring(22,42));
	  });
</script>

<!-- 주소검색 -->  
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
  
    <script>
    $(document).ready(function() {
      $('#summernote').summernote({
        placeholder: '사진 또는 게시글을 등록하여 주십시오',
        tabsize: 2,
        height: 400,
        minHeight:400,
        maxHeight:400,
        lang:'ko-KR',
        focus:false,
        toolbar: [
            ["style", ["style"]],
            ["font", ["bold", "italic", "underline", "clear"]],
            ["fontsize", ["fontsize"]],
            ["para", ["ul", "ol", "paragraph"]],
            ["insert", ["link", "picture", "hr"]]
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
    	var content2 = $("#content");
    	
    	var phone=$("#phone");
    	var title=$("#title");
    	var price=$("#price");
    	var datef=$('input[name="datetimes"]');
    	var address=$("sample6_address");
    	var address2=$("sample6_address2");
     	if(phone.val()==0){
     		phone.focus();
     		return false;
     	} else if(title.val()==0) {
     		title.focus();
     		return false;
     	} else if(price.val()==0) {
     		price.focus();
     		return false;
     	} else if(address.val()==0){
     		address.focus();
     		return false;
     	} else if(address2.val()==0){
     		address2.focus();
     		return false;
     	} else if(datef.val()==0){
     		datef.focus();
     		return false;
     	} else if(content2.val()==0) {
     		content2.focus();
     		return false;
     	} else {
     		document.getElementById('hiddenBtn').click();
     	}
    	
    }
    </script>

<script type="text/javascript" src="${path }/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/daterangepicker.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />


