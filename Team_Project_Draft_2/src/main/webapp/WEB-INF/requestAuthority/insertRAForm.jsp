<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>
<%@include file="/WEB-INF/member/top.jsp" %>

<style>

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

a.com-link:hover {
    text-decoration: underline;
}

img {
  display: block;
  width: 90%;
  height: 80px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

.cart__list {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 60%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 15px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}



.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
 /*  background-color: lightgrey;  옵션 밑에 밑줄쳐짐*/
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
 border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

#cart__list__orderbtn{ 
background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: #ED0000;
  color: white;
  border: none;
}

input[type=checkbox], input[type=radio] {
    accent-color:red;
}


input[type=file]::file-selector-button {
     width: 150px;
     height: 30px;
     background: #fff;
     border: 1px solid rgb(77,77,77);
     border-radius: 10px;
     cursor: pointer;
   }
   input[type=file]::file-selector-button:hover {
     background: rgb(77,77,77);
     color: #fff;
   }
   .err{
     color:red;
     font-size:9pt;
     font-weight:bold;
}
</style>

<center>
<section class="cart">
<div><h2>판매자 권한 등록</h2></div>
<br><br>
<form:form commandName="rabean" action="insertRA.ra" method="post" enctype="multipart/form-data">
<table class="cart__list">
           <tr class="cart__list__detail">
              <th>아이디</th>
              <td><input type="text" value="${loginInfo.id}" name="id" readonly>
              
              </td>
			</tr>
			 
			<tr class="cart__list__detail"> 
			  <th>대표자명</th>
			  <td><input type="text" name="name" placeholder="대표자명을 입력하세요" value="${rabean.name}">
			  <form:errors cssClass="err" path="name"/>
			  </td>
			</tr>
			<tr class="cart__list__detail">  
			  <th>사업자명</th>
			  <td><input type="text" name="company" value="${loginInfo.company}" placeholder="사업자명을 입력하세요">
			  <form:errors cssClass="err" path="company"/>
			  </td>
			</tr>  
			<tr class="cart__list__detail">
			  <th>사업자 구분</th>
			  <td>
			  <input type="radio" value="개인" name="kind" <c:if test="${rabean.kind eq '개인'}">checked</c:if> > 개인&nbsp;&nbsp;&nbsp; 
    		  <input type="radio" value="법인" name="kind" <c:if test="${rabean.kind eq '법인'}">checked</c:if>> 법인&nbsp;&nbsp;&nbsp;
    		  <form:errors cssClass="err" path="kind"/>
			  </td>
			</tr>
			<tr class="cart__list__detail"> 
			  <th>사업자 등록증</th>
			  <td><input type="file" name="upload">
			  <form:errors cssClass="err" path="evidence"/>
			  </td>
			</tr>
			<tr class="cart__list__detail"> 
			  <th>사업자 등록 번호</th>
			  <td>
			  <input type="text" name="registrationno1" size="3" maxlength="3">-
 			  <input type="text" name="registrationno2" size="2" maxlength="2">-
 			  <input type="text" name="registrationno3" size="5" maxlength="5">
 			  <form:errors cssClass="err" path="registrationno1"/>
 			  <form:errors cssClass="err" path="registrationno2"/>
 			  <form:errors cssClass="err" path="registrationno3"/>
			  </td>
			</tr>
			<tr class="cart__list__detail">
			  <th>사업자 주소</th>
			  <td><input type="text" name="com_add" value="${loginInfo.com_add}" size="30">
			  <form:errors cssClass="err" path="com_add"/>
			  </td>
			</tr>
			<tr class="cart__list__detail">  
			  <th>사업자 연락처</th>
			  <td><input type="text" name="hp" value="${loginInfo.hp}">
			  <form:errors cssClass="err" path="hp"/>
			  </td>
           </tr>
</table>
		<div class="cart__mainbtns">
           <button type="submit" class="cart__bigorderbtn right">요청하기</button>
        </div>
</form:form>
</section>
</center>
<%@ include file="../member/bottom2.jsp" %>