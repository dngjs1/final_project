<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>

<div class="footer-first">
            <div class="container">
                <div class="row pt-3">
                    <div class="col-md-3 col-12 scope-mag-box">
                        <h3><strong>여행관련쇼핑몰</strong></h3>
                        <p>여행에 관련된 모든 상품들을 검색해보고 직접 구매해보세요. 그리고 사용하지 않는 여행물품들을 올려서
                        	이용자들과 거래해보세요!</p>
                    </div>
                    <div class="col-md-3 col-12 mb-3 categories-box">
                        <h3><span class="heading"><strong>고객센터</strong></span></h3>
                        <table class="table table-hover table-border-0 ">
              <tr>
                <td><i class="fas fa-truck "></i> 주문/배송 조회</td>
              </tr>

              <tr>
                <td><i class="fas fa-times-circle "></i> 교환/반품 신청</td>
              </tr>

              <tr>
                <td><i class="fab fa-rocketchat "></i> 1:1 문의하기</td>
              </tr>

              <tr>
                <td><i class="fas fa-question "></i> 자주하는 질문보기</td>
              </tr>


          </table>
                    </div>
                    <style>
                    	.txt {
                    		    line-height: 9px;
                    		    font-size : 12px;
                    	}

                    </style>
                    <div class="col-md-3 col-12 list-box">
                        <h3><span class="heading"><strong>고객센터</strong></span></h3>
                        <span><h4><i class="fas fa-phone-volume"></i> 1600-1234</h4></span>
                        <span><p class = "txt"><em>평일</em> : 10:00 ~ 17:00</p></span>
                        <p class = "txt"></p>
                    </div>
                    <div class="col-md-3 col-12 list-box">
                        <h3><span class="heading"><strong>회사정보</strong></span></h3>
                        <ul class="pl-3">
                            <li>상호 : 여행쇼핑몰</li>
                            <li>대표 : 진근형</li>
                            <li>주소 : 서울 강서구 하늘길112 </li>
                            <li>개인정보관리자 : 진근형(abcd@naver.com)</li>
                            <li>사업자 등록번호 : 123-20-202020</li>
                            <li>통신판매업 신고 : 제 강서 - 3112호 </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container footer-second p-2 mt-2">
                <div class="row">
                    <div class="col-md-8 col-12">
                        © 2018 COPYRIGHT NOT NULL Project Team
                    </div>
                    <div class="col-md-4 col-12">
                        <nav aria-label="breadcrumb">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">이용약관</a></li>
                            <li class="breadcrumb-item"><a href="#">개인정보처리방침</a></li>
                            <li class="breadcrumb-item"><a href="#">1:1문의</a></li>
                            <li class="breadcrumb-item"><a href="#">자주묻는질문</a></li>
                            <li class="breadcrumb-item"><a href="#">이용안내</a></li>
                          </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

</footer>

 <style>
.footer-first{
	font-family: ubuntu;
	background: #fafafa;
	color: black;
}
.scope-mag-box p{
	color: #414141;
	font-size: 13px;
}
.categories-box .heading, .list-box .heading, .posts-box .heading{
	color: BLACK;
}
.categories-box .category-box{
	color: #8B8B8B;
	font-size: 11px;
	border: 1px solid #3F3F3F;
	border-radius: 2px;
	padding: 3px 4px;
}
.list-box ul{
	list-style: none;
	font-size: 12px;
}
.list-box ul li{
	border-bottom: 1px solid #303030;
	position: relative;
}
.list-box ul li::before{
	content: " ";
    width: 0;
    height: 0;
    border-top: 4px solid transparent;
    border-bottom: 4px solid transparent;
    border-left: 4px solid #3F3F3F;
    position: absolute;
    top: 305%;
    margin-top: -50px;
    left: -6%;
}
.list-box ul li a{
	text-decoration: none;
	color: #7F7F7F;
}
.posts-box .post-box{
	border-bottom: 1px solid #303030;
}
.posts-box .post-box img{
	height: 55px;
}
.posts-box .post-box h6{
	font-size: 13px;
}
.posts-box .post-box P{
	font-size: 8px;
	color: #505050;
}
.footer-second{
	color: #fff;
	background: #48453c;
	font-size: 12px;
}
.footer-second .breadcrumb{
	border-radius: 0px;
	padding:0px;
	background: none;
	margin: 0px;
}
.footer-second .breadcrumb li a{
	color: #fff !important;
	font-size: 12px;
	text-decoration: none;
}
.breadcrumb-item+.breadcrumb-item::before{
	color: #fff !important;
}

        </style>

</body>

</html>