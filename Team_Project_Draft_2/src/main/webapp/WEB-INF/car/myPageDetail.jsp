<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">
<meta name="description" content="">
<meta name="keywords" content="">
<link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:400,500i,700|Roboto:300,400,500,700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/aos.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/vendor/bootstrap.css">
<!-- Theme Style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
<title>Insert title here</title>
</head>
<style>
.goToMain {
	background-color: #ED0000; /* 빨간색 */
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 15px;
	margin-top: 5px;
	height: 50px;
	width: 120px;
	float: left;
}
.myPageA{
    color: #747474;
    text-decoration: none;
    background-color: transparent;
}

.myPageA:-webkit-any-link {
    color: #ED0000;
    cursor: pointer;
    text-decoration: none;
}

h5 > a {
    color: #747474;
}

.seller{
 color: black;
}

</style>
<body>

<jsp:include page="/WEB-INF/member/top.jsp"/>

<div class="untree_co--site-section">
          <div class="container">
            
            <div class="row justify-content-center text-center pt-0 pb-5">  
              <div class="col-lg-6 section-heading aos-init aos-animate" data-aos="fade-up">
              <p class="text-center">
                <br><h2>마이 페이지</h2>
               </p>
              </div>
            </div>

            <div class="row custom-row-02192 align-items-stretch">
              <div class="col-md-6 col-lg-4 mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                <div class="media-29191 text-center h-100"><a class="myPageA" href="memberListupdate.mem?num=${loginInfo.num}" class="readmore reverse">
                  <div class="media-29191-icon">
                    <img src="<%=request.getContextPath()%>/resources/images/profile.png" width="80px" height="80px">
                  </div>
                  <p>
                 <h5>내 프로필 보기</h5>
                <!--  href="myProfile.jsp" -->
                  </p></a>
                </div>
              </div>
             
          
              <div class="col-md-6 col-lg-4 mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100"><a class="myPageA" href="wishlist.mall">
                  <div class="media-29191-icon">
                    <img src="<%=request.getContextPath()%>/resources/images/cartlist.png" width="80px" height="80px">
                  </div>
                  <p><h5>찜한 목록보기</h5></p></a>
                </div>
              </div>
             
               
              <div class="col-md-6 col-lg-4 mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                <div class="media-29191 text-center h-100"><a class="myPageA" href="orderList.mall">
                  <div class="media-29191-icon">
                    <img src="<%=request.getContextPath()%>/resources/images/buying.png" width="80px" height="80px">
                  </div>
                  <p><h5>결제내역 보러가기</h5></p></a>
                </div>
              </div>
              
              <div class="col-md-6 col-lg-4 mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100"><a class="myPageA" href="myList.pq"> 
                  <div class="media-29191-icon">
                     <img src="<%=request.getContextPath()%>/resources/images/chatbot.png" width="80px" height="80px">
                  </div>
                  <p><h5>내 문의 목록</h5></p></a> <!-- 여기에 내 판매목록보러 가기, 1:1문의 목록보기 -->
                </div>
              </div>
              
             
			<div class="col-md-6 col-lg-4 mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100">
                  <div class="media-29191-icon">
                     <img src="<%=request.getContextPath()%>/resources/images/buypage.png" width="80px" height="80px">
                  </div>
                  <p><a href="#" class="myPageA"><h5>판매자 관리</h5></a></p>
                  <c:if test="${loginInfo.authority eq 1}">
                  <p><a class="myPageA" href="myCarList.ca"><font color="#757575" size="3">내 판매목록보기</font></a></p>
                  <p><a class="myPageA" href="#" onclick="goOneToOne('${loginInfo.id}')" id="OnetoOne"><font color="#757575">1:1 문의 목록보기</font></a></p>
                  </c:if>
                </div>
              </div>
           <c:if test="${rabean.status eq 0}"> <c:set var="requesting" value="2" /></c:if> <!-- 권한 요청 중이라면 임의로 변수를 설정해서 진행이 안되게 하기 위한 조건 -->
              
             <div class="col-md-6 col-lg-4 mb-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                <div class="media-29191 text-center h-100"><a class="myPageA" href="#" onclick="requestAuthority('${loginInfo.id}','${loginInfo.authority}','${requesting}')">
                  <div class="media-29191-icon">
                     <img src="<%=request.getContextPath()%>/resources/images/buy.png" width="80px" height="80px">
                  </div>
                  <p><h5>판매자 등록 요청</h5></p></a>
                   <p><a class="myPageA" href="#"><font color="#757575">판매자 여부(O/X) : 
                    <c:if test="${loginInfo.authority eq 0}">
                  		 &nbsp;&nbsp;X&nbsp;&nbsp;
                  		 
                  		 
                  		 <c:if test="${rabean.status eq 0}">
                   		(요청중)
                  		 </c:if>
					</c:if>
					<c:if test="${loginInfo.authority eq 1}">
					&nbsp;&nbsp;O&nbsp;&nbsp;
					</c:if>
					</font>
					</a></p>
                   
                </div>
              </div>
             
             
             
              
            </div>
          </div>
        </div>

    
    
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jarallax.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jarallax-element.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/ofi.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/aos.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.lettering.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.sticky.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/TweenMax.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/ScrollMagic.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/scrollmagic.animation.gsap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/debug.addIndicators.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript">

	function requestAuthority(id, authority, requesting) {
		
		if (requesting == 2) {
			alert("권한을 요청중입니다.");
		} else {

			if (authority == '1') {
				alert("이미 권한이 등록 되었습니다.");
				return;
			} else {
				location.href = "insertRA.ra?id=" + id;
			}
		}
	}

	function goOneToOne(id) {
		location.href = "list.pq?id=" + id;
	}
</script>
</body>
</html>
<%@ include file="../member/bottom2.jsp" %>
