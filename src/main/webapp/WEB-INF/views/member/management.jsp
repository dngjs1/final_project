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
				.update_btn {
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
				}
			</style>
			<div class = "mypage_wrap">
				<h2 class = "mypage_title02"><i class="card_buy far fa-credit-card"></i> 회원관리</h2>
				<%-- <form action="${pageContext.request.contextPath }/managementEnd.do" method="post"> --%>
				<table class = "order_board">
					 <colgroup>
						<col style = "width:20%;">
						<col style = "width:20%;">
						<col style = "width:20%;">
					</colgroup> 
					<thead>
					<tr>
						<th scope="col" class = "#">ID</th>
						<td>
							<input type="hidden" name="member_id" value="<c:out value="${member.member_id }"></c:out>"/>
							<c:out value="${member.member_id }"></c:out>
						</td>
						<th scope="col" class = "#">우편번호</th>
						<td><c:out value="${member.post_no }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">이름</th>
						<td><c:out value="${member.member_name }"/></td>
						<th scope="col" class = "#">주소</th>
						<td><c:out value="${member.address }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">생년월일</th>
						<td><c:out value="${member.birthday }"/></td>
						<th scope="col" class = "#">상세주소</th>
						<td><c:out value="${member.detail_address }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">성별</th>
						<td>
							${member.gender=='M'?"남자":"여자"}
						</td>
						<th scope="col" class = "#">전화번호</th>
						<td><c:out value="${member.phone }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">가입일</th>
						<td><c:out value="${member.join_date }"/></td>
						<th scope="col" class = "#">이메일</th>
						<td><c:out value="${member.email }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">회원등급</th>
						<td>
							<select name ="member_level" id="level">
								<option value="admin" ${member.member_level=='admin'?"selected":"" }>admin</option>
								<option value="user"  ${member.member_level=='user'?"selected":"" }>user</option>
								<option value="user2" ${member.member_level=='user2'?"selected":"" }>user2</option>
							</select>
						</td>
						<th scope="col" class = "#">이메일수신여부</th>
						<td><c:out value="${member.email_alarm }"/></td>
					</tr>
					<tr>
						<th scope="col" class = "#">상태</th>
						<td>
							<select name ="esc_status" id="esc_status">
								<option value="Y" ${member.esc_status=='Y'?"selected":"" }>메일미인증</option>
								<option value="N"  ${member.esc_status=='N'?"selected":"" }>일반회원</option>
								<option value="E" ${member.esc_status=='E'?"selected":"" }>탈퇴회원</option>
							</select>
						</td>
						<th scope="col" class="#">보유포인트</th>
						<td>
						
						</td>
						
					</tr>
					
					
					</thead>
					<tbody>
					
					</tbody>
				
				</table>
				<br>
				<button type="button" onclick="updateMember()" class="update_btn">수정</button>
				
				<!-- </form> -->
			</div>
			<div class = "mypage_wrap2">
				
				<h2 class = "mypage_title02"><i class="shopping_Cart fas fa-shopping-cart"></i>구매목록</h2>
				<table class = "order_board">
					<colgroup>
						<col style = "width:18%;">
						<col style = "width:50%;">
						<col style = "width:10%;">
						<col style = "width:12%;">
						<col style = "width:10%;">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class = "#">번호</th>
						<th scope="col" class = "#">상품정보</th>
						<th scope="col" class = "#">상품금액</th>
						<th scope="col" class = "#">수량</th>
						<th scope="col" class = "#">총금액</th>
					</tr>
					</thead>
					
					
					<!-- 구매목록 작성칸 -->
					<tbody>
						<tr>
						<td colspan="5">장바구니가 비었습니다.</td>
						</tr>
					</tbody>
				
				</table>
			
			</div>
		</div>
	</div>

<script>
function updateMember(){ 
		
	    $.ajax({
	        url:"${pageContext.request.contextPath}/managementEnd.do",
	        type   : "post",
	     	
	        data:{"member_id" :  "${member.member_id}",
	        		"member_level" : $("#level").val(),
	        		 "esc_status" : $("#esc_status").val()
	       
	        },
	   		
	        success:function(data){
	        	if(data==1) {
	        		alert("수정완료!");
	        	}
	        	else{
	        		alert("수정실패");
	        	}
				
	        },
	        error:function(jpxhr,textStatus,errormsg){
	           console.log("ajax전송 실패")
	           console.log(jpxhr);
	           console.log(textStatus);
	           console.log(errormsg);
	        }
	     });
		
};
		
		

 
</script>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />