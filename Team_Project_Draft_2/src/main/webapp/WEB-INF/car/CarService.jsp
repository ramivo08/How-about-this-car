<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/common.jsp"%>
<style>
#carService {
	min-height: 100%;
	position: relative;
	padding-bottom: 60px;
	padding-top: 50px;
	padding-left: 300px;
	padding-right: 300px;
}

.contentsContainer {
	width: 50%;
	float: left;
}

.serviceIMG {
	
}

.text-up {
	float: left;
}

.text-down {
	float: left;
}

.imgContainer {
	width: 50%;
	float: right;
}

.goAuthority {
	background-color: #ED0000; /* 빨간색 */
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 15px;
	margin-top: 5px;
	height: 70px;
	width: 150px;
	float: left;
}

*  {
	margin: 0;
	padding: 0;
}

.main-ul li {
	float: left;
	list-style: none;
	height:70px;
	margin: 50px;
}

.main-ul li a {
	display: block;
	width: 150px;
	height: 60px;
	background: #eaeaea;
	color: #000; border1px solid blue;
	font-weight:bold;
	font-size: 12px;
	font-family: "돋움";
	 text-align: center;
	padding-top: 10px;
	text-decoration: none;
}

.main-ul li a span {
	display: block;
}

.main-ul li .firstA:hover {
	background: red;
	text-decoration: none;
	color:white;
}
.mainContents{
padding-top:200px;
}
.Info1, .Info2, .Info3, .Info4, .Info5{
display:none;
background:#eaeaea;
color: #747474;
font-weight:normal;
}
.mainService{
	min-height: 100%;
	position: relative;
	padding-bottom: 200px;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".Info-button1").click(function() {
			$(".Info1").toggle('fast');

		});
		$(".Info-button2").click(function() {
			$(".Info2").toggle('fast');

		});
		$(".Info-button3").click(function() {
			$(".Info3").toggle('fast');

		});
		$(".Info-button4").click(function() {
			$(".Info4").toggle('fast');

		});
		$(".Info-button5").click(function() {
			$(".Info5").toggle('fast');

		});


	});
</script>
<script>
	function goAuthority(id, authority) {
		if (!id) {
			alert("로그인 후 이용해주세요.");
			return;
		} else if (id != null) {

			if (authority == '1') {
				alert("이미 권한이 등록 되었습니다.");
				return;
			} else {
				location.href = "insertRA.ra?id=" + id;
			}
		}
	}
</script>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<div class="mainService">
<div id="carService" align="center">
	<div class="contentsContainer">

		<h5 class="text-up">차량 판매 혹시 어려우신가요?</h5>
		<br> <br>
		<h2 class="text-down">이 차 어때에서 시작하세요.</h2>
		<br>
		<br> <input class="goAuthority" type="button" value="판매자 등록하기"
			onclick="goAuthority('${loginInfo.id}','${loginInfo.authority}')">
	</div>
	<div class="imgContainer">
		<img class="serviceIMG" width="400"
			src="<%=request.getContextPath()%>/resources/images/ServiceCar.png">
	</div>
	
	<div class="mainContents" align="center">
	<h3>차량 판매 과정</h3>
	<ul class="main-ul">
	 <li class="Info-button1"><a href="#" class="firstA">STEP 1<span>판매자 신청</span></a><a href="#" class="Info1"><span class="Info1">판매자 정보 입력 후 권한 신청</span></a></li>
 	<li class="Info-button2"><a href="#" class="firstA">STEP 2<span>판매 승인</span></a><a href="#" class="Info2"><span class="Info2">관리자 확인</span></a></li>
 	<li class="Info-button3"><a href="#" class="firstA">STEP 3<span>차량 등록</span></a><a href="#" class="Info3"><span class="Info3">차량 정보 등 입력 후 등록</span></a></li>
 	<li class="Info-button4"><a href="#" class="firstA">STEP 4<span>예약금 납부</span></a><a href="#" class="Info4"><span class="Info4">구매자의 금액 결제</span></a></li>
 	<li class="Info-button5"><a href="#" class="firstA">STEP 5<span>차량 인도</span></a><a href="#" class="Info5"><span class="Info5">차량 인도 및 명의 이전</span></a></li>
	</ul>
	</div>

</div>
</div>
<%@ include file="../member/bottom2.jsp" %>
