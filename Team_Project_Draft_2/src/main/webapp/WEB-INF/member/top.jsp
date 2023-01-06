<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbars/">
<!-- <link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->


<style>

#dropdown04 {
    color: white;
    letter-spacing: -4px;
    margin-right: 10px;
}

#dropdown04:hover {
    opacity: 0.7;
}

</style>

<nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="Fourth navbar example">
    <div class="container-fluid">
      <a class="navbar-brand" href="main.mem"><!-- 로고누끼따야함.. --><img src="<%=application.getContextPath()%>/resources/images/logoMH.png" width="150" height="50"/></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample04">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="mainList.ca" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false">사고</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown04">
              <li><a class="dropdown-item" href="mainList.ca">비교하러 가기</a></li>
              <li><a class="dropdown-item" href="monthlyDealer.mall">이 달의 딜러왕</a></li>
            </ul>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false">팔고</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown04">
              <li><a class="dropdown-item" href="service.ca">차량 판매 서비스</a></li>
                 <c:if test="${loginInfo.authority eq 1}">
               <%-- 위의 내용은 loginInfo.authority가 1일 경우에 판매 등록 가능하기 노출되게 하기 위함임. --%>
               <li><a href="insertCar.ca" class="dropdown-item">판매 등록하기</a></li>
            </c:if>
            </ul>
          </li>
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false">후기</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown04">
              <li><a class="dropdown-item" href="list.reb">후기 보기</a></li>
              <li><a class="dropdown-item" href="youtube.reb">관련 영상 보러가기</a></li>
            </ul>
          </li>
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false">고객 만족</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown04">
              <li><a class="dropdown-item" href="list.fq">FAQ</a></li>
              <li><a class="dropdown-item" href="list.bd">이벤트&공지사항</a></li>
              <li><a class="dropdown-item" href="service.fq">고객 지원 서비스</a></li>
            </ul>
          </li>
          
          
        </ul>

        
        <form action="mainList.ca" method="post" style="vertical-align: bottom;
    margin: 0 10px;">
         <select name="whatColumn" style="display:none;">
         <option value="" selected="selected"/>
         </select>
          <input type="text" name="keyword" class="form-control form-control-dark" placeholder="통합 검색" aria-label="Search" onkeypress="JavaScript:press(this.form)">
      <%--   <img id="search" src="<%=request.getContextPath() %>/resources/img/검색3.png"/> --%>
        </form>
        
        <div class="text-end">
        <c:if test="${loginInfo.id eq 'admin'}">
      
      <button type="button" class="btn btn-warning" onclick="location.href='list.mem'"> Admin</button>
      </c:if>
        <c:if test="${loginInfo eq null}">
          <button type="button" class="btn btn-outline-light me-2" onclick="location.href='login.mem'"> Login</button>
          <button type="button" class="btn btn-warning" onclick="goRegister()">Sign-up</button>
          </c:if>
          <c:if test="${loginInfo ne null}">
          <button type="button" class="btn btn-outline-light me-2" onclick="location.href='logout.mem'"> Logout</button>
          <button type="button" class="btn btn-warning" onClick="myPage()">MyPage</a></button>
          </c:if>
        </div>
        
      </div>
    </div>
  </nav>


<script type="text/javascript">
   function myPage(){
      
   //   alert(0);
   
   location.href="myPage.ca"
   }

   function press(f){
       if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
              formname.submit(); //formname에 사용자가 지정한 form의 name입력
          }
   
   }
   function goRegister(){
	   if(confirm("회원가입을 하시겠습니까?")){
		   location.href="register.mem";
	   }
   }
</script>


<style type="text/css">

.body {
    margin: 0;
    font-family: var(--bs-font-sans-serif);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #dc3545;
    background-color: #fff;
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}

.navbar {
    margin-bottom: 30px;
}

.navbar {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    padding-top: 1rem;
    padding-bottom: 1rem;
    text-align: center;
}

.container-fluid {
    max-width: 1100px;
    margin: 0 auto;
    width: 100%;
}

nav {
    display: block;
}


.bg-dark {
    background-color: #dc3545!important;
}

/* @media (min-width: 768px)
.navbar-expand-md {
    flex-wrap: nowrap;
    justify-content: flex-start;
} 이건 무슨 적용인지 모르겠음 
*/




/* 검색창 로그인, 회원가입 */
.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    border-bottom-right-radius: 20px;
    border-top-left-radius: 20px;
}

.text-end {
    text-align: right!important;
}

[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
}

.btn-outline-light {
    color: #f8f9fa;
    border-color: #f8f9fa;
}

.me-2 {
    margin-right: 0.5rem!important;
}

.btn-warning {
    color: #000;
    background-color: #ffc107;
    border-color: #ffc107;
}

/* #pageButton{
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
} */


.btn {
    display: inline-block;
    font-weight: 400;
    line-height: 1.5;
    color: white;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    border-radius: 0.25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
footer {
   position: relative;
    margin: 40px auto 100px auto;
    max-width: 1100px;
    letter-spacing: -2px;
    text-align: center;
}

</style>

<title>이 차 어때?</title>
</head>
<body>

</body>
</html>