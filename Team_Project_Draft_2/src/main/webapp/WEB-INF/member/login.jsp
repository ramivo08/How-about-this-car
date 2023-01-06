<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	//회원가입

	function register() {
		if (confirm("회원가입 하시겠습니까?")) {

			location.href = "register.mem"; // MemberRegisterController
		}

	}

	//function saveToDos(token) { //item을 localStorage에 저장합니다. 
	//     typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
	// };

	/*  window.Kakao.init('c9f0709e1a36c281eef760936156d72a');
	 console.log(Kakao.isInitialized());
	 
	 function kakaoLogin() {
	 	//alert(22);
	     window.Kakao.Auth.login({
	         scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 id값
	         success: function(response) {
	             console.log(response) // 로그인 성공하면 받아오는 데이터
	             window.Kakao.API.request({ // 사용자 정보 가져오기 
	                 url: '/v2/user/me',
	                 success: (res) => {
	                    // const kakao_account = res.kakao_account;
	                     const name = res.kakao_account.profile.nickname;
	                     const email = res.kakao_account.email;
	                     
	                     console.log("로그인 성공");
	                     console.log("res:::",res.kakao_account);
	                     console.log("name:::",name);
	                     console.log("email::",email);
	                     
	                     $('#name').val(name);
	                     $('#email').val(email);
	                     var names = $('#name').val();
	                     var emails = $('#email').val();
	                     console.log("name::",names);
	                     console.log("email::",emails);
	                     document.getElementById('login_smt').submit(); 
	                     
	                 }
	             });
	             // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
	         },
	         fail: function(error) {
	             console.log(error);
	         }
	     });
	 }
	 
	 const login = document.querySelector('#kakaoLogin');
	 login.addEventListener('click', kakaoLogin);
	 */

	/*  success: (res)

	 res가 뭔지 먼저 찍어보고
	 const name = res.kakao_account.profile.nickname;

	 지금 여기랑 이메일이 그냥 복사한대로 쓰고 있었어서 

	 $('#name').val(name);
	 $('#email').val(email);
	 여기에 빈 값이 들어갔기 때문에 컨트롤러에서 안 나왔을 거야 */
</script>
	
<title>이차어때 Login</title>
<style>
       .login {
           width: 500px;
           height: 400px;
           margin: 200px auto auto auto;
           text-align: center;
           margin-top: 30px;
}	
	
	.button-login{
		border:0;    /*---테두리 정의---*/
		background-Color:#ED0000; /* 배경색 */
		color:#ffffff; /* 폰트색 */
		font-weight:bold;   /*--폰트 굵기---*/
		width:270;height:40;  /*--버튼 크기---*/
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
  	
  	.id-input,.pw-input{
  		border:1x solid #7F7F7F;    /*---테두리 정의---*/
  		width:200;height:30;  /*--버튼 크기---*/
  	}
  	
  	.id-input, .pw-input{
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


	<form action="login.mem" method="post" name="login_smt" id="login_smt">
			    <div class = "login" >
			        <h1 class = "title">Login</h1>
			        <hr>
			        <br>
			        <p class = "id" > <font class="id-font" color="#747474" size="2">&nbsp;&nbsp;&nbsp;아이디</font>
			        <input class = "id-input" type="text" name="id" placeholder="id"></p>
			        <p class = "pw" > <font class="pw-font" color="#747474" size="2">비밀번호</font>
			         <input class = "pw-input" type="password" name="pw" placeholder="pw"></p><br>
			      	<input class="button-login" type="submit" value="로그인" > <br><br>
			      	
			      	<input class="button-login1" type="button" value="회원 가입" onClick="register();"> <font color="#7F7F7F">|</font>
					<input class="button-login2" type="button" value="아이디 찾기" onClick="location.href='findid.mem'"> <font color="#7F7F7F">|</font>
					<input class="button-login2" type="button" value="비밀번호 찾기" onClick="location.href='findpw.mem'">
					<br><br>
			        <hr>
			    </div>
<!-- 		<table width=500 height=40 align="center"> 카카오 계정 x
			<tr>
				<td align="center">
				카카오 id,email
			      	<input type="hidden" name="name" id="name">
			      	<input type="hidden" name="email" id="email">
			      	<a href="javascript:kakaoLogin();">
			      	<img src="./resources/img/kakao_login.png" alt="카카오계정 로그인" style=" width:250; height: 50;"/>
			      	</a>
				</td>
			</tr>
			
		</table> -->
	<br><br><br>
	</form>
	
<%@ include file="bottom2.jsp" %>

