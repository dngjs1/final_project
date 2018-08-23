<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/member/commonMypage.jsp"/>
		
		<div class = "col-10">
			<div class = "location">
				<a href = "#" class = "home"><i class="fas fa-home"></i></a>
				>
				<a href = "#">나의 포인트</a>
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
				<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i>포인트 이용내역</h2>
				<table class = "order_board">
					<colgroup>
						<col style = "width:10%;">
						<col style = "width:30%;">
						<col style = "width:40%;">
						<col style = "width:20%;">			
					</colgroup> 
					<thead>
					<tr>
						<th scope="col" class = "#">번호</th>
						<th scope="col" class = "#">지급일</th>
						<th scope="col" class = "#">증감내용</th>
						<th scope="col" class = "#">증감내역</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${pointList }" var="point" varStatus="vs">
							<tr style="cursor:pointer;">
								<td scope="col">${vs.count}</td>
								<td scope="col">${point.point_date}</td>
								<td scope="col">${point.point_content}</td>
								<td scope="col">${point.point_increase}</td>
							</tr>
						</c:forEach>	
					</tbody>
					
				</table>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />