<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<c:set var='path' value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<link rel="stylesheet" href="css/style.css">
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
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

  <style>
    .container {
      width: 1240px;
      max-width: none !important;
    }
  </style>
</head>


   <!-- 로그인 창을 뜨게하는 모달 구성 -->   
   <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" 
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
   </div>




<body>
  <!--헤더부분 시작-->
  <header>
    <div class="header">
      <!--그냥 row로 감싸면 사이드에 여백이 생기기 때문에 container-fluid로 전체를 감싸줘야 한다.-->
      <!-- 첫 번째 내비코드 시작 -->
      <div class="container">
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
            
              <li class="nav-item">
		           <button class="btn btn-outline-success my-2 my-sm-0" type="button" data-toggle="modal" 
		               data-target="#loginModal">로그인버튼이당</button>
	          </li>
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath}/memberLogin.do">로그인<i class="fas fa-sign-in-alt"></i></a>|</h5>
              </li>  
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath }/findMember.do">ID/비밀번호 찾기<i class="fas fa-search"></i></a>|</h5>
              </li>
              <li class="nav-item">
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath}/memberEnroll.do">회원가입<i class="far fa-handshake"></i></a>|</h5>
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
                <h5><a class="nav-link badge badge-light mr-3 ml-3" href="${pageContext.request.contextPath}/memberView.do">마이페이지 </a>|</h5>
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
      </div>
      
      <script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
      <!--첫 번째 메뉴 끝-->

      <!--두번 째 네비게이션 코드부분 시작-->

      <div class="container">
        <div class="row">
          <nav class="navbar navbar-expand-lg ">

            <div class="col-5">
              <a class="navbar-brand">
          <i class="fas fa-shuttle-van"></i>
          <i class="fas fa-plus"></i>
          <i class="fas fa-plane-arrival"></i>
          <i class="fas fa-plus"></i>
          <i class="fas fa-camera-retro"></i>로고
       </a>
            </div>

            <div class="col-7">
              <form class="form-inline">
                <div class="input-group">
                  <div class="input-group-btn">
                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            전체검색
          </button>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="#">제목+내용</a>
                      <a class="dropdown-item" href="#">제목</a>
                      <a class="dropdown-item" href="#">내용</a>
                    </div>
                  </div>
                  <input class="form-control col-9 mr-sm-2" style="width:350px;" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                  <button class="btn btn-outline-success my-2 my-sm-0" "type="submit "><i class="fas fa-search "></i></button>
          </form>
    </div>
  </div>

      </nav>
      </div>
      <!--두 번째 네비게이션 코드부분 끝-->
      
      
      <!-- 세번 째 네비게이션  전체보기 사이트맵 버튼 들어가있는 가로라인 메뉴 시작-->
      <div class="container ">
        <div class="row">
        <div class = "col-2">
        <ul class="nav mt-2 ">
              <button type= "button" class = "btn btn-primary" data-toggle = "collapse" data-target = "#demo">
                <i class="fas fa-bars"></i> 전체보기
              </button>     
 		</ul>
 		
 		
 		</div>
 		
 		
 			<nav class="navbar navbar-expand-lg  navbar-light bg-default mb-1">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="true" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active mr-3" href="#"><strong>홈</strong><span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link active mr-3" href="${path}/product.do"><strong>판매메뉴</strong></a>
      <a class="nav-item nav-link active mr-3" href="#"><strong>대여메뉴</strong></a>
      <a class="nav-item nav-link active mr-3" href="#"><strong>사이트소개</strong></a>
      <a class="nav-item nav-link active mr-3" href="#"><strong>상품명</strong></a>
      <a class="nav-item nav-link active mr-3" href="#"><strong>이벤트</strong></a>
      <a class="nav-item nav-link active mr-3" href="#"><strong>고객센터</strong></a>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <strong>테스트메뉴</strong>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">카테고리1</a>
          <a class="dropdown-item" href="#">카테고리2</a>
          <a class="dropdown-item" href="#">카테고리3</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <strong>테스트메뉴2</strong>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">카테고리1</a>
          <a class="dropdown-item" href="#">카테고리2</a>
          <a class="dropdown-item" href="#">카테고리3</a>
        </div>
      </li>
      
    </div>
  </div>
</nav>
 		
      </div>
      
      
  </div>

         
           
 


          <!--펼쳐봐 하위 사이트맵  div 부분 container 시작-->


          <div class = "collapse" id = "demo">
            <div class = "container" >

              <div class = "row" style = "text-align:center; background-color:" >

            <div class = "col-2 mt-3 ">
              <a href="#" class="list-group-item list-group-item-action border-0">
                <h5><strong>판매</strong></h5>
              </a>


            </div>
            <!--판매메뉴 div 끝-->


              <!--대여메뉴 div시작-->

              <div class = "col-2 mt-3">
                <a href="#" class="list-group-item list-group-item-action border-0">
                  <h5><strong>대여</strong></h5>
                </a>

              </div>

            <!--대여메뉴 div 끝-->

            <!--서비스메뉴 div시작-->
            <div class = "col-2 mt-3">
              <a href="#" class="list-group-item list-group-item-action border-0">
                <h5><strong>서비스</strong></h5>
              </a>

              <a href="#" class="list-group-item list-group-item-action border-0">
                카테고리1
              </a>
              <a href="#" class="list-group-item list-group-item-action border-0">
                카테고리2
              </a>
              <a href="#" class="list-group-item list-group-item-action border-0">
                카테고리3
              </a>
              <a href="#" class="list-group-item list-group-item-action border-0">
                카테고리4
              </a>
            </div>
          <!--서비스메뉴 div 끝-->

          <!--상품평메뉴 div시작-->
          <div class="col-2 mt-3">
            <a href="#" class="list-group-item list-group-item-action border-0">
              <h5><strong>상품평</strong></h5>
            </a>

            <a href="#" class="list-group-item list-group-item-action border-0">
              카테고리1
            </a>
            <a href="#" class="list-group-item list-group-item-action border-0">
              카테고리2
            </a>
            <a href="#" class="list-group-item list-group-item-action border-0">
              카테고리3
            </a>
            <a href="#" class="list-group-item list-group-item-action border-0">
              카테고리4
            </a>
</div>
        <!--상품평메뉴 div 끝-->

        <!--이벤트메뉴 div시작-->
        <div class="col-2 mt-3">
          <a href="#" class="list-group-item list-group-item-action border-0">
            <h5><strong>이벤트</strong></h5>
          </a>

          <a href="#" class="list-group-item list-group-item-action border-0">
            카테고리1
          </a>
          <a href="#" class="list-group-item list-group-item-action border-0">
            카테고리2
          </a>
          <a href="#" class="list-group-item list-group-item-action border-0">
            카테고리3
          </a>
          <a href="#" class="list-group-item list-group-item-action border-0">
            카테고리4
          </a>
</div>

      <!--이벤트메뉴 div 끝-->

      <!--고객센터 div시작-->
      <div class="col-2 mt-3">
        <a href="#" class="list-group-item list-group-item-action border-0">
          <h5><strong>고객센터</strong></h5>
        </a>
        <a href="#" class="list-group-item list-group-item-action border-0">
          카테고리1
        </a>
        <a href="#" class="list-group-item list-group-item-action border-0">
          카테고리2
        </a>
        <a href="#" class="list-group-item list-group-item-action border-0">
          카테고리3
        </a>
        <a href="#" class="list-group-item list-group-item-action border-0">
          카테고리4
        </a>
</div>

    <!--고객센터 div 끝-->


      </div><!--나누는 row div 끝-->
      </div><!--펼쳐봐 하위 사이트맵 container끝-->
    </div><!-- 펼치는 collapse<div> 끝-->
 </div><!-- div header부분 -->
  </header> 