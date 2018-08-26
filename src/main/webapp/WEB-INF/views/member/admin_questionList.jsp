<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/member/commonAdminpage.jsp"></jsp:include>


<div class = "col-10">
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">1:1문의 답변</a>
			</div>
			
			<hr>
			<style>
			
				.mypage_wrap {
					padding-bottom: 100px;
					background : #fcfcfb;
					overflow: hidden;
				}
				
				.mypage_wrap2 {
					padding-bottom: 100px;
					background : #fcfcfb;
					overflow: hidden;
				}
				
				
				.mypage_title02 {
					margin-top: 0;
					padding : 0 10px;
					font-size: 20px;
					line-height: 79px;
					font-weight: bold;
					text-align: left;
				}
				
				.order_board{
					width:100%;
					font-size : 15px;
					line-height: 18px;
					table-layout: fixed;
					word-wrap : break-word;
				}
				
				
				.order_board th {
					padding: 21px 0;
					background: #b5babd;
					color : #fff;
					font-weight: bold;
					text-align: center;
					border-left : 1px solid #eaeaea;
				}
				
				.order_board td {
					padding: 23px 0;
					border-bottom:1px solid #eaeaea;
					background:#fcfcfb;
					text-align:center;
				}
			</style>
			<div class = "mypage_wrap">
				<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 1:1문의 답변</h2>
				<table class = "order_board">
					<colgroup>
						<col style = "width:10%;">
						<col style = "width:20%;">
						<col style = "width:25%;">
						<col style = "width:45%;">
						<col style = "width:20%;">

					</colgroup> 
					<thead>
					<tr>
						<th scope="col" class = "#">번호</th>
						<th scope="col" class = "#">ID</th>
						<th scope="col" class = "#">작성일</th>
						<th scope="col" class = "#">내용</th>
						<th scope="col" class = "#">답변여부</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list" varStatus="vs">
							<tr class ="memberManage" style="cursor:pointer;">
								<td class="question_code"><c:out value="${list.question_code}"/></td>
								<td><c:out value="${list.member_id }"/></td>
								<td><c:out value="${list.question_date }"/></td>
								<td>
									<span class="qContent">
										<c:out value="${list.question_content }"/>
									</sapn>
								</td>
								<td>${list.status=='Y'?"답변완료":"답변미완료"}</td>
							</tr>
						</c:forEach>									
					</tbody>
					
				</table>
				<br>
				

				<!-- <div style="position:relative; top:30px;"> -->
<style>
.search_btn {
	width : 50px;
	height : 30px;
	border: none;
	background: #b5babd;
	color : #fff;
	font-size : 15px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor:pointer;
	float:right;
}
.qContent { 
	display: inline-block; 
	width: 200px; 
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis;

}
</style>
				
				
				
				<div class = "row">
				
				
				
				
				<div class = "col-3" style = "margin-left : 20px;">
					<input type="text" name="searchInfo" id="searchInfo" style="border:solid #b5babd; font-size:15px" placeholder="ID 검색" /> 
					<button type="button" onclick="searchMember()" class="search_btn">검색</button>
				</div>
				
				<div class = "col-6">
					
				${pageBar }
				</div>
				</div>
				
			
			</div>
			
			<div style = "height : 50px;">
			
			</div>


			
			
		</div>
	
	
	</div>


</div>


<script>
	$(function(){
		$('.memberManage').hover(function(){
				$(this).children().attr("style","background-color:#c8c8c8;");
			},function(){
				$(this).children().attr("style","background-color:#fcfcfb;");
			});
		
		
		$('.memberManage').click(function(){
			var code = $(this).children('.question_code').html();
			location.href="${pageContext.request.contextPath }/adminSelectedQuestion.do?question_code="+code; 
		});
	});
	
	
	function searchMember() {
		var info = $('#searchInfo').val();
		location.href="${pageContext.request.contextPath}/searchMember.do?info="+info;
	}
	
	$("#searchInfo").keyup(function(e){
		if(e.keyCode == 13) { 
			searchMember(); 
		}
	});
	
	
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>