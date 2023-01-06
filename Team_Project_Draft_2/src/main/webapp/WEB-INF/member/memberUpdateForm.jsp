<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<jsp:include page="/WEB-INF/member/top.jsp"/>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${path}/resources/js/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('roadAddress').value = fullRoadAddr;
				
        }
    }).open();
}

	
    var check_pw = false;
    
    $(function(){
    	$("input[name=pw]").keydown(function(){
    		check_pw = false;
    	})
    })	
	
     function pw_check(){
    	
    	var pw = $("input[name=pw]").val();
    	
    	var regexp = /^[a-z0-9]{3,12}$/;
    	var chk_num =  pw.search(/^[0-9]{3,12}$/);	
    	var chk_eng =  pw.search(/^[a-z]{3,12}$/);

    	if(pw.search(regexp) == -1){
    		//alert("3~12자리의 영소문자/숫자를 조합해 주세요");
    		$("#pspan").html("<font size=1>3~12자리의 영소문자/숫자를 조합해 주세요</font>");
			$('#pspan').show();
    		return false;
    	}
    	if(chk_num == 0 || chk_eng == 0){
    		//alert("3~12자리의 영소문자/숫자를 조합해 주세요");
    		$("#pspan").html("<font size=1>3~12자리의 영소문자/숫자를 조합해 주세요</font>");
			$('#pspan').show();
    		return false;
    	}
    	
    	check_pw = true;
    }
	
    function repw_check(){
    	if($("input[name=pw]").val() == $("input[name=repw]").val()){
    		$("#pwspan").html("<font color='blue' size=1>비밀번호 일치</font>");
    	}
    	else{
    		$("#pwspan").html("<font color='red' size=1>비밀번호 불일치</font>");
    	}
    }
	
    
</script>

<style type="text/css">
	.err{
	font-size: 7pt;
	color: red;
	font-weight: bold;
	}
	
	h2.title {
    margin: 0 auto;
    width: 500px;
    border-bottom: 1px solid #999;
    padding: 20px 0;
    text-align: center;
	}
	
	body {
	  margin: 0;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	table {
	  border-top: solid 1.5px black;
	  border-collapse: collapse;
	  border-left: none;
	  border-right: none;
	  width: 65%;
	  font-size: 14px;
	}
	
	td {
	  width:35;
	  padding-top: 15px;
	  padding-right: 10px;
	  padding-bottom: 15px;
	  padding-left: 30px;
	  border-bottom: 1px solid lightgrey;
	}
	
	#id_check{ 
	  background-color: #D5D5D5; /* 빨간색 */
	  color: #000000;
	  border: none;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 12px;
	  margin-top: 5px;
	}
	
	#btnSubmit{ 
	  background-color: #ED0000; /* 빨간색 */
	  color: white;
	  border: none;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 16px;
	  margin-top: 5px;
	}
	
	#btn-btn{ 
	  background-color: #ED0000; /* 빨간색 */
	  color: #ffffff;
	  border: none;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 12px;
	  margin-top: 5px;
	}
	
	input[type=checkbox], input[type=radio] {
    	accent-color:red;
	}
	
	#text-p{
		width: 82.5%;
	}
	#btn-btn-re{
		background-color: white;
	 	border: 1px lightgray solid;
	 	border-radius: 5px;
	    padding: 4px 8px;
	    font-size: 16px;
	  	margin-top: 5px;
	}
	
	.input-text-ymd{
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
	  	margin-top: 5px;
	  	width: 100;
	}
	.form-control-input{
	background-color: white;
	border: 1px lightgray solid;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 13px;
  	margin-top: 5px;
  	width: 200;
}

</style>

<title>회원가입</title>

	<div>
      <h2 align="center">내 정보 수정</h2>
    </div>
    <div id="text-p">
	<h5 align="right">*표시는 필수 입력 사항입니다.</h5>
	</div>

<center>
<form:form commandName="member" method="post" action="memberupdate.mem" name="f">
	<input type="hidden" name="num" value="${mbean.num}">
	<table >
		<tr>
			<td>아이디</td>
			<td>
			<input type="text" name="id" id="id"class="form-control-input" value="${mbean.id }" readonly>
			<span id="idMessage" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>*이름</td>
			<td><input type="text" class="form-control-input" name="name" value="${mbean.name }">
			<span id="namespan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>*비밀번호</td>
			<td>
			 <input type="password" name="pw" class="form-control-input" onBlur="return pw_check()" value="${mbean.pw }" required>
			 <span id="pspan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>*비밀번호 확인</td>
			<td>
			<input type="password" name="repw" onkeyup="repw_check()" class="form-control-input" required>
			<span id="pwspan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>*이메일</td>
			<td><input type="text" class="form-control-input" id="email" name="email" value="${mbean.email }">
			<span id="emailspan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
			<input type="radio" name="gender" id="gender" value="남자" <c:if test="${mbean.gender eq '남자' }">checked</c:if>>남자
			<input type="radio" name="gender" id="gender" value="여자" <c:if test="${mbean.gender eq '여자' }">checked</c:if>>여자
			</td>
		</tr>
		<tr>
			<td>*생년월일</td>
			<td>
			<input type="text" class="input-text-ymd" name="yy" size="4" maxlength="4" value="${mbean.yy }">/
			<input type="text" class="input-text-ymd" name="mm" size="2" maxlength="2" value="${mbean.mm }">/
			<input type="text" class="input-text-ymd" name="dd" size="2" maxlength="2" value="${mbean.dd }">
			<span id="yspan" style="font-size:20px; font-weight:bold;"></span>
			<span id="mspan" style="font-size:20px; font-weight:bold;"></span>
			<span id="dspan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>*핸드폰번호</td>
			<td>
			<input id="hp" class="form-control-input" name="hp" type="tel" maxlength="11" value="${mbean.hp }"/>
	          <label for="user_phone">'-' 제외하고 입력</label>
	          <span id="hpspan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>*주소</td>
			<td>
			<input type="text" class="form-control-input" id="postcode" name="addr_num" placeholder="우편번호" value="${mbean.addr_num }">
			<input type="button" id="btn-btn" class="btn btn-secondary" onclick="DaumPostcode()" value="우편번호 찾기">
			<span id="addrnumspan" style="font-size:20px; font-weight:bold;"></span>
			<span id="guide" style="color:#999"></span>
			</td>
		</tr>
		<tr>
			<td> </td>
			<td>
			<input type="text" class="form-control-input" id="roadAddress" name="addr_first" placeholder="도로명주소" value="${member.addr_first }">
			<input type="text" class="form-control-input" name="addr_last" placeholder="나머지 주소 작성" value="${member.addr_last }">
			<span id="addrlastspan" style="font-size:20px; font-weight:bold;"></span>
			</td>
		</tr>
		<tr>
			<td>회사명</td>
			<td><input type="text" class="form-control-input" name="company"></td>
		</tr>
		<tr>
			<td>회사주소</td>
			<td><input type="text" class="form-control-input" name="com_add"></td>
		</tr>
		
	</table>
	<br>
			<input type="reset" value="다시 입력" id="btn-btn-re" style="cursor: pointer;">
			<input type="submit" value="수정하기" id="btnSubmit" onclick=" onCheck()">
</form:form>
</center>


<%@ include file="bottom2.jsp" %>