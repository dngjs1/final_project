<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/member/commonAdminpage.jsp"/>

		<div class = "col-10">
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">회원관리</a>
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
					color : #black;
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
				<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 회원관리</h2>
				<table class = "order_board">
					<colgroup>
						<col style = "width:5%;">
						<col style = "width:10%;">
						<col style = "width:10%;">
						<col style = "width:10%;">
						<col style = "width:20%;">
						<col style = "width:10%;">
						<col style = "width:15%;">
						<col style = "width:10%;">
					</colgroup> 
					<thead>
					<tr>
						<th scope="col" class = "#">번호</th>
						<th scope="col" class = "#">ID</th>
						<th scope="col" class = "#">이름</th>
						<th scope="col" class = "#">성별</th>
						<th scope="col" class = "#">이메일</th>
						<th scope="col" class = "#">회원등급</th>
						<th scope="col" class = "#">가입일</th>
						<th scope="col" class = "#">상태</th>
						
						<!-- <th scope="col" class = "#">ID</th>
						<th scope="col" class = "#">이름</th>
						<th scope="col" class = "#">생년월일</th>
						<th scope="col" class = "#">성별</th>
						<th scope="col" class = "#">전화번호</th>
						<th scope="col" class = "#">우편번호</th>
						<th scope="col" class = "#">주소</th>
						<th scope="col" class = "#">상세주소</th>
						<th scope="col" class = "#">이메일</th>
						<th scope="col" class = "#">이메일수신여부</th>
						<th scope="col" class = "#">회원등급</th>
						<th scope="col" class = "#">가입일</th>
						<th scope="col" class = "#">상태</th> -->
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${member }" var="m" varStatus="vs">
							<tr class ="memberManage" style="cursor:pointer;">
								<td ><c:out value="${vs.count+10*(cPage-1)}"/></td>
								<td class="clickedId" ><c:out value="${m.member_id }"/></td>
								<td><c:out value="${m.member_name }"/></td>
								<td>${m.gender=='M'?"남자":"여자"}</td>
								<td><c:out value="${m.email }"/></td>
								<td><option value=""><c:out value="${m.member_level }"/></td>
								<td><c:out value="${m.join_date }"/></td>	
								<td>
									<c:if test="${m.esc_status eq 'Y' }">메일미인증</c:if>
									<c:if test="${m.esc_status eq 'E' }">탈퇴</c:if>
									<c:if test="${m.esc_status eq 'N' }">일반</c:if>
								</td>
							</tr>
						</c:forEach>
						
							<%-- <c:forEach items="${member }" var="m" varStatus="vs">
							<tr>
								<td><a href="${pageContext.request.contextPath }/management.do?member_id=${m.member_id}"><c:out value="${m.member_id }"/></a></td>
								<td><c:out value="${m.member_name }"/></td>
								<td><c:out value="${m.birthday }"/></td>
								<td>${m.gender=='M'?"남자":"여자"}</td>
								<td><c:out value="${m.phone }"/></td>
								<td><c:out value="${m.post_no }"/></td>
								<td><c:out value="${m.address }"/></td>
								<td><c:out value="${m.detail_address }"/></td>
								<td><c:out value="${m.email }"/></td>
								<td><c:out value="${m.email_alarm }"/></td>
								<td><option value=""><c:out value="${m.member_level }"/></td>
								<td><c:out value="${m.join_date }"/></td>	
								<td>
									<c:if test="${m.esc_status eq 'Y' }">메일미인증</c:if>
									<c:if test="${m.esc_status eq 'E' }">탈퇴</c:if>
									<c:if test="${m.esc_status eq 'N' }">일반</c:if>
								</td>
							</tr>
						</c:forEach> --%>
												
					</tbody>
					
				</table>
				<br>
				

				<!-- <div style="position:relative; top:30px;"> -->
<style>
.search_btn {
	width : 50px;
	height : 30px;
	border: none;
	border-color : #28a745;
	color : #28a745;
	border-radius : .25rem;
	font-size : 15px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	cursor:pointer;
	float:right;
}

.search_btn:hover {
	background-color : #28a745;
	color : black;
}
</style>
				
				
				
				<div class = "row">
				
				
				
				
				<div class = "col-3">
					<input type="text" name="searchInfo" id="searchInfo" style="border:solid #b5babd; font-size:15px" placeholder="ID 검색" /> 
					<button type="button" onclick="searchMember()" class="search_btn"><i class ="fas fa-search"></i></button>
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
			var id = $(this).children('.clickedId').html();
			location.href="${pageContext.request.contextPath }/management.do?member_id="+id; 
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

<jsp:include page="/WEB-INF/views/common/footer.jsp" />