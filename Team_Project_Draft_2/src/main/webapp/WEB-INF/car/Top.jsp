<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file = "../common/common.jsp" %>
	<script>
	function goSearch(){
	alert("검색하기 기능입니다.");
	}
	</script>
<style>
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}
#main-menu{
	width:100%
}
#main-menu>li {
	float: left;
	position: relative;
}

#main-menu>li>a {
	font-size: 1.15rem;
	color: rgba(0, 0, 0, 0.85);
	text-align: center;
	text-decoration: none;
	letter-spacing: 0.05em;
	display: block;
	padding: 14px 70px;
	border-right: 1px solid rgba(0, 0, 0, 0.15);
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
}

#main-menu>li:nth-child(1)>a {
	border-left: 1px solid rgba(0, 0, 0, 0.15);
}

#sub-menu {
	position: absolute;
	background: #182952;
	opacity: 0;
	visibility: hidden;
	transition: all 0.15s ease-in;
}

#sub-menu>li {
	padding: 16px 70px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.15);
}
#sub-menu>li:hover {
	  background-color: #fdf3f3;
  color: #d8a9a9;
  cursor : pointer;
}

#sub-menu>li>{
	color: rgba(255, 255, 255, 0.6);
	text-decoration: none;
	font-size:1.00rem;
}

#main-menu>li:hover #sub-menu {
	opacity: 1;
	visibility: visible;
}

#sub-menu>li>a:hover {
	text-decoration: none;
}
#sub-menu>li>a {
	text-decoration: none;
	color : #d8a9a9;
}

section {
	column-width: 15em;
	background: #dadadf;
	padding: 2em 15em;
}

input[type=text] {
  width: 200px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
input[type=button] {
  width: 50px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
  margin:2;
  
}
#btnSubmit{
  width: 100px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
  margin:2;
  
}
#btnSubmit2{
  width: 70px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
  margin:2;
  
}
#inputSearch{
  position: absolute;
  top: 40px;
  right: 16px;
  font-size: 13x;
  }
#logo{
  position: absolute;
  top: 17px;
  left: 83px;
  }
#loginMenu{
  position: absolute;
  top: 13px;
  right: 35px;
  font-size: 18px;
  }
#topCate{
  position: absolute;
  top: 20px;
  left: 400px;
  font-size: 18px;
}
#login{
font-size: 0.85rem;
text-decoration: none;
}
#chp1{
  width: 50px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
#chp2,#chp3{
  width: 70px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
td{
padding : 10px;
}

#pageButton{
	/* -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	 */
	margin: 20px auto;
	height:40px;
	width: 40px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
	font-weight: bold;
}

#pageButton{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}


#pageButton:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

/* #pageButton:link, #pageButton:visited {
     background-color: black;
     color: white;
     font-weight :bold;
     font-size: 15pt;
     padding: 15px 25px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
}
 #pageButton:hover, #pageButton:active {
     background-color: #FF4500;
} */
</style>
	<div id="logo">
		<a href="main.ca"><img src="resources/images/logo1-1.png" width="250" height="50"/></a>
	</div>
<div id="topCate">
	<nav role="navigation">
		<ul id="main-menu">
			<li><a href="mainList.ca">&nbsp;&nbsp;&nbsp;사고&nbsp;&nbsp;&nbsp;</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="submenu">비교하러 가기</a></li>
					<li><a href="#" aria-label="submenu">이 달의 딜러왕</a></li>
	
				</ul></li>
			<li><a href="">&nbsp;&nbsp;&nbsp;팔고&nbsp;&nbsp;&nbsp;</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="submenu">비교하러 가기</a></li>
					<li><a href="#" aria-label="submenu">판매자 보러가기</a></li>
				
				
					<c:if test="${loginInfo eq 1}">
					<%-- 위의 내용은 loginInfo.authority가 1일 경우에 판매 등록 가능하기 노출되게 하기 위함임. --%>
					
					<li><a href="insertCar.ca" aria-label="submenu">판매 등록하기</a></li>
					
					</c:if>
				</ul></li>
			<li><a href="#">&nbsp;&nbsp;&nbsp;비교&nbsp;&nbsp;&nbsp;</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="submenu">비교하러 가기</a></li>
					<li><a href="#" aria-label="submenu">동급매물 비교하기</a></li>
				</ul></li>
			<li><a href="#">&nbsp;커뮤니티&nbsp;</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="submenu">후기</a></li>
					<li><a href="#" aria-label="submenu">관련 영상 보러가기</a></li>
					<li><a href="#" aria-label="submenu">관련 기사 보러가기</a></li>
				</ul></li>
			<li><a href="#">&nbsp;&nbsp;게시판&nbsp;&nbsp;</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="submenu">FAQ</a></li>
					<li><a href="#" aria-label="submenu">공지사항</a></li>
					<li><a href="#" aria-label="submenu">이벤트</a></li>
				</ul></li>
		</ul>
	</nav>
	</div>
		<div id="loginMenu">
		
		<c:set var="loginInfo" value="1"/>
	<!-- 	위의 코드는 loginInfo가 null이 아닐 경우, 즉, 로그인이 될 경우 로그아웃과, 마이페이지가 노출되게 하기 위함임. -->
		
		
		<%-- 
		아래는 관리자 로그인 할 경우 관리자 전용 페이지로 가기 위한 조건
		<c:if test="${loginInfo.id eq 'admin'}">

		</c:if>
		 --%>
		
		<a href="list.mem" id="login">관리자 전용</a>&nbsp;&nbsp;&nbsp;
		<c:if test="${loginInfo eq null}">
		<a href="" id="login">로그인</a>&nbsp;&nbsp;&nbsp;<a href="" id="login">회원가입</a>
		</c:if>
		<c:if test="${loginInfo ne null}">
		<a href="logout.jsp" id="login">로그아웃</a>&nbsp;&nbsp;&nbsp;<a href="myPage.ca" id="login">마이 페이지</a>
		</c:if>
		</div>
		<div id="inputSearch">
		<form action="mainList.ca" method="post">
		<select name="whatColumn" style="display:none;">
			<option value="" selected="selected"/>
			</select>
		<input name="keyword" type="text" placeholder="통합 검색"> <input id="button" type="submit" value="검색">
		</form>
		</div>

