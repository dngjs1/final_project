<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/member/commonMypage.jsp"/>


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
   
		
        <hr style="border:2px solid #787878; width:1020px; position: relative; right:130px;"><br>       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px; width: 800px;">	  
	        <tr class="tr1">
				<th style="text-align: center;border-left:none; vertical-align:middle; font-size:15px; width: 123px;">아이디</th>
				<td>	
					<input type="text" class="form-control" name="member_id" value="${question.member_id }" id="member_id" readonly="readonly">
				</td>
			</tr>        

			<tr class="tr1">
				<th style="text-align: center;border-left:none; vertical-align:middle; font-size:15px;" >문의내용</th>
				<td>
					<span class="form-control" name="question_content" id="summernote" maxlength="500" style="height: 250px;">
						${question.question_content }
					</span>
				</td>
			</tr>
        </table>
</div>

<c:if test="${!empty answer }">
<div class='container' >
   
		
        <hr style="border:2px solid #787878; width:1020px; position: relative; right:130px;"><br>       
        <table class="table table-bordered tb-basic border-left-0 border-right-0" style="font-size:13px; width: 800px;">	  
	      

			<tr class="tr1">
				<th style="text-align: center;border-left:none; vertical-align:middle; font-size:15px; width: 123px;" >답변 내용</th>
				<td>
					<span class="form-control" name="question_content" id="summernote" maxlength="500" style="height: 250px;">
						${answer.answer_content }
					</span>
				</td>
			</tr>
        </table>
</div>
</c:if>

</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>