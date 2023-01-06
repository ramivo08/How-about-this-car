<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="../common/common.jsp"%>
<!-- findid.jsp -->
<script type="text/javascript">

	//회원가입
	function register() {
		//alert(1);
		location.href="register.mem"; // MemberRegisterController
		
	}
	
</script>


 <title>아이디 찾기</title>
<style>

   .login {
       width: 500px;
       margin: 200px auto auto auto;
       text-align: center;
       margin-top: 30px;
	}

	.button-login1{
		border:0;    /*---테두리 정의---*/
		background-Color:#ffffff; /* 배경색 */
		color:#353535; /* 폰트색 */
		font-weight:bold;   /*--폰트 굵기---*/
		width:120;height:43px;  /*--버튼 크기---*/
	}
	.button-login1:hover {
    	border-bottom: 3px solid #D00000;
  	}
	
	.button-login2{
		border: 0;    /*---테두리 정의---*/
		background-Color:#ffffff; /* 배경색 */
		color:#7F7F7F; /* 폰트색 */
		width:120;height:43px;  /*--버튼 크기---*/
	}
	.button-login2:hover {
   		border-bottom: 3px solid #D00000;
  	}
  	
  	.button-id{
		border:0;    /*---테두리 정의---*/
		background-Color:#ED0000; /* 배경색 */
		color:#ffffff; /* 폰트색 */
		font-weight:bold;   /*--폰트 굵기---*/
		width:270;height:40;  /*--버튼 크기---*/
	}
	
	.name-input,.email-input{
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
  		width: 200;
  	}
</style>

<jsp:include page="/WEB-INF/member/top.jsp"/>

	<form action="findid.mem" method="post">
		<table height=120 align="center" >
		<tr>
			 <div class = "login" >
			 <br>
			        <h2 class = "title">아이디 찾기</h2>
			        <hr>
			        <br>
			        <p class = "name"><font color="#747474" size="3">&nbsp;&nbsp;&nbsp;이름</font>
			        <input class = "name-input" type="text" name="name" class="form-control rounded-4" id="floatingInput" placeholder="이름" required>
			        </p>
			        <p class = "email"><font color="#747474" size="3">이메일</font>
			        <input class = "email-input" type="text" name="email" class="form-control rounded-4" id="floatingPassword" placeholder="E-mail" required>
			      	</p><br>
			      	<input class="button-id" type="submit" value="아이디 찾기" >
			      	<br><br>
			        <hr>
			    </div>
			</tr>	
			<tr>
				<td colspan="2">
				<input class="button-login1" type="button" value="회원 가입" onClick="register();"> <font color="#7F7F7F">|</font>
				<input class="button-login2" type="button" value=" 로그인 홈" onClick="location.href='login.mem'"> <font color="#7F7F7F">|</font>
				<input class="button-login2" type="button" value="비밀번호 찾기" onClick="location.href='findpw.mem'">
				</td>
			</tr>
				
		</table>
		<br><br>
	</form>

<%@ include file="bottom2.jsp" %>
