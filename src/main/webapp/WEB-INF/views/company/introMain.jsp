<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

	<style>
		.intro_main  img {
			margin-left: auto;
			margin-right: auto;
			width : 100%;
		}
		
		.main-timeline-section{
  position: relative; 
  width: 100%;  
  margin:auto; 
  height:300px;
}
.main-timeline-section .timeline-start,
.main-timeline-section .timeline-end{
  position: absolute;
  background:#F2635F;
  border-radius:100px;
  top:50%;
  transform: translateY(-50%);
  width:30px;
  height:30px;
}
.main-timeline-section .timeline-end{
  right:0px;
}
.main-timeline-section .conference-center-line{
  position: absolute;
  width:100%;
  height:5px;
  top:50%;
  transform: translateY(-50%);
  background:#F2635F;
}
.timeline-article{
    width: 20%;
    position: relative;
    min-height: 300px;
    float:right;
}
.timeline-article .content-date{
    position: absolute;
    top: 35%;
    left: -30px; 
    font-size:18px;
}
.timeline-article .meta-date{
    position: absolute;
    top: 50%;
    left: 0px;
    transform: translateY(-50%); 
    width:20px;
    height:20px;
    border-radius: 100%;
    background:#fff;
    border:1px solid #F2635F;
}
.timeline-article .content-box{
  box-shadow: 2px 2px 4px 0px #c1c1c1;
  border:1px solid #F2635F;
  border-radius: 5px;
  background-color: #fff;
  width: 180px;
  position: absolute;
  top: 60%;
  left: -80px; 
  padding:10px;
}
.timeline-article-top .content-box:before{
  content: " ";
  position:absolute; 
  left:50%;
  transform: translateX(-50%);
  top:-20px;
  border:10px solid transparent;
  border-bottom-color: #F2635F;
}
.timeline-article-bottom .content-date{
  top: 59%;
}
.timeline-article-bottom .content-box{
  top: 0%;
}
.timeline-article-bottom .content-box:before{
  content: " ";
  position:absolute; 
  left:50%;
  transform: translateX(-50%);
  bottom:-20px;
  border:10px solid transparent;
  border-top-color:#F2635F;
}

.title2 {
	margin : 0 0 27px;
	padding : 23px 0 27px;
	border-bottom: 1px solid #717171;
	color : #000;
	font-size : 24px;
	font-weight: bold;
}

.main-section{
	
	margin-top: 23px;
}
.detail-part{
	margin-bottom: 10px;
}
.image-part{
	background-color: #fff;
}
.image-part .user-img img{
	width:50%;
	margin-top:30px;
}
.user-name h2{
	margin-top:10px;
	font-size:22px;
	font-weight: bold;
	letter-spacing: 2px;
}
.information-button{
	margin-bottom:5px; 
}
.user-name p{
	font-size:20px;
}
.user-detail p{
	color:black;
	padding-left:30px;
	margin:5px;
}
.icon-section{
	margin:5px 0px;
	padding-bottom:10px;
}
.icon-section i{
	margin:0px 5px;
	background-color:#d2d2d2;
	color:black;
	border-radius: 50%;
	height:25px;
	width: 25px;
	padding-top:4px;
}
.icon-section .fa-facebook:hover{
	background-color: #425898;
	color:#fff;
}
.icon-section .fa-twitter:hover{
	background-color: #60A8ED;
	color:#fff;
}
.icon-section .fa-instagram:hover{
	background-color: #E73372;
	color:#fff;
}
.user-detail span{
	color:#b2b2b2;
}
.tab-head{
	padding: 10px;
}
.tab-content{
	padding-bottom: 10px;
}
.about-detail h5{
	margin-top: 10px;
}
.about-detail .website{
	margin-top:6px;
}
.contact-detail p{
	color:black;
	margin:5px;
}
	</style>
<div class = "container">

		<div class = "intro_main">
			<img src = "./resources/images/intro.jpg">
		</div>
		
			
		
		<div><h1 class = "title2"></h1></div>
			<div class="container main-section">
			
		<div class="row">
			<div class="col-4 text-center detail-part">
				<div class="row image-part m-0">
					<div class="col-lg-12 col-sm-12 col-12 user-img">
						<div class="">
							<img src="http://cfile2.uf.tistory.com/image/245D1E35555491862A0B75" class="border rounded-circle p-1">
						</div>
					</div>
					<div class="col-lg-12 col-sm-12 col-12 user-name">
						<h2>권나라</h2>
						<p>대표</p>
					</div>
					<!-- <div class="col-lg-12 col-sm-12 col-12 information-button">
						<a href="#" class="btn btn-success w-25">Follow</a>
						<a href="#" class="btn btn-danger w-25">Message</a>
					</div> -->
					
					
				</div>
			</div>
			<div class="col-lg-7">
				<div class="container" style = "width:80%;">
          <div class="row">
            <div class="col-5 bg-white rounded-top tab-head">
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a style = "text-decoration: none;"class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><b>인사말</b></a>
                </li>
                <style>
                #home-tab:disabled{
                	font-weight: none;
                	
                }
                
                #home-tab:visited {
                	font-weight: bold;
                }
                
                 #profile-tab:focus {
                 	font-weight: bold;
                 }
                </style>
                <li class="nav-item">
                  <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">대표소개</a>
                </li>
              </ul>
            </div>
            
            <div class="col-lg-12 bg-white">   
              <div class="tab-content mt-4" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="row">
                        <div class="col-lg-12">
                            <span>
                             		<p style = "font-weight: bold; font-size: 22px;">반갑습니다.</p>
                             		<p style = "font-weight: bold; color : #C5C5E6; font-size: 22px; ">Try Trip 인터넷쇼핑몰을 찾아주셔서 감사드립니다.</p>
                             		
                             		<p>2018년도 여행에 필요한 제품이 가득한 곳!이라는 슬로건을 내세워</p>
                             		<p>Try Trip이라는 쇼핑몰 이름으로 시작하게 되었습니다.</p>
                             		<br>
                             		
                             		<p>Try Trip은 국내뿐만 아니라 해외에서 제작한 여행관련 상품을 저렴한</p>
                             		<p>가격으로 고객님들께 서비스하도록 항상 노력하고 있습니다</p>
                             		<p>앞으로도 시시각각 변하는 시장 트렌드에 맞춰 고객 수요에 부응하는</p>
                             		<p>새로운 상품과 서비스로 여러분께 다가가도록 최선을 다하겠습니다</p>
                            </span>
                        </div>
                        <div style = "width:86%; text-align: right;">
                            
                            
                            <span style = "color : black; text-align: right; font-weight: bold;"><b>Try Trip 운영진 올림</b></span>
                           
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade contact-detail" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  <p class="text-info p-o"><strong>Contact & Postal Address</strong></p>
                  <p><strong>이름 : </strong><span>권나라</span></p>
                  <p><strong>회사번호 : </strong><span>(+82) 02-2020-2828</span></p>
                  <p><strong>이메일 : </strong><span>abc13@gmail.com</span></p>
                  <p><strong>회사주소 : </strong><span>서울시 강서구 하늘길</span></p>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
			</div>
		</div>
	</div>
		
		
		
		
		
		
		
			<div class="row">
			
			
		<div class="col-md-12 col-sm-12 col-xs-12">
		
		<h1 class = "title2">회사연혁</h1>
		
			<section class="main-timeline-section">
			    <div class="timeline-start"></div>
			    <div class="conference-center-line"></div>
			    <div class="conference-timeline-content">
				    <div class="timeline-article timeline-article-top">
				        <div class="content-date">
			          		<span><b>2018-12-01</b></span>
				        </div>
				        <div class="meta-date"></div>
				        <div class="content-box" style = "top:57%;">
				        	<p style = "margin:0px; text-align: center;"><b>여행사들과 제휴협약</b></p>
				        </div>
				    </div>

				    <div class="timeline-article timeline-article-bottom">
				        <div class="content-date">
			          		<span><b>2018-10-10</b></span>
				        </div>
				        <div class="meta-date"></div>
				        <div class="content-box" style = "top:28%;">
				        	<p style = "text-align: center; margin:0px;"><b>회원수 만명 돌파</b></p>
				        </div>
				    </div>
			      	 <div class="timeline-article timeline-article-top">
				        <div class="content-date">
			          		<span><b>2018-09-10</b></span>
				        </div>
				        <div class="meta-date"></div>
				        <div class="content-box" style = "top:56%;">
				        	<p style = "text-align: center; margin:0px;">
				        	<b>매출 1억원 돌파   <br> 여러 기업들과 <br> 제휴협약</b></p>
				        </div>
				    </div>

				    <div class="timeline-article timeline-article-bottom">
				        <div class="content-date">
			          		<span><b>2018-01-20</b></span>
				        </div>
				        <div class="meta-date"></div>
				        <div class="content-box" style = "top:28%;">
				        	<p style = "text-align: center; margin:0px;"><b>Try Trip 회사 설립</b></p>
				        </div>
				    </div> 
			   	</div>
			   	<div class="timeline-end"></div>
		  	</section>
		</div>
	</div>
	
</div><!-- 전체 컨테이너 끝 -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />