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
				<a href = "#">1:1 문의</a>
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
					background: #ddd;
					color : black;
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
				.insert_btn {
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
					width:12%;
					margin-top:1%;				
				}
				.qContent { 
					display: inline-block; 
					width: 200px; 
					white-space: nowrap; 
					overflow: hidden; 
					text-overflow: ellipsis;
				
				}
				
			</style>
			
			<script>
				function writeQuestion() {
					location.href="${pageContext.request.contextPath}/writeQuestion.do";
				}
				
				$(function(){
					$('.memberManage').hover(function(){
							$(this).children().attr("style","background-color:#c8c8c8;");
						},function(){
							$(this).children().attr("style","background-color:#fcfcfb;");
					});
				$('.memberManage').click(function(){
					var code = $(this).children('.question_code').html();
				 	location.href="${pageContext.request.contextPath }/selectedQuestion.do?question_code="+code; 
					});
				});
			</script>
			<style>
				.column {
					
				}
			</style>
			
			
						<div class = "mypage_wrap">
				
					<h2 class = "mypage_title02" style="display:inline;"><i class="card_buy far fa-credit-card"></i>1:1 문의 내역</h2>
				 		<!-- <button type="button" onclick="writeQuestion()" class="insert_btn" style="position: relative; top:20px; right:20px;" >문의하기</button> -->
				
				
				<table class = "order_board">
					<colgroup>
						<col style = "width:10%;">
						<col style = "width:20%;">
						<col style = "width:50%;">
						<col style = "width:20%;">			
					</colgroup> 
					<thead>
					<tr>
						<th scope="col" class = "column">번호</th>
						<th scope="col" class = "column">작성일</th>
						<th scope="col" class = "column">문의내용</th>
						<th scope="col" class = "column">답변상태</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list" varStatus="vs">
							<tr class="memberManage" style="cursor:pointer;">
								<td scope="col">${vs.count}</td>
								<td scope="col">${list.question_date}</td>
								<td scope="col">
									<span class="qContent"> ${list.question_content}</span>
								</td>
								<td scope="col" style = "font-weight: bold;">${list.status=='Y'?'답변완료':'답변미완료'}</td>
								<td class="question_code">${list.question_code }<td>
							</tr>
						</c:forEach>	
					</tbody>
					
				</table>
				<div>
					<button type="button" onclick="writeQuestion()" class="insert_btn">문의하기</button>
					</div>
				
				<br>
				
<style>


.search_btn {
	width : 50px;
	height : 30px;
	border: none;
	background: #007bff;
	color : #fff;
	font-size : 15px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor:pointer;
	float:right;
}
</style>
		
			<div class = "row">
				<div class = "col-6">
				${pageBar }
				</div>
				</div>
			</div>
		</div>
	</div>
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>