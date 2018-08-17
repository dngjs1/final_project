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
			<tr class="tr1">
				<th style="text-align: center;border-left:none;">주소</th>
				<td>
					<input class="form-control" style="width: 40%; display: inline-block;" type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input class="form-control" type="text" id="sample6_address" placeholder="주소">
					<input class="form-control" type="text" id="sample6_address2" placeholder="상세주소">
				</td>
			</tr>
			<tr class="tr1">
				<th style="text-align: center;border-left:none;">대여가능기간</th>
				<td>
					<input type="text" name="datetimes" placeholder="Select value" class="form-control" />
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

<script>
	$(function() {
	  $('input[name="datetimes"]').daterangepicker({
	    timePicker: true,
	    minDate: new Date
	  });
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
  
<!-- 파일업로드 -->
<script type="text/javascript">
// Initialize the widget when the DOM is ready
$(function() {
	$("#uploader").plupload({
		// General settings
		runtimes : 'html5,flash,silverlight,html4',
		url : 'upload',

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

<script type="text/javascript" src="${path }/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/daterangepicker.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />


