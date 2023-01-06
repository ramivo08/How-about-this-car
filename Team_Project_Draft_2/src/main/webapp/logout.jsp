<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
logout.jsp<br>

<% String Logout = request.getContextPath()+"/logout.mem"; 
	session.invalidate();
%>
	<a href="<%=Logout %>"> 로그아웃 </a> <br><br>
<%
/* 	session.invalidate();
	response.sendRedirect("logout.mem"); */
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redirect URI</title>
</head>
<body>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>

        window.Kakao.init('c9f0709e1a36c281eef760936156d72a');
        window.Kakao.Auth.setAccessToken(JSON.parse(sessionStorage.getItem('AccessKEY'))); //sessionStorage에 저장된 사용자 엑세스 토큰 받아온다.
        
        function kakaoLogout() {
        	alert(1);
            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                return;
            }
            Kakao.Auth.logout(function(response) {
                alert(response +' logout');
                window.location.href='request.getContextPath()+"/logout.mem"';
            });
        };

        function secession() {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function(response) {
                    console.log(response);
                    //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                    window.location.href='/logout.mem'
                },
                fail: function(error) {
                    console.log('탈퇴 미완료')
                    console.log(error);
                },
            });
        };

        const logout = document.querySelector('#kakaoLogout');
        const sion = document.querySelector('#secession');

        logout.addEventListener('click', kakaoLogout);
        sion.addEventListener('click', secession);
    </script>
    
    <a href="javascript:kakaoLogout();" id="kakaoLogout">로그아웃</a> | 
    <a href="#0" id="secession">탈퇴</a>
    
</body>
</html>