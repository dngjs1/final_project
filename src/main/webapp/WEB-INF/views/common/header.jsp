<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<c:set var='path' value="${pageContext.request.contextPath}"/>
<html>
<head>

<meta content="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Lato|Nanum+Gothic|Ubuntu" rel="stylesheet">
<!-- footer css외부참조파일 -->
<link rel="stylesheet" href="resources/css/index.css" type="text/css">
<link rel="stylesheet" href="resources/css/footer.css" type="text/css">

<!-- index css 외부참조파일 -->
  <title>파이널프로젝트 index</title>
  <!-- meta tags 필요 -->
  <meta charset="utf-8">
  <!--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">-->

  <!-- Bootstrap CSS -->
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

  <!--font Awesome 불러오기-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

  <!-- Optional JavaScript -->
  <!-- 먼저 jQuery가 오고 그 다음 Popper.js 그 다음 Bootstrap JS -->
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <!-- 카카오 로그인 버튼을 위한 개발자 자바스크립트 추가 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 
  <style>
    .container {
      width: 1240px;
      max-width: none !important;
    }
  </style>
</head>


   <!-- 로그인 창을 뜨게하는 모달 구성 -->   
  <%--  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" 
            aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <!--로그인폼 : https://getbootstrap.com/docs/4.1/components/forms/#overview -->
          <form action="${pageContext.request.contextPath}/memberLogin.do" method="post">
         <div class="modal-body">
             <input type="text" class="form-control" name="member_id" placeholder="아이디" required>
             <br />
             <input type="password" class="form-control" name="member_pw" placeholder="비밀번호" required>
         </div>
         <div class="modal-footer">
           <button type="submit" class="btn btn-outline-success" >로그인</button>
           <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
         </div>
        </form>
       </div>
     </div>
   </div> --%>




<body data-spy="scroll" data-target="#myScrollspy" data-offset="1" style = "font-family: 'Nanum Gothic','Ubuntu',sans-serif;">
  <!--헤더부분 시작-->
  
  <!-- 헤더 수정css 추가하는 부분 -->
  <style>
  .container_01 {
  	height : 140px;
  	padding-top : 50px;
  }
  .member_info {
  	width : 424px;
  	height : 30px;
  	margin-top : 14px;
  	float : left;
  }
  
  .member_info ul {
  	float : left;
  	height : 26px;
  	line-height : 26px;
  }
  
  .member_info ul li {
  	float : left;
  	min-height : 15px;
  	padding : 0 12px 0 0;
  	font-size : 11px;
  	
  }
  
  .member_info ul li a {
  	color : #202020;
  	font-size : 14px;
  	font-weight : 600;
  	text-decoration: none;
  	
  }
  
  .main_search {
  	margin :0;
  	float : left;
  	width : 500px;
  	text-align: center;
  }
  
  .input-group {
  	margin-left : 120px;
  	margin-top : 10px;
  	
  }
  
  .main_logo {
  	margin :0;
  	float : left;
  	width : 300px;
  	text-align: center;
  }
  
  .main_logo a {
  	font-size : 30px;
  	font-weight : bold;
  	text-decoration: none;
  	font-style : normal;
  	color : #717171;
  }
  
  .main_logo img {
  	max-width: 300px;
  	vertical-align: middle;
  }
  
  .main_info_right {
  	margin-top : 14px;
  	float : right;
  	margin-right : 17px;
  }
  
  .top_board {
  	float : left;
  
  }
  
  .top_board>ul>li {
  	padding-left: 12px;
  	line-height: 26px;
  	float : left;
  	font-size : 14px;
  }
  
  .top_board>ul>li a {
  	color : #202020;
  	font-weight: 600;
  	text-decoration: none;
  }
  
  .headerSearch {
  	position: relative;
  	margin-left : 20px;
  	float : left;
  	z-index: 999;
  }
  
  .top_menu {
  	position: relative;
  	width : 100%;
  	height : 57px;
  	border-top: 3px solid #202020;
  	border-bottom : 1px solid #ddd;

  	margin-bottom: 20px;
  	
  }
  
  .categorys {
  	width : 1240px;
  	height : 55px;
  	margin : 0 auto;
  	z-index : 999;
  }
  
  .topbtn {
  	position: fixed;
  	right : 12%;
  	bottom: 5%;
  	width : 36px;
  	padding : 12px 0 13px;
  	line-height: 1;
  	text-align: center;
  	text-decoration: none;
  	color : #fff;
  	background : #a6a6a6;
  	border-radius: 6px;
  	z-index: 1000;
  	display : none;
  }
  </style>
  
  <!-- 우측 하단 top버튼 스크립트 -->
  <script>
  

  $( document ).ready( function() {
    $( window ).scroll( function() {
      if ( $( this ).scrollTop() > 400 ) {
        $( '.topbtn' ).fadeIn();
      } else {
        $( '.topbtn' ).fadeOut();
      }
    } );
    $( '.topbtn' ).click( function() {
      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
      return false;
    } );
  } );

  
  </script>
  <header>
    <div class="header">
    <div>
    	<a href = "#" class = "topbtn" style = "display: none;">
    		<img src = "./resources/images/top.png">
    	</a>
    </div>
      <!--그냥 row로 감싸면 사이드에 여백이 생기기 때문에 container-fluid로 전체를 감싸줘야 한다.-->
      <!-- 첫 번째 내비코드 시작 -->
      <div class="container">
<<<<<<< HEAD
      
      
      <div class = "head">
      
      <div class = "container container_01">
      <!-- <div class = "member_info"> -->
      <div class = "main_logo">
      	<!-- 상단 우측 회원관련 정보 / 로그인 -->
      		<!-- <ul>
      			<li>
      				<a href = "#"></a>
      			</li>
      			
      			<li>
      				<a href = "#"></a>
      			</li>
      			
      			<li>
      				<a href = "#"></a>
      			</li>
      			
      			<li>
      				<a href = "#"></a>
      			</li>
      			
      			<li>
      			
      			</li>
      		
      		
      		
      		</ul> -->
      		
      		<a href = "#">
      	
      		<img src = "./resources/images/cat_logo.png">
      	
      	
      	</a>
      
=======
        <div class="row">
          <div class="col-6">
            <ul class="nav mt-1 ml-3">
              <li class="nav-item">
                <h5><a class="badge badge-success" href="#" id="favorite" title="즐겨찾기 등록"><i class="far fa-bookmark"></i> 즐겨찾기</a></h5>
              </li>
            </ul>
          </div>
          <div class="col-6">
          
          <c:if test="${memberLoggedIn==null }">
            <ul class="nav justify-content-end mt-1">
            
  
              <!-- <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" data-toggle="modal"  data-target="#loginModal">로그인<i class="fas fa-sign-in-alt"></i></a>|</h5>
              </li>  --> 
              
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath }/memberLoginBefore.do">로그인<i class="fas fa-sign-in-alt"></i></a>|</h5>
              </li>  
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath }/findMember.do">ID/비밀번호 찾기<i class="fas fa-search"></i></a>|</h5>
              </li>
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath}/memberAgree.do">회원가입<i class="far fa-handshake"></i></a>|</h5>
              </li>
              <!--  <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" ref="#" title="" 
                data-toggle="popover" data-placement="bottom" data-content="장바구니에 담겨있는 상품이 없습니다 " >장바구니 <i class="fas fa-cart-plus"></i> <span class="badge badge-success">0</span></a></h5>
              </li>  -->
              
             <!--  <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3 dropdown-toggle" ref="#" title="장바구니" 
                data-toggle="dropdown">장바구니 <i class="fas fa-cart-plus"></i></a></h5>
              </li> -->
			</ul>
			</c:if>
			<c:if test="${memberLoggedIn!=null }">
			<ul class="nav justify-content-end mt-1">
            	
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="#"><c:out value="${memberLoggedIn.member_name }"></c:out>님 환영합니다.	</a>|</h5>
              </li>
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath}/myPage.do">마이페이지 </a>|</h5>
              </li>
               <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" ref="#" title="" 
                data-toggle="popover" data-placement="bottom" data-content="장바구니에 담겨있는 상품이 없습니다 " >장바구니 <i class="fas fa-cart-plus"></i> <span class="badge badge-success">0</span></a>|</h5>
              </li>
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath}/memberLogout.do">로그아웃 </a>|</h5>
              </li>
              
             <!--  <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3 dropdown-toggle" ref="#" title="장바구니" 
                data-toggle="dropdown">장바구니 <i class="fas fa-cart-plus"></i></a></h5>
              </li> -->
			</ul>
			</c:if>
          </div>
        </div>
>>>>>>> SUPER_branch
      </div>
      
      
      <div class = "main_search">
      	<form class="form-inline">
                <div class="input-group">
                  <div class="input-group-btn">
                   
                    
                  </div>
                  <input class="form-control" style="width:350px;" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                  <button class="btn btn-outline-success" type = "submit" style = "margin-left:3px;"><i class="fas fa-search "></i></button>
                  </div>
          </form>
          
      </div>
      
      <div class = "main_info_right">
      	<div class = "top_board">
      	<c:if test="${memberLoggedIn==null }">
      		<ul>
      		
      			<li>
      				<a href = "${pageContext.request.contextPath }/memberLogin2.do">로그인</a>
      			</li>
      			
      			<li>
      				<a href = "${pageContext.request.contextPath }/findMember.do">ID/비밀번호 찾기</a>
      			</li>
      			
      			<li>
      				<a href = "${pageContext.request.contextPath}/memberAgree.do">회원가입</a>
      			</li>
      		</ul>
      		</c:if>
      		
      		<c:if test="${memberLoggedIn!=null }">
      		<ul>
      			<li>
      				<a><c:out value="${memberLoggedIn.member_name }"></c:out>님 환영합니다.</a>
      			</li>
      	
      			<li>
      				<a href = "${pageContext.request.contextPath}/myPage.do">마이페이지</a>
      			</li>
      			
      			<li>
      				<a href = "#">장바구니</a>
      			</li>
      			
      			<li>
      				<a href = "${pageContext.request.contextPath}/memberLogout.do">로그아웃</a>
      			</li>
      		</ul>
      		</c:if>
      		
      	</div>
      	
      	<!-- 검색상단 -->
      	<!-- <div class = "headerSearch">
      		<div class = "search_pop">
      		
      		</div>
      		
      		<div class = "search_pop_wrap">
      		
      		</div>
      	</div> -->
      </div>
      
      </div>
      
      <style>
      
      .categorytype-layer {
      	margin-left : 400px;
      	
      }
      .categorytype-layer >li {
      	position: relative;
      	padding : 4px 0;
      	z-index : 99;
      	float : left;
      }
      
       .categorytype-layer > li > a {
       	display : block;
       	padding : 0 19px;
       	font-size : 18px;
       	line-height : 13px;
       	font-weight: 600;
       	text-align: left;
       	color : #202020;
       	text-decoration: none;
       	
       }
       
       #categorys {
       	height : 55px;
       	margin : 0 auto;
       	z-index : 999;
       }
       
       .all_categories {
       	width : 40px;
       	height : 24px;
       	cursor : pointer;
       	background: url("./resources/images/all_btn.gif") no-repeat left;
       	float : left;
       	margin-left : 10px;
       	
       }
       
       .open_cate {
       	position: absolute;
       	top : 56px;
       	left : 0;
       	padding : 50px 0;
       	width : 100%;
       	border-bottom : 1px solid #303030;
       	background-color: #fcfcfb;
       	z-index : 101;
       }
       
       .openSection {
       	position: relative;
       	width : 1000px;
       	margin : 0 auto;
       	overflow: hidden;
       }
       
       .cateSection {
       	width : 190px;
       	height : 350px;
       	margin-right : 20px;
       	text-align: left;
       	float : let;
       	border-right: 1px solid #202020;
       	line-height: 1.2;
       }
      </style>
      <div class = "top_menu">
      	<div id = "categorys">
      	
      		<div class = "all">	
      			<!-- 전체카테고리 버튼-->
      			<div class = "all_categories"></div>
      			<!-- 전체테고리 버튼 end -->
      			
      			<script type = "text/javascript">

      		//전체카테고리 레이어 출력
      		var vi = "off";
      		$(function(){
      		    $(".all_categories").click(function(){
      		        if(vi == "off"){
      		            $(".open_cate").slideDown(300);
      		            vi = "on";
      		        }else{
      		            $(".open_cate").slideUp(300);
      		            vi = "off";
      		        }
      		    });
      		    $(".open_cate_close").click(function(){
      		         $(".open_cate").slideUp(300);
      		         vi = "off";
      		    });
      		    
      		});

      			
      			</script>
      			
      			<style>
      				.cateSection h3{
      					display:inline-block;
      					margin-bottom : 20px;
      					font-size : 13px;
      					color : #202020;
      					font-weight: bold;
      					font-size : 16px;
      					
      				}
      				
      				.cateSection ul li {
      					padding : 6px 0;
      				}
      				
      				.cateSection ul li a {
      					text-decoration: none;
      					font-size : 13px;
      					color : #666;
      					display : inline-block;
      				}
      			</style>
      			<div class = "wrap_default">
      			
      				<div class = "open_cate" style = "display:none;">
      					<div class = "openSection">
      					<!-- 메뉴1 -->
      						<div class = "cateSection">
      						<div>
      							<h3>여행쇼핑몰</h3>
      							<ul>
      								<li>
      									<a href = "#">회사소개</a>
      								</li>
      								<li>
      									<a href = "#">제휴문의</a>
      								</li>
      								<li>
      									<a href = "#">이용안내</a>
      								</li>
      							
      							</ul>
      							</div>
      							
      							<div class = "gnb2">
      								<h3>CS CENTER</h3>
      								<ul>
      									<li>
      										<a href = "#">공지사항</a>
      									
      									</li>
      										
      									
      									<li>
      									
      										<a href = "#">Q&A</a>
      									
      									</li>
      									
      									<li>
      										<a href = "#">FAQ</a>
      									
      									</li>
      								
      								
      								
      								</ul>
      						
      							
      							</div>
      						</div>
      					</div>
      				</div>
      			
      			</div>
      			<!-- 전체카테고리 end -->
      		</div>
      		
      		<div class = "lnb">
      				<ul class = "categorytype-layer">
      					<li>
      						<a href = "#">홈</a>
      					</li>
      					
      					<li>
      						<a href = "${path}/product.do">판매메뉴</a>
      					</li>
      					
      					<li>
      						<a href = "${path}/rentalMain.do">대여메뉴</a>
      					</li>
      					
      					<li>
      						<a href = "#">사이트소개</a>
      					</li>
      					
      					<li>
      						<a href = "${path}/infoMain.do">고객센터</a>
      					</li>
      				</ul>
      			</div>
      		
      	</div>
      	<!-- categorys -->
      </div>
		<!-- top-menu -->      
      </div>
      

      </div>
      

          
 </div><!-- div header부분 -->
  </header> 