<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />

</jsp:include>


<style>
.container {
	margin-right: auto;
	margin-left: auto;
	margin-top: 20px;
}

@media ( min-width : 992px) {
	.container {
		width: 970px;
	}
}

@media ( min-width : 1200px) {
	.container {
		width: 1060px;
	}
}



</style>
<!-- start menu -->
<link href="resources/css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>

<!-- top scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>

<div class="container">
	<div class="login">
		<div class="wrap">

			<div class="cont span_2_of_3">
				<div class="mens-toolbar">
					<div class="sort">
						<div class="sort-by">
							<label>Sort By</label> 
							<select>
								<option value="">인기순</option>
								<option value="">높은 가격부터</option>
								<option value="">낮은가격부터</option>
							</select> 
							
								<c:if test="${memberLoggedIn.member_level eq 'admin'}">
								
								<input style="float:right" type="button" value="상품 추가" id='btn-add' 
								class='btn btn-outline-success' onclick='fn_goboardForm();'/>
								</c:if>
						<script>
							function fn_goboardForm(){
								location.href="${pageContext.request.contextPath}/productupload.do";
							}
						</script>
						<br><br>
						</div>
						
					</div>
					<div class="pager"></div>
					<div class="clear"></div>
				</div>
				<div class="row">
					<c:forEach var='image' items='${list }' varStatus="vs">
						<div style=" cursor: pointer;width: 250px;height: 250px;" 
						onclick="location.href='${pageContext.request.contextPath }/productView.do?productCode=${image.product_code}'" class="col-3">
							<div>
								<div style="width: 200px; height: 150px;" class="css3">
									<img style="width: 100%; height: 100%;" src="${pageContext.request.contextPath }/resources/upload/productImg/${image.new_p_img_path }" />
								</div>
									<div>
										상품이름: ${image.product_name }
									</div>
									<div>
										가격 : ${image.price }
									</div>
									<div>
										별점										
									</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>


<a href="#" id="toTop" style="display: block;"><span id="toTopHover"
	style="opacity: 1;"></span></a>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />